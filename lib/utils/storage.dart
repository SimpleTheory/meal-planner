import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dataclasses/dataclasses.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:nutrition_app/blocs/micro_blocs/saver.dart';
import 'package:nutrition_app/domain.dart';
import 'package:lecle_downloads_path_provider/lecle_downloads_path_provider.dart';
import 'package:nutrition_app/mydataclasses/metadata.dart';
import 'package:nutrition_app/utils.dart';
import 'package:path_provider/path_provider.dart';
// <editor-fold desc="Current Saving Setup">
Future<File> dataFile() async {
  final appDocumentDir = await getApplicationDocumentsDirectory();
  final path = appDocumentDir.path;
  return File('$path/data.json');
}

Future<void> saveApp(App app) async {
  final box = await Hive.openBox('master');
  // Perform read/write operations on the box
  box.put('app', app.toJson());
  // await box.close();
}

Future<void> wasThereEverHive(List thing) async {
  BackgroundIsolateBinaryMessenger.ensureInitialized(thing[1]);
  final file = await dataFile();
  if (file.existsSync()) {
    file.deleteSync();
  }
  file.writeAsStringSync(thing[0].toJson());
}

Future<App?> loadApp() async {
  final file = await dataFile();
  if (file.existsSync()) {
    try {
      final json = file.readAsStringSync();
      final result = App.fromJson(json);
      if (await Hive.boxExists('tempLog')) {
        applyOnAppAndSave(result);
      }
      return result;
    } on Exception catch (_) {
      print('why');
      // pass
    }
  }
  // <editor-fold desc="Atoning">
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
      final result = App(
          settings: Settings.fromJson(masterBox.get('settings')),
          diets: mapName(sortByOtherList<Diet>(
              instantiateAllDCFromBox(dietsBox),
              masterBox.get('diets order'),
                  (Diet obj) => obj.name)),
          meals: instantiateAllDCMap(mealsBox),
          baseIngredients: instantiateAllDCMap(ingredientsBox));
      Saver().app(result);
      atoningFractured();

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
      Saver().app(result);
      atoningFractured();
      return result;
    } catch (e) {
      return null;
    }
  }
// </editor-fold>
  else {
    return null;
  }
}

void atoningFractured()async{
  final box = await Hive.openBox('master');
  final box1 = await Hive.openBox('meals');
  final box2 = await Hive.openBox('ingredients');
  final box3 = await Hive.openBox('diets');
  box.deleteFromDisk();
  box1.deleteFromDisk();
  box2.deleteFromDisk();
  box3.deleteFromDisk();
}

// Future<App?> atoningForMyMistakes(){}
// void deletingMyMistakes(){}

void factoryResetApp() async {
  Hive.openBox('tempLog').then((value) => value.deleteFromDisk());
  final file = await dataFile();
  if (file.existsSync()) {
    file.deleteSync();
  }

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
  File file = File('${downloadsDirectory.path}/${(fileName)}.json');

  // Write the file
  // final temp = Stopwatch()..start();
  file.writeAsStringSync(app.toJson());
  // await file.writeAsString(app.toJson());
  // print(temp.elapsed);
  // print('file save time');

  // print('File saved to ${file.path}');
}

class Saver {
  static Saver? _instance;
  bool isSaving = false;
  SaverBloc? saverBloc;
  final RootIsolateToken root;

  // Private constructor
  Saver._(this.saverBloc, this.root);

  static messageIsApp(String message) => message == 'app';

  static messageIsDiet(String message) => message.contains(':');

  factory Saver.init(RootIsolateToken root, [SaverBloc? saverBloc]){
    if (_instance == null) {
      _instance = Saver._(saverBloc, root);
      return _instance!;
    }
    throw Exception('Saver instance already initialized');
  }

  factory Saver() {
    // _instance ??= Saver._();
    return _instance!;
  }

  Future<bool> app(App app) async {
    if (isSaving) {
      return false;
    }
    else {
      isSaving = true;
      compute(wasThereEverHive, [app, root])
          .whenComplete(() {
        isSaving = false;
        if (saverBloc != null) {
          saverBloc!.add(SavedApp());
        }
      });
      // saveAppWithIsolate(app, receivePort: receivePort);
      // receivePort.listen((message) {
      //   print('message');
      //   isSaving = false;
      //   saverBloc.add(SavedApp());
      // });
      return true;
    }
  }

  Future<bool> diet(Diet diet) async {
    if (isSaving) {
      return false;
    }
    else {
      isSaving = true;
      compute(saveDiet, diet).whenComplete(() {
        isSaving = false;
        if (saverBloc != null) {
          saverBloc!.add(SavedDiet('Diet: ${diet.name}'));
        }
      });
      return true;
    }
  }
}
// </editor-fold>

// <editor-fold desc="Factured Hive Try">
Future<void> saveDiet(Diet diet) async {
  final box = await Hive.openBox('diets');
  box.put(diet.name, diet.toJson());
}

void saveMeal(Meal meal) async {
  final box = await Hive.openBox('meals');
  box.put(meal.name, meal.toJson());
}

void deleteMealFromSave(Meal meal) async {
  final box = await Hive.openBox('meals');
  box.delete(meal.name);
}

void saveIngredient(Ingredient ingredient) async {
  final box = await Hive.openBox('ingredients');
  box.put(ingredient.name, ingredient.toJson());
}

void deleteIngredientFromSave(Ingredient ingredient) async {
  final box = await Hive.openBox('ingredients');
  box.delete(ingredient.name);
}

void deleteDietFromSave(Diet diet) async {
  final box = await Hive.openBox('diets');
  box.delete(diet.name);
}

void saveSettings(Settings settings) async {
  final box = await Hive.openBox('settings');
  box.put('settings', settings.toJson());
}

Future<void> saveDietsOrder(Iterable<Diet> diets) async {
  final box = await Hive.openBox('master');
  box.put('diets order', diets.map((e) => e.name).toList());
}

Future<void> fracturedSaveAll(App app) async {
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
  return mapName<T>(sorter(instantiateAllDCFromBox<T>(box), (T thing) {
    dynamic temp = thing;
    return (temp.name as String).toLowerCase();
  }));
}

List<String> boxNames = ['master', 'meals', 'diets', 'ingredients'];
List<String> masterBoxValues = ['diets order', 'settings', 'app'];
// </editor-fold>

// <editor-fold desc="CQRS Try">
class EventLog {
  String name;
  /// Contents of list must be Json-able!
  List args;
  late DateTime timeStamp;

  factory EventLog.dietLog({required String name, required Diet diet, required List args}) => EventLog(name: name, args: [diet.name, ...args]);
  factory EventLog.dayLog({required String name, required Diet diet, required Day day, required List args}) =>
      EventLog(name: name, args: [diet.name, int.parse(day.name) - 1, ...args]);

  void save() async {
    Hive.openLazyBox('auditTrail').then((value){
      value.add(toMap());
    });
    Hive.openBox('tempLog').then((value){
      value.add(toMap());
    });
  }

  //<editor-fold desc="Data Methods">
  EventLog({
    required this.name,
    required this.args,
    DateTime? timeStamp,
  }){
    this.timeStamp = timeStamp ?? DateTime.now();
  }


  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          (other is EventLog &&
              runtimeType == other.runtimeType &&
              equals(name, other.name) &&
              equals(args, other.args) &&
              equals(timeStamp, other.timeStamp)
          );


  @override
  int get hashCode => name.hashCode ^ args.hashCode ^ timeStamp.hashCode;


  @override
  String toString() {
    return 'EventLog{'
        'name: $name'
        'args: $args'
        'timeStamp: $timeStamp}';
  }


  EventLog copyWith({
    String? name_, List? args_, DateTime? timeStamp_,}) {
    return EventLog(
        name: name_ ?? name,
        args: args_ ?? List.from(args),
        timeStamp: timeStamp_ ?? timeStamp);
  }


  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'args': jsonify(args),
      'timeStamp': jsonify(timeStamp),
    };
  }

  factory EventLog.fromMap(Map<String, dynamic> map) {
    return EventLog(
      name: map['name'] as String,
      args: dejsonifyList(map['args']),
      timeStamp: DateTimeJson.fromMap(map['timeStamp']),
    );
  }

  String toJson() => jsonEncode(toMap());

  factory EventLog.fromJson(String json) => EventLog.fromMap(jsonDecode(json));


//</editor-fold>
}
void applyEvent(App app, EventLog event) {
  // Is currently re-saving event when applied that might have to be changed, I wish dart had decorators :(
  Diet retrieveDiet() => app.diets[event.args[0]]!;
  Day retrieveDay() => app.diets[event.args[0]]!.days[event.args[1]];
  final String trueName = event.name.contains('.') ? event.name.split('.')[1] : event.name;
  switch (trueName){
  /// args[0] first argument
  // <editor-fold desc="App">
  case "addMeal":
    // (Meal meal)
    app.addMeal(event.args[0], save: false);
    return;
  case "addBaseIngredient":
    // (Ingredient ingredient)
    app.addBaseIngredient(event.args[0], save: false);
    return;
  case "addDiet":
    // (Diet diet)
    app.addDiet(event.args[0], save: false);
    return;
  case "deleteMeal":
    // (Meal meal)
    app.deleteMeal(event.args[0], save: false);
    return;
  case "deleteBaseIngredient":
    // (Ingredient ingredient)
    app.deleteBaseIngredient(event.args[0], save: false);
    return;
  case "deleteDiet":
    // (Diet diet)
    app.deleteDiet(event.args[0], save: false);
    return;
  case "reorderDiet":
    // (int oldIndex, int newIndex)
    app.reorderDiet(event.args[0], event.args[1], save: false);
    return;
  case "updateSettings":
    app.updateSettings(event.args[0], save: false);
    return;
  // </editor-fold>

  /// Args[0] diet name, Args[1] first argument
  // <editor-fold desc="Diet">
  case "createDay":
    // ()
    retrieveDiet().createDay(save: false);
    return;
  case "removeDay":
    // (Day day)
    retrieveDiet().removeDay(event.args[1], save: false);
    return;
  case "reorderDay":
    // (int old, int new_)
    retrieveDiet().reorderDay(event.args[1], event.args[2], save: false);
    return;
  case "duplicateDay":
    // (int index)
    retrieveDiet().duplicateDay(event.args[1], save: false);
    return;

  case "updateDRIS":
    retrieveDiet().updateDRIS(event.args[1], save: false);
    return;
  // </editor-fold>

  /// Args[0] diet name, Args[1] day int, Args[2] first argument
  // <editor-fold desc="Day">
  case "addDayMeal":
    // (Meal meal)
    retrieveDay().addDayMeal(event.args[2], save: false);
    return;
  case "addDayMealFromIng":
    // (Ingredient ing)
    retrieveDay().addDayMealFromIng(event.args[2], save: false);
    return;
  case "deleteDayMeal":
    // (int index)
    retrieveDay().deleteDayMeal(event.args[2], save: false);
    return;
  case "updateMealServingSize":
    // (int index, String measure, num newAmount)
    retrieveDay().updateMealServingSize(event.args[2], event.args[3], event.args[4], save: false);
    return;
  case "reorderMeal":
    // (int oldIndex, int newIndex)
    retrieveDay().reorderMeal(event.args[2], event.args[3], save: false);
    return;
  case "replaceMealInDay":
    retrieveDay().replaceMealInDay(event.args[2], event.args[3], save: false);
  // </editor-fold>
  }
}
void applyOnAppAndSave(App app) async {
  final tempLog = await Hive.openBox('tempLog');
  Iterable<EventLog> events = tempLog.values.map(
          (e) => EventLog.fromMap(Map<String, dynamic>.from(e))
  );
  for (EventLog event in events){
    applyEvent(app, event);
  }
  Saver().app(app).whenComplete(() =>
    tempLog.deleteFromDisk().whenComplete(() =>
      Hive.openBox('tempLog').then((value) => value.close())
    )
  );

}
String scopeName([int farBack = 1]) {
  final regex = RegExp(r'\#1\s+([a-zA-Z0-9.]+)'.replaceFirst('1', farBack.toString()));
  final temp = StackTrace.current.toString();
  return regex.firstMatch(temp)!.group(1)!;
}
void saveEvent(List args) {
  EventLog(name: scopeName(2), args: args).save();
}





// </editor-fold>

//--------------------------------

// <editor-fold desc="CQRS Try">

// // <editor-fold desc="App">
// addMeal(Meal meal)
// addBaseIngredient(Ingredient ingredient)
// addDiet(Diet diet)
// deleteMeal(Meal meal)
// deleteBaseIngredient(Ingredient ingredient)
// deleteDiet(Diet diet)
// renameDiet(Diet diet, String newName)
// reorderDiet(int oldIndex, int newIndex)
// // </editor-fold>
//
// // <editor-fold desc="Diet">
// createDay()
// removeDay(Day day)
// reorderDay(int old, int new_)
// duplicateDay(int index)
// // </editor-fold>
//
// // <editor-fold desc="Day">
// addDayMeal(Meal meal)
// addDayMealFromIng(Ingredient ing)
// deleteDayMeal(int index)
// updateMealServingSize(int index, String measure, num newAmount)
// reorderMeal(int oldIndex, int newIndex)
// // </editor-fold>

// </editor-fold>