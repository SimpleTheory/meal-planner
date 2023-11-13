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

Box logBox()=>Hive.box(name: 'log', maxSizeMiB: 150);

Box appBox()=>Hive.box(name: 'app', maxSizeMiB: 150);

Future<void> newHive(List thing) async {
  BackgroundIsolateBinaryMessenger.ensureInitialized(thing[0]);
  Hive.defaultDirectory = thing[1];
  // Hive.registerAdapter('App', (json) => App.fromJson(json));
  final box = appBox();
  box.write((){
    box.putAll({
      'index': thing[2],
      'app': thing[3].toMap()
    });
  });
  box.close();


}

Future<App?> loadApp() async {
  // factoryResetApp();
  final appBox_ = appBox();
  final logBox_ = logBox();
  if (appBox_.isEmpty){
    return null;
  }
  // print(appBox_['index']);
  // print(logBox_.length);
  if (appBox_['index'] == logBox_.length){
    return App.fromMap(appBox_['app']);
  }
  return apply2(appBox_, logBox_);
}

void factoryResetApp() async {
  logBox().clear();
  appBox().clear();
}

Future<void> saveAppBackupMobile({String? fileName, required App app}) async {
  fileName ??= 'nut_app_backup.json';
  // Get the downloads directory
  Directory downloadsDirectory = (await DownloadsPath.downloadsDirectory())!;
  File file = File('${downloadsDirectory.path}/${(fileName)}.json');

  // Write the file
  // final temp = Stopwatch()..start();
  file.writeAsStringSync(app.toJson());
  // await file.writeAsString(app.toJson());
  // print(temp.elapsed);
  // print('file save time');
}

Future<void> saveBackupDesktop({required String filePath, required App app})async{
  final file = File(filePath);
  file.writeAsString(app.toJson());
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
      compute(newHive, [
        root, Hive.defaultDirectory!, logBox().length, app])
          .whenComplete(() {
        isSaving = false;
        if (saverBloc != null) {
          saverBloc!.add(SavedApp());
        }
      });
      return true;
    }
  }

}

/// The `EventLog` class represents a log entry for an event, with properties such
/// as name, arguments, and timestamp, and provides methods for saving and
/// converting the log entry.
class EventLog {
  String name;
  /// Contents of list must be Json-able!
  List args;
  late DateTime timeStamp;

  factory EventLog.dietLog({required String name, required Diet diet, required List args}) => EventLog(name: name, args: [diet.name, ...args]);
  factory EventLog.dayLog({required String name, required Diet diet, required Day day, required List args}) =>
      EventLog(name: name, args: [diet.name, int.parse(day.name) - 1, ...args]);

  void save() async {
    Hive.box(name: 'log').add(toMap());
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

/// The function `applyEvent` takes an `App` object and an `EventLog` object as
/// parameters and applies various actions based on the event name and arguments.
///
/// Args:
///   app (App): The `app` parameter is an instance of the `App` class. It
/// represents the application and contains various methods and properties related
/// to managing meals, ingredients, diets, and settings.
///   event (EventLog): The `event` parameter is of type `EventLog`, which
/// represents a log of events that need to be applied to the `App` object.
///
/// Returns:
///   In this code, the `applyEvent` function does not explicitly return anything.
/// Therefore, it implicitly returns `null`.
void applyEvent(App app, EventLog event) {
  Diet retrieveDiet() => app.diets[event.args[0]]!;
  Day retrieveDay() => app.dayFromId(event.args[0]);
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
    retrieveDiet().createDay(id: event.args[1], save: false);
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

  // <editor-fold desc="ShoppingList">
  case "reIndexItem":
    retrieveDiet().updateShoppingList();
    retrieveDiet().reIndexItem(event.args[1], event.args[2], event.args[3], event.args[4], save: false);
    return;
  case "reIndexList":
    retrieveDiet().reIndexList(event.args[1], event.args[2], save: false);
    return;
  case "reorderWithinList":
    retrieveDiet().updateShoppingList();
    retrieveDiet().reorderWithinList(event.args[1], event.args[2], event.args[3], save: false);
    return;
  case "moveSelectedItems":
    retrieveDiet().updateShoppingList();
    retrieveDiet().moveSelectedItems(event.args[1], List<MealComponent>.from(event.args[2]), save: false);
    return;
  // </editor-fold>

  // </editor-fold>

  /// Args[0] day id, Args[1] first argument
  // <editor-fold desc="Day">
  case "addDayMeal":
    // (Meal meal)
    retrieveDay().addDayMeal(event.args[1], save: false);
    return;
  case "duplicateDayMeal":
    retrieveDay().duplicateDayMeal(event.args[1], save: false);
    return;
  case "addDayMealFromIng":
    // (Ingredient ing)
    retrieveDay().addDayMealFromIng(event.args[1], save: false);
    return;
  case "deleteDayMeal":
    // (int index)
    retrieveDay().deleteDayMeal(event.args[1], save: false);
    return;
  case "updateMealServingSize":
    // (int index, String measure, num newAmount)
    retrieveDay().updateMealServingSize(event.args[1], event.args[2], event.args[3], save: false);
    return;
  case "reorderMeal":
    // (int oldIndex, int newIndex)
    retrieveDay().reorderMeal(event.args[1], event.args[2], save: false);
    return;
  case "replaceMealInDay":
    retrieveDay().replaceMealInDay(event.args[1], event.args[2], save: false);
  // </editor-fold>

  }
}

/// The function applies event logs to an app, sorts its ingredients and meals,
/// saves the app, and deletes the temporary log.
///
/// Args:
///   app [App]: The "app" parameter is an instance of the "App" class.
Future<App> apply2(Box appBox, Box log) async {
  final index = appBox['index'];
  final app = App.fromMap(appBox['app']);
  applyEventsList(app, log.getRange(index, log.length));
  Saver().app(app);
  return app;
}

void applyEventsList(App app, List events){
  for (Map<String, dynamic> event in events){
    applyEvent(app, EventLog.fromMap(event));
  }
}

/// App save event args [index, datetime, app]

/// The function `scopeName` returns the name of the scope at a specified level in
/// the call stack.
///
/// Args:
///   farBack (int): The `farBack` parameter is an optional parameter of type `int`
/// with a default value of `1`. It determines how far back in the stack trace the
/// regular expression should search for the scope name. If no value is provided for
/// `farBack`, it will default to `1`. Defaults to 1
///
/// Returns:
///   The function `scopeName` returns a string that matches the regular expression
/// pattern `\#1\s+([a-zA-Z0-9.]+)` in the current stack trace. The captured group 1
/// of the match is returned.
String scopeName([int farBack = 1]) {
  final regex = RegExp(r'\#1\s+([a-zA-Z0-9.]+)'.replaceFirst('1', farBack.toString()));
  final temp = StackTrace.current.toString();
  return regex.firstMatch(temp)!.group(1)!;
}
/// The function saves an event log with the given name and arguments.
///
/// Args:
///   args (List): The "args" parameter is a list that contains the arguments to be
/// passed to the EventLog constructor.
void saveEvent(List args) {
  EventLog(name: scopeName(2), args: args).save();
}

App totalRestoreFromLog(){
  final appBox_ = appBox();
  final log = logBox();
  App app = appBox_.containsKey('originalJson') ?
    App.fromJson(appBox_['originalJson']) :
    App.dummy();
  applyEventsList(app, log.getRange(0, log.length));
  return app;
}
