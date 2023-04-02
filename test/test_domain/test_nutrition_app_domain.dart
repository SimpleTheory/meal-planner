import 'dart:convert';
import 'package:nutrition_app/mydataclasses/metadata.dart';
import 'package:test/test.dart';
import 'package:dataclasses/dataclasses.dart';
import 'package:nutrition_app/domain.dart';

final AnthroMetrics anthroMetrics = AnthroMetrics(
    sex: Sex.M,
    age: 23,
    weight: 200,
    feet: 6,
    inches: 3,
    activity: Activity.Low_Active);
final Settings settings = Settings(anthroMetrics: anthroMetrics);
final App app =
    App(settings: settings, diets: {}, meals: {}, baseIngredients: {});

@CreateTests(App, 'app')
void appDataclassMethods() {
  group('App Dataclass Methods', () {
    test('App.toString()', () {
      String expectation =
          'App(settings: ${app.settings}, diets: ${app.diets}, meals: ${app.meals}, baseIngredients: ${app.baseIngredients})';
      expect(app.toString(), expectation);
    });

    test('App.toMap()', () {
      Map<String, dynamic> expectation = {
        "__type": "App",
        ...nestedJsonMap(app.attributes__)
      };
      expect(app.toMap(), expectation);
    });

    test('App == and copyWith', () {
      App copy = app.copyWithApp();
      bool eq = app == copy;
      expect(eq, true);
      expect(copy, app);
    });

    test('App.toJson()', () {
      String expectation = jsonEncode(app.toMap());
      expect(app.toJson(), expectation);
    });

    test('App.fromMap() and ==', () {
      Map<String, dynamic> map = app.toMap();
      App expectation = App.fromMap(map);
      expect(app, expectation);
    });

    test('App.fromJson() and ==', () {
      String json = app.toJson();
      App expectation = App.fromJson(json);
      expect(app, expectation);
    });

    test('App.staticConstructor()', () {
      App expectation = App.staticConstructor(
          settings: app.settings,
          diets: app.diets,
          meals: app.meals,
          baseIngredients: app.baseIngredients);
      expect(expectation.runtimeType, App);
    });
  });
}

@CreateTestTemplates(App, 'app')
void appTests() {
  group('App Tests', () {
    test('App.addMeal', () {
      // TODO: complete test
      // app.addMeal();
      // expect(result, expectation);
    });

    test('App.addBaseIngredient', () {
      // TODO: complete test
      // app.addBaseIngredient();
      // expect(result, expectation);
    });

    test('App.addDiet', () {
      // TODO: complete test
      // app.addDiet();
      // expect(result, expectation);
    });

    test('App.deleteMeal', () {
      // TODO: complete test
      // app.deleteMeal();
      // expect(result, expectation);
    });

    test('App.deleteBaseIngredient', () {
      // TODO: complete test
      // app.deleteBaseIngredient();
      // expect(result, expectation);
    });

    test('App.deleteDiet', () {
      // TODO: complete test
      // app.deleteDiet();
      // expect(result, expectation);
    });

    test('App.newApp', () {
      // TODO: complete test
      // App result = App.newApp();
      // expect(result, expectation);
    });
  });
}

@CreateTests(Settings, 'settings')
void settingsDataclassMethods() {
  group('Settings Dataclass Methods', () {
    test('Settings.toString()', () {
      String expectation =
          'Settings(apikey: ${settings.apikey}, appId: ${settings.appId}, darkMode: ${settings.darkMode}, anthroMetrics: ${settings.anthroMetrics})';
      expect(settings.toString(), expectation);
    });

    test('Settings.toMap()', () {
      Map<String, dynamic> expectation = {
        "__type": "Settings",
        ...nestedJsonMap(settings.attributes__)
      };
      expect(settings.toMap(), expectation);
    });

    test('Settings == and copyWith', () {
      Settings copy = settings.copyWithSettings();
      bool eq = settings == copy;
      expect(eq, true);
      expect(copy, settings);
    });

    test('Settings.toJson()', () {
      String expectation = jsonEncode(settings.toMap());
      expect(settings.toJson(), expectation);
    });

    test('Settings.fromMap() and ==', () {
      Map<String, dynamic> map = settings.toMap();
      Settings expectation = Settings.fromMap(map);
      expect(settings, expectation);
    });

    test('Settings.fromJson() and ==', () {
      String json = settings.toJson();
      Settings expectation = Settings.fromJson(json);
      expect(settings, expectation);
    });

    test('Settings.staticConstructor()', () {
      Settings expectation = Settings.staticConstructor(
          apikey: settings.apikey,
          appId: settings.appId,
          darkMode: settings.darkMode,
          anthroMetrics: settings.anthroMetrics);
      expect(expectation.runtimeType, Settings);
    });
  });
}

@CreateTestTemplates(Settings, 'settings')
void settingsTests() {
  group('Settings Tests', () {});
}

void main() {
  appDataclassMethods();
  appTests();
  settingsDataclassMethods();
  settingsTests();
}
