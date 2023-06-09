import 'dart:io';
import 'dart:isolate';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:nutrition_app/domain.dart';
import 'package:lecle_downloads_path_provider/lecle_downloads_path_provider.dart';
import 'package:nutrition_app/mydataclasses/metadata.dart';
import 'package:nutrition_app/utils.dart';
import 'package:path_provider/path_provider.dart';

void saveApp(App app) async {
  final box = await Hive.openBox('master');
  // Perform read/write operations on the box
  box.put('app', app.toJson());
  // await box.close();
}

Future<App?> loadApp() async {
  final boxExists = await Hive.boxExists('master');
  final facturedLoading = await Hive.boxExists('ingredients') ||
      await Hive.boxExists('meals') ||
      await Hive.boxExists('diets');
  if (facturedLoading) {
    final masterBox = await Hive.openBox('master');
    final ingredientsBox = await Hive.openBox('ingredients');
    final mealsBox = await Hive.openBox('meals');
    final dietsBox = await Hive.openBox('diets');
    try {
      return App(
          settings: Settings.fromJson(masterBox.get('settings')),
          diets: mapName(sortByOtherList<Diet>(
              instantiateAllDCFromBox(dietsBox),
              masterBox.get('diets order'),
              (Diet obj) => obj.name)),
          meals: instantiateAllDCMap(mealsBox),
          baseIngredients: instantiateAllDCMap(ingredientsBox));
    } catch (e) {
      //pass
      // print(e);
    }
  }
  if (boxExists) {
    try {
      final box = await Hive.openBox('master');
      final json = box.get('app');
      // await box.close();
      final result = App.fromJson(json);
      fracturedSaveAll(result);
      return result;
    } catch (e) {
      return null;
    }
  } else {
    return null;
  }
}

void factoryResetApp() async {
  final box = await Hive.openBox('master');
  final box1 = await Hive.openBox('meals');
  final box2 = await Hive.openBox('ingredients');
  final box3 = await Hive.openBox('diets');
  box.deleteFromDisk();
  box1.deleteFromDisk();
  box2.deleteFromDisk();
  box3.deleteFromDisk();

  // // Delete a key-value pair
  // box.delete('app');
  //
  // // Close the box
  // await box.close();
}

Future<void> saveAppBackupMobile({String? fileName, required App app}) async {
  fileName ??= 'nut_app_backup.json';
  // Get the downloads directory
  Directory downloadsDirectory = (await DownloadsPath.downloadsDirectory())!;
  // List<FileSystemEntity> files = downloadsDirectory.listSync();
  //
  // List<String> fileNames = files
  //     .where((entity) => entity is File) // Filter out directories
  //     .map((entity) => entity.path.split('/').last) // Extract file names
  //     .toList();
  // Create a File instance with the desired file name
  File file = File('${downloadsDirectory.path}/${(fileName)}');

  // Write the file
  await file.writeAsString(app.toJson());

  // print('File saved to ${file.path}');
}

void saveMeal(Meal meal) async {
  final box = await Hive.openBox('meals');
  box.put(meal.name, meal.toJson());
}

void deleteMeal(Meal meal) async {
  final box = await Hive.openBox('meals');
  box.delete(meal.name);
}

void saveIngredient(Ingredient ingredient) async {
  final box = await Hive.openBox('ingredients');
  box.put(ingredient.name, ingredient.toJson());
}

void deleteIngredient(Ingredient ingredient) async {
  final box = await Hive.openBox('meals');
  box.delete(ingredient.name);
}

List<Isolate> dietIsos = [];
void saveDietWithIsolate(Diet diet) async {
  RootIsolateToken rootIsolateToken = RootIsolateToken.instance!;
  if (dietIsos.isNotEmpty){
    dietIsos.forEach((element) {element.kill();});
    dietIsos = [];
  }
  final iso = await Isolate.spawn<Diet>((Diet diet)async{
    BackgroundIsolateBinaryMessenger.ensureInitialized(rootIsolateToken);
    // Get the path to the application documents directory
    final appDocumentDir = await getApplicationDocumentsDirectory();
    final path = appDocumentDir.path;
    // Initialize Hive in the spawned isolate
    Hive.init(path);
    saveDiet(diet);
    // print('saved ${diet.name}');
  }, diet);
  dietIsos.add(iso);
}

List<Isolate> appIsos = [];
void saveAppWithIsolate(App app) async {
  RootIsolateToken rootIsolateToken = RootIsolateToken.instance!;
  if (appIsos.isNotEmpty){
    for (Isolate element in appIsos) {element.kill();}
    appIsos = [];
  }
  final iso = await Isolate.spawn<App>((App app)async{
    BackgroundIsolateBinaryMessenger.ensureInitialized(rootIsolateToken);
    // Get the path to the application documents directory
    final appDocumentDir = await getApplicationDocumentsDirectory();
    final path = appDocumentDir.path;
    // Initialize Hive in the spawned isolate
    Hive.init(path);
    saveApp(app);
    fracturedSaveAll(app);
    print('saved app');
  }, app);
  appIsos.add(iso);
}

void saveDiet(Diet diet) async {
  final box = await Hive.openBox('diets');
  box.put(diet.name, diet.toJson());
}

void deleteDiet(Diet diet) async {
  final box = await Hive.openBox('meals');
  box.delete(diet.name);
}

void saveSettings(Settings settings) async {
  final box = await Hive.openBox('master');
  box.put('settings', settings.toJson());
}

void saveDietsOrder(Iterable<Diet> diets) async {
  final box = await Hive.openBox('master');
  box.put('diets order', diets.map((e) => e.name).toList());
}

void fracturedSaveAll(App app) {
  saveDietsOrder(app.diets.values);
  saveSettings(app.settings);
  for (Ingredient ing in app.baseIngredients.values) {
    saveIngredient(ing);
  }
  for (Meal meal in app.meals.values) {
    saveMeal(meal);
  }
  for (Diet diet in app.diets.values) {
    saveDiet(diet);
  }
}

List<T> instantiateAllDCFromBox<T>(Box box) {
  final result = <T>[];
  final type = T.toString();
  for (String value in box.values) {
    result.add(str2reflection[type]!.fromJson!(value));
  }
  return result;
}

Map<String, K> mapName<K>(Iterable<K> list) =>
    {for (dynamic k in list) k.name: k as K};

Map<String, T> instantiateAllDCMap<T>(Box box) {
  return mapName<T>(instantiateAllDCFromBox<T>(box));
}

List<String> boxNames = ['master', 'meals', 'diets', 'ingredients'];
List<String> masterBoxValues = ['diets order', 'settings', 'app'];
