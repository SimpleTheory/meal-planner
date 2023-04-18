import 'dart:convert';
import 'package:nutrition_app/mydataclasses/metadata.dart';
import 'package:test/test.dart';
import 'package:dataclasses/dataclasses.dart';
import 'package:nutrition_app/domain.dart';
import 'dart:io';

final AnthroMetrics anthroMetrics = AnthroMetrics(
    sex: Sex.M,
    age: 23,
    weight: 200,
    feet: 6,
    inches: 3,
    activity: Activity.Low_Active);
final apiKey =
    File('${Directory.current.path}\\.config\\nutritionix_api_key.txt');
final appId =
    File('${Directory.current.path}\\.config\\nutritionix_api_app_id.txt');
final Settings settings = Settings(
    anthroMetrics: anthroMetrics,
    apikey: apiKey.readAsStringSync(),
    appId: appId.readAsStringSync());
List<Ingredient> ingredients = [
  Ingredient.fromJson(
      '{"__type":"Ingredient","name":"milk","baseNutrient":{"__type":"BaseNutrients","grams":244,"nutrients":{"__type":"Nutrients","calcium":{"__type":"Nutrient","value":292.8,"unit":"mg","name":"Calcium"},"carbohydrate":{"__type":"Nutrient","value":11.712,"unit":"g","name":"Carbohydrate"},"cholesterol":{"__type":"Nutrient","value":19.52,"unit":"mg","name":"Cholesterol"},"calories":{"__type":"Nutrient","value":122,"unit":"kcal","name":"Calories"},"saturatedFat":{"__type":"Nutrient","value":3.0671,"unit":"g","name":"SaturatedFat"},"totalFat":{"__type":"Nutrient","value":4.8312,"unit":"g","name":"TotalFat"},"transFat":{"__type":"Nutrient","value":0.2074,"unit":"g","name":"TransFat"},"iron":{"__type":"Nutrient","value":0.0488,"unit":"mg","name":"Iron"},"fiber":{"__type":"Nutrient","value":0,"unit":"g","name":"Fiber"},"potassium":{"__type":"Nutrient","value":341.6,"unit":"mg","name":"Potassium"},"sodium":{"__type":"Nutrient","value":114.68,"unit":"mg","name":"Sodium"},"protein":{"__type":"Nutrient","value":8.052,"unit":"g","name":"Protein"},"sugars":{"__type":"Nutrient","value":12.3464,"unit":"g","name":"Sugars"},"choline":{"__type":"Nutrient","value":40.016,"unit":"mg","name":"Choline"},"copper":{"__type":"Nutrient","value":0.0146,"unit":"mg","name":"Copper"},"ala":{"__type":"Nutrient","value":0.0195,"unit":"g","name":"ALA"},"linoleicAcid":{"__type":"Nutrient","value":0,"unit":"g","name":"LinoleicAcid"},"epa":{"__type":"Nutrient","value":0,"unit":"g","name":"EPA"},"dpa":{"__type":"Nutrient","value":0,"unit":"g","name":"DPA"},"dha":{"__type":"Nutrient","value":0,"unit":"g","name":"DHA"},"folate":{"__type":"Nutrient","value":12.2,"unit":"µg","name":"Folate"},"magnesium":{"__type":"Nutrient","value":26.84,"unit":"mg","name":"Magnesium"},"manganese":{"__type":"Nutrient","value":0.0342,"unit":"mg","name":"Manganese"},"niacin":{"__type":"Nutrient","value":0.2245,"unit":"mg","name":"Niacin"},"phosphorus":{"__type":"Nutrient","value":224.48,"unit":"mg","name":"Phosphorus"},"pantothenicAcid":{"__type":"Nutrient","value":0.8686,"unit":"mg","name":"PantothenicAcid"},"riboflavin":{"__type":"Nutrient","value":0.4514,"unit":"mg","name":"Riboflavin"},"selenium":{"__type":"Nutrient","value":6.1,"unit":"µg","name":"Selenium"},"thiamin":{"__type":"Nutrient","value":0.0952,"unit":"mg","name":"Thiamin"},"vitaminE":{"__type":"Nutrient","value":0.0732,"unit":"mg","name":"VitaminE"},"vitaminA":{"__type":"Nutrient","value":134.2,"unit":"µg","name":"VitaminA"},"vitaminB12":{"__type":"Nutrient","value":1.2932,"unit":"µg","name":"VitaminB12"},"vitaminB6":{"__type":"Nutrient","value":0.0927,"unit":"mg","name":"VitaminB6"},"vitaminC":{"__type":"Nutrient","value":0.488,"unit":"mg","name":"VitaminC"},"vitaminD":{"__type":"Nutrient","value":2.928,"unit":"µg","name":"VitaminD"},"vitaminK":{"__type":"Nutrient","value":0.488,"unit":"µg","name":"VitaminK"},"zinc":{"__type":"Nutrient","value":1.1712,"unit":"mg","name":"Zinc"},"unsaturatedFat":{"__type":"Nutrient","value":1.7641,"unit":"g","name":"UnstauratedFat"}}},"altMeasures2grams":{"cup":244,"fl oz":30.5,"quart":976,"g":100,"tsp":5.08,"tbsp":15.25,"grams":1},"photo":{"__type":"Uri","url":"https://nix-tag-images.s3.amazonaws.com/377_highres.jpg"},"source":{"__type":"IngredientSource","__enum":true,"value":"IngredientSource.string"},"sourceMetadata":"milk"}'),
  Ingredient.fromJson(
      '{"__type":"Ingredient","name":"No Sugar Keto Cup, Dark Chocolate","baseNutrient":{"__type":"BaseNutrients","grams":17,"nutrients":{"__type":"Nutrients","calcium":{"__type":"Nutrient","value":10,"unit":"mg","name":"Calcium"},"carbohydrate":{"__type":"Nutrient","value":9,"unit":"g","name":"Carbohydrate"},"cholesterol":{"__type":"Nutrient","value":0,"unit":"mg","name":"Cholesterol"},"calories":{"__type":"Nutrient","value":70,"unit":"kcal","name":"Calories"},"saturatedFat":{"__type":"Nutrient","value":4.5,"unit":"g","name":"SaturatedFat"},"totalFat":{"__type":"Nutrient","value":7,"unit":"g","name":"TotalFat"},"transFat":{"__type":"Nutrient","value":0,"unit":"g","name":"TransFat"},"iron":{"__type":"Nutrient","value":1.3,"unit":"mg","name":"Iron"},"fiber":{"__type":"Nutrient","value":4,"unit":"g","name":"Fiber"},"potassium":{"__type":"Nutrient","value":35,"unit":"mg","name":"Potassium"},"sodium":{"__type":"Nutrient","value":0,"unit":"mg","name":"Sodium"},"protein":{"__type":"Nutrient","value":1,"unit":"g","name":"Protein"},"sugars":{"__type":"Nutrient","value":0,"unit":"g","name":"Sugars"},"choline":{"__type":"Nutrient","value":0,"unit":"mg","name":"Choline"},"copper":{"__type":"Nutrient","value":0,"unit":"mg","name":"Copper"},"ala":{"__type":"Nutrient","value":0,"unit":"g","name":"ALA"},"linoleicAcid":{"__type":"Nutrient","value":0,"unit":"g","name":"LinoleicAcid"},"epa":{"__type":"Nutrient","value":0,"unit":"g","name":"EPA"},"dpa":{"__type":"Nutrient","value":0,"unit":"g","name":"DPA"},"dha":{"__type":"Nutrient","value":0,"unit":"g","name":"DHA"},"folate":{"__type":"Nutrient","value":0,"unit":"µg","name":"Folate"},"magnesium":{"__type":"Nutrient","value":0,"unit":"mg","name":"Magnesium"},"manganese":{"__type":"Nutrient","value":0,"unit":"mg","name":"Manganese"},"niacin":{"__type":"Nutrient","value":0,"unit":"mg","name":"Niacin"},"phosphorus":{"__type":"Nutrient","value":0,"unit":"mg","name":"Phosphorus"},"pantothenicAcid":{"__type":"Nutrient","value":0,"unit":"mg","name":"PantothenicAcid"},"riboflavin":{"__type":"Nutrient","value":0,"unit":"mg","name":"Riboflavin"},"selenium":{"__type":"Nutrient","value":0,"unit":"µg","name":"Selenium"},"thiamin":{"__type":"Nutrient","value":0,"unit":"mg","name":"Thiamin"},"vitaminE":{"__type":"Nutrient","value":0,"unit":"mg","name":"VitaminE"},"vitaminA":{"__type":"Nutrient","value":0,"unit":"µg","name":"VitaminA"},"vitaminB12":{"__type":"Nutrient","value":0,"unit":"µg","name":"VitaminB12"},"vitaminB6":{"__type":"Nutrient","value":0,"unit":"mg","name":"VitaminB6"},"vitaminC":{"__type":"Nutrient","value":0,"unit":"mg","name":"VitaminC"},"vitaminD":{"__type":"Nutrient","value":0,"unit":"µg","name":"VitaminD"},"vitaminK":{"__type":"Nutrient","value":0,"unit":"µg","name":"VitaminK"},"zinc":{"__type":"Nutrient","value":0,"unit":"mg","name":"Zinc"},"unsaturatedFat":{"__type":"Nutrient","value":2.5,"unit":"g","name":"UnstauratedFat"}}},"altMeasures2grams":{"piece":17,"grams":1},"photo":{"__type":"Uri","url":"https://nutritionix-api.s3.amazonaws.com/5fb2849e5c1ca76c4b2019cb.jpeg"},"source":{"__type":"IngredientSource","__enum":true,"value":"IngredientSource.upc"},"sourceMetadata":687910000636}'),
  Ingredient.fromJson(
      '{"__type":"Ingredient","name":"pizza","baseNutrient":{"__type":"BaseNutrients","grams":107,"nutrients":{"__type":"Nutrients","calcium":{"__type":"Nutrient","value":201.16,"unit":"mg","name":"Calcium"},"carbohydrate":{"__type":"Nutrient","value":35.6631,"unit":"g","name":"Carbohydrate"},"cholesterol":{"__type":"Nutrient","value":18.19,"unit":"mg","name":"Cholesterol"},"calories":{"__type":"Nutrient","value":284.62,"unit":"kcal","name":"Calories"},"saturatedFat":{"__type":"Nutrient","value":4.7776,"unit":"g","name":"SaturatedFat"},"totalFat":{"__type":"Nutrient","value":10.3683,"unit":"g","name":"TotalFat"},"transFat":{"__type":"Nutrient","value":0.2579,"unit":"g","name":"TransFat"},"iron":{"__type":"Nutrient","value":2.6536,"unit":"mg","name":"Iron"},"fiber":{"__type":"Nutrient","value":2.461,"unit":"g","name":"Fiber"},"potassium":{"__type":"Nutrient","value":184.04,"unit":"mg","name":"Potassium"},"sodium":{"__type":"Nutrient","value":639.86,"unit":"mg","name":"Sodium"},"protein":{"__type":"Nutrient","value":12.1873,"unit":"g","name":"Protein"},"sugars":{"__type":"Nutrient","value":3.8306,"unit":"g","name":"Sugars"},"choline":{"__type":"Nutrient","value":17.548,"unit":"mg","name":"Choline"},"copper":{"__type":"Nutrient","value":0.1124,"unit":"mg","name":"Copper"},"ala":{"__type":"Nutrient","value":0.1873,"unit":"g","name":"ALA"},"linoleicAcid":{"__type":"Nutrient","value":0.0032,"unit":"g","name":"LinoleicAcid"},"epa":{"__type":"Nutrient","value":0.0043,"unit":"g","name":"EPA"},"dpa":{"__type":"Nutrient","value":0.0043,"unit":"g","name":"DPA"},"dha":{"__type":"Nutrient","value":0,"unit":"g","name":"DHA"},"folate":{"__type":"Nutrient","value":99.51,"unit":"µg","name":"Folate"},"magnesium":{"__type":"Nutrient","value":25.68,"unit":"mg","name":"Magnesium"},"manganese":{"__type":"Nutrient","value":0.3852,"unit":"mg","name":"Manganese"},"niacin":{"__type":"Nutrient","value":4.0928,"unit":"mg","name":"Niacin"},"phosphorus":{"__type":"Nutrient","value":231.12,"unit":"mg","name":"Phosphorus"},"pantothenicAcid":{"__type":"Nutrient","value":0,"unit":"mg","name":"PantothenicAcid"},"riboflavin":{"__type":"Nutrient","value":0.2087,"unit":"mg","name":"Riboflavin"},"selenium":{"__type":"Nutrient","value":21.293,"unit":"µg","name":"Selenium"},"thiamin":{"__type":"Nutrient","value":0.4173,"unit":"mg","name":"Thiamin"},"vitaminE":{"__type":"Nutrient","value":0.8881,"unit":"mg","name":"VitaminE"},"vitaminA":{"__type":"Nutrient","value":73.83,"unit":"µg","name":"VitaminA"},"vitaminB12":{"__type":"Nutrient","value":0.4494,"unit":"µg","name":"VitaminB12"},"vitaminB6":{"__type":"Nutrient","value":0.0856,"unit":"mg","name":"VitaminB6"},"vitaminC":{"__type":"Nutrient","value":1.498,"unit":"mg","name":"VitaminC"},"vitaminD":{"__type":"Nutrient","value":0,"unit":"µg","name":"VitaminD"},"vitaminK":{"__type":"Nutrient","value":7.169,"unit":"µg","name":"VitaminK"},"zinc":{"__type":"Nutrient","value":1.4338,"unit":"mg","name":"Zinc"},"unsaturatedFat":{"__type":"Nutrient","value":5.5907,"unit":"g","name":"UnstauratedFat"}}},"altMeasures2grams":{"slice":107,"pizza":853,"large slice":170,"medium slice":80,"small slice":65,"large pizza":853,"medium pizza":640,"small pizza":390,"personal pan pizza":225,"personal pan pizza slice":56.25,"g":100,"wt. oz":28.3495,"grams":1},"photo":{"__type":"Uri","url":"https://nix-tag-images.s3.amazonaws.com/1060_highres.jpg"},"source":{"__type":"IngredientSource","__enum":true,"value":"IngredientSource.string"},"sourceMetadata":"pizza"}')
];
Map<String, Meal> meals = {
  'pizza meal': Meal(
      name: 'pizza meal',
      ingredients: [
        ingredients[2].toMealComponent('medium slice', 3, ingredients[2])
      ],
      isSubRecipe: true),
  'breaky': Meal(
      name: 'breaky',
      ingredients: [
        ingredients[1].toMealComponent('grams', 50, ingredients[1]),
        ingredients[0].toMealComponent('grams', 100, ingredients[0])
      ],
      isSubRecipe: false)
};
final Meal pizzaMeal = meals['pizza meal']!; // Meal for tests
final Ingredient milk = ingredients[0]; // Ingredient for test
final Day day = Day(
    name: '1',
    meals: meals.values
        .map((value) => value.toMealComponent('serving', 1, value))
        .toList());
final Diet diet = Diet(
    name: 'first_diet',
    days: [day],
    dris: DRIS.fromJson(
        '{"__type":"DRIS","calcium":{"name":"Calcium","dri":1000,"upperLimit":2500,"unit":"mg","note":null},"carbohydrate":{"name":"Carbohydrate","dri":358,"upperLimit":518,"unit":"g","note":null},"cholesterol":{"name":"Cholesterol","dri":null,"upperLimit":300,"unit":"mg","note":null},"calories":{"name":"Calories","dri":2867.4,"upperLimit":3186,"unit":"kcal","note":null},"totalFat":{"name":"Total Fat","dri":71,"upperLimit":124,"unit":"g","note":null},"iron":{"name":"Iron","dri":8,"upperLimit":45,"unit":"mg","note":null},"fiber":{"name":"Total Fiber","dri":38,"upperLimit":null,"unit":"g","note":null},"potassium":{"name":"Potassium","dri":3400,"upperLimit":null,"unit":"mg","note":null},"sodium":{"name":"Sodium","dri":1500,"upperLimit":3000,"unit":"mg","note":null},"protein":{"name":"Protein","dri":73,"upperLimit":160,"unit":"g","note":null},"sugars":{"name":"Sugars","dri":null,"upperLimit":36,"unit":"g","note":null},"choline":{"name":"Choline","dri":0.55,"upperLimit":3.5,"unit":"g","note":null},"copper":{"name":"Copper","dri":900,"upperLimit":10000,"unit":"mcg","note":null},"ala":{"name":"α-Linolenic Acid","dri":1.6,"upperLimit":null,"unit":"g","note":null},"linoleicAcid":{"name":"Linoleic Acid","dri":17,"upperLimit":null,"unit":"g","note":null},"epa":{"name":"EPA","dri":200,"upperLimit":1800,"unit":"mg","note":null},"dpa":{"name":"DPA","dri":50,"upperLimit":null,"unit":"mg","note":null},"dha":{"name":"DHA","dri":200,"upperLimit":1800,"unit":"mg","note":null},"folate":{"name":"Folate","dri":400,"upperLimit":1000,"unit":"mcg","note":null},"magnesium":{"name":"Magnesium","dri":400,"upperLimit":null,"unit":"mg","note":null},"manganese":{"name":"Manganese","dri":2.3,"upperLimit":11,"unit":"mg","note":null},"niacin":{"name":"Niacin","dri":16,"upperLimit":35,"unit":"mg","note":null},"phosphorus":{"name":"Phosphorus","dri":0.7,"upperLimit":4,"unit":"g","note":null},"pantothenicAcid":{"name":"Pantothenic Acid","dri":5,"upperLimit":null,"unit":"mg","note":null},"riboflavin":{"name":"Riboflavin","dri":1.3,"upperLimit":null,"unit":"mg","note":null},"selenium":{"name":"Selenium","dri":55,"upperLimit":400,"unit":"mcg","note":null},"thiamin":{"name":"Thiamin","dri":1.2,"upperLimit":null,"unit":"mg","note":null},"vitaminE":{"name":"Vitamin E","dri":15,"upperLimit":1000,"unit":"mg","note":null},"vitaminA":{"name":"Vitamin A","dri":900,"upperLimit":3000,"unit":"mcg","note":null},"vitaminB12":{"name":"Vitamin B12","dri":2.4,"upperLimit":null,"unit":"mcg","note":null},"vitaminB6":{"name":"Vitamin B6","dri":1.3,"upperLimit":100,"unit":"mg","note":null},"vitaminC":{"name":"Vitamin C","dri":90,"upperLimit":2000,"unit":"mg","note":null},"vitaminD":{"name":"Vitamin D","dri":15,"upperLimit":100,"unit":"mcg","note":null},"vitaminK":{"name":"Vitamin K","dri":120,"upperLimit":null,"unit":"mcg","note":null},"zinc":{"name":"Zinc","dri":11,"upperLimit":40,"unit":"mg","note":null},"transFat":{"name":"Trans Fat","dri":null,"upperLimit":1,"unit":"g","note":null},"unsaturatedFat":{"name":"Unsaturated Fat","dri":63.9,"upperLimit":124,"unit":"g","note":null},"saturatedFat":{"name":"Saturated Fat","dri":null,"upperLimit":35.4,"unit":"g","note":null}}'));
final MealComponent threeMediumSlices =
    ingredients[2].toMealComponent('medium slice', 3, ingredients[2]);

final App app = App(
    settings: settings,
    diets: {'first diet': diet},
    meals: meals,
    baseIngredients: {for (Ingredient ing in ingredients) ing.name: ing});

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

@CreateTests(Meal, 'pizzaMeal')
void mealDataclassMethods() {
  group('Meal Dataclass Methods', () {
    test('Meal.toString()', () {
      String expectation =
          'Meal(name: ${pizzaMeal.name}, ingredients: ${pizzaMeal.ingredients}, servings: ${pizzaMeal.servings}, isSubRecipe: ${pizzaMeal.isSubRecipe}, photo: ${pizzaMeal.photo}, notes: ${pizzaMeal.notes})';
      expect(pizzaMeal.toString(), expectation);
    });

    test('Meal.toMap()', () {
      Map<String, dynamic> expectation = {
        "__type": "Meal",
        ...nestedJsonMap(pizzaMeal.attributes__)
      };
      expect(pizzaMeal.toMap(), expectation);
    });

    test('Meal == and copyWith', () {
      Meal copy = pizzaMeal.copyWithMeal();
      bool eq = pizzaMeal == copy;
      expect(eq, true);
      expect(copy, pizzaMeal);
    });

    test('Meal.toJson()', () {
      String expectation = jsonEncode(pizzaMeal.toMap());
      expect(pizzaMeal.toJson(), expectation);
    });

    test('Meal.fromMap() and ==', () {
      Map<String, dynamic> map = pizzaMeal.toMap();
      Meal expectation = Meal.fromMap(map);
      expect(pizzaMeal, expectation);
    });

    test('Meal.fromJson() and ==', () {
      String json = pizzaMeal.toJson();
      Meal expectation = Meal.fromJson(json);
      expect(pizzaMeal, expectation);
    });

    test('Meal.staticConstructor()', () {
      Meal expectation = Meal.staticConstructor(
          name: pizzaMeal.name,
          ingredients: pizzaMeal.ingredients,
          servings: pizzaMeal.servings,
          isSubRecipe: pizzaMeal.isSubRecipe,
          photo: pizzaMeal.photo,
          notes: pizzaMeal.notes);
      expect(expectation.runtimeType, Meal);
    });
  });
}

@CreateTestTemplates(Meal, 'pizzaMeal')
void mealTests() {
  group('Meal Tests', () {
    test('Meal.baseIngredients', () {
      // TODO: complete test
      // List<MealComponent> result = pizzaMeal.baseIngredients();
      // expect(result, expectation);
    });
  });
}

@CreateTests(Ingredient, 'milk')
void ingredientDataclassMethods() {
  group('Ingredient Dataclass Methods', () {
    test('Ingredient.toString()', () {
      String expectation =
          'Ingredient(name: ${milk.name}, baseNutrient: ${milk.baseNutrient}, altMeasures2grams: ${milk.altMeasures2grams}, photo: ${milk.photo}, source: ${milk.source}, sourceMetadata: ${milk.sourceMetadata})';
      expect(milk.toString(), expectation);
    });

    test('Ingredient.toMap()', () {
      Map<String, dynamic> expectation = {
        "__type": "Ingredient",
        ...nestedJsonMap(milk.attributes__)
      };
      expect(milk.toMap(), expectation);
    });

    test('Ingredient == and copyWith', () {
      Ingredient copy = milk.copyWithIngredient();
      bool eq = milk == copy;
      expect(eq, true);
      expect(copy, milk);
    });

    test('Ingredient.toJson()', () {
      String expectation = jsonEncode(milk.toMap());
      expect(milk.toJson(), expectation);
    });

    test('Ingredient.fromMap() and ==', () {
      Map<String, dynamic> map = milk.toMap();
      Ingredient expectation = Ingredient.fromMap(map);
      expect(milk, expectation);
    });

    test('Ingredient.fromJson() and ==', () {
      String json = milk.toJson();
      Ingredient expectation = Ingredient.fromJson(json);
      expect(milk, expectation);
    });

    test('Ingredient.staticConstructor()', () {
      Ingredient expectation = Ingredient.staticConstructor(
          name: milk.name,
          baseNutrient: milk.baseNutrient,
          altMeasures2grams: milk.altMeasures2grams,
          photo: milk.photo,
          source: milk.source,
          sourceMetadata: milk.sourceMetadata);
      expect(expectation.runtimeType, Ingredient);
    });
  });
}

@CreateTestTemplates(Ingredient, 'milk')
void ingredientTests() {
  group('Ingredient Tests', () {
    test('Ingredient.fromApi', () {
      // TODO: complete test
      // Future<Ingredient> result = Ingredient.fromApi();
      // expect(result, expectation);
    });

    test('Ingredient.fromResponseBody', () {
      // TODO: complete test
      // Ingredient result = Ingredient.fromResponseBody();
      // expect(result, expectation);
    });

    test('Ingredient.baseIngredients', () {
      // TODO: complete test
      // dynamic result = milk.baseIngredients();
      // expect(result, expectation);
    });
  });
}

@CreateTests(Day, 'day')
void dayDataclassMethods() {
  group('Day Dataclass Methods', () {
    test('Day.toString()', () {
      String expectation = 'Day(name: ${day.name}, meals: ${day.meals})';
      expect(day.toString(), expectation);
    });

    test('Day.toMap()', () {
      Map<String, dynamic> expectation = {
        "__type": "Day",
        ...nestedJsonMap(day.attributes__)
      };
      expect(day.toMap(), expectation);
    });

    test('Day == and copyWith', () {
      Day copy = day.copyWithDay();
      bool eq = day == copy;
      expect(eq, true);
      expect(copy, day);
    });

    test('Day.toJson()', () {
      String expectation = jsonEncode(day.toMap());
      expect(day.toJson(), expectation);
    });

    test('Day.fromMap() and ==', () {
      Map<String, dynamic> map = day.toMap();
      Day expectation = Day.fromMap(map);
      expect(day, expectation);
    });

    test('Day.fromJson() and ==', () {
      String json = day.toJson();
      Day expectation = Day.fromJson(json);
      expect(day, expectation);
    });

    test('Day.staticConstructor()', () {
      Day expectation = Day.staticConstructor(name: day.name, meals: day.meals);
      expect(expectation.runtimeType, Day);
    });
  });
}

@CreateTestTemplates(Day, 'day')
void dayTests() {
  group('Day Tests', () {
    test('Day.addDayMeal', () {
      // TODO: complete test
      // day.addDayMeal();
      // expect(result, expectation);
    });

    test('Day.deleteDayMeal', () {
      // TODO: complete test
      // day.deleteDayMeal();
      // expect(result, expectation);
    });

    test('Day.updateMealServingSize', () {
      // TODO: complete test
      // day.updateMealServingSize();
      // expect(result, expectation);
    });
  });
}

@CreateTests(Diet, 'diet')
void dietDataclassMethods() {
  group('Diet Dataclass Methods', () {
    test('Diet.toString()', () {
      String expectation =
          'Diet(name: ${diet.name}, days: ${diet.days}, dris: ${diet.dris})';
      expect(diet.toString(), expectation);
    });

    test('Diet.toMap()', () {
      Map<String, dynamic> expectation = {
        "__type": "Diet",
        ...nestedJsonMap(diet.attributes__)
      };
      expect(diet.toMap(), expectation);
    });

    test('Diet == and copyWith', () {
      Diet copy = diet.copyWithDiet();
      bool eq = diet == copy;
      expect(eq, true);
      expect(copy, diet);
    });

    test('Diet.toJson()', () {
      String expectation = jsonEncode(diet.toMap());
      expect(diet.toJson(), expectation);
    });

    test('Diet.fromMap() and ==', () {
      Map<String, dynamic> map = diet.toMap();
      Diet expectation = Diet.fromMap(map);
      expect(diet, expectation);
    });

    test('Diet.fromJson() and ==', () {
      String json = diet.toJson();
      Diet expectation = Diet.fromJson(json);
      expect(diet, expectation);
    });

    test('Diet.staticConstructor()', () {
      Diet expectation = Diet.staticConstructor(
          name: diet.name, days: diet.days, dris: diet.dris);
      expect(expectation.runtimeType, Diet);
    });
  });
}

@CreateTestTemplates(Diet, 'diet')
void dietTests() {
  group('Diet Tests', () {
    test('Diet.createDay', () {
      // TODO: complete test
      // diet.createDay();
      // expect(result, expectation);
    });

    test('Diet.removeDay', () {
      // TODO: complete test
      // diet.removeDay();
      // expect(result, expectation);
    });

    test('Diet.getShoppingList', () {
      // TODO: complete test
      // List<MealComponent> result = diet.getShoppingList();
      // expect(result, expectation);
    });
  });
}

@CreateTests(MealComponent, 'threeMediumSlices')
void mealComponentDataclassMethods() {
  group('MealComponent Dataclass Methods', () {
    test('MealComponent.toString()', () {
      String expectation =
          'MealComponent(reference: ${threeMediumSlices.reference}, grams: ${threeMediumSlices.grams})';
      expect(threeMediumSlices.toString(), expectation);
    });

    test('MealComponent.toMap()', () {
      Map<String, dynamic> expectation = {
        "__type": "MealComponent",
        ...nestedJsonMap(threeMediumSlices.attributes__)
      };
      expect(threeMediumSlices.toMap(), expectation);
    });

    test('MealComponent == and copyWith', () {
      MealComponent copy = threeMediumSlices.copyWithMealComponent();
      bool eq = threeMediumSlices == copy;
      expect(eq, true);
      expect(copy, threeMediumSlices);
    });

    test('MealComponent.toJson()', () {
      String expectation = jsonEncode(threeMediumSlices.toMap());
      expect(threeMediumSlices.toJson(), expectation);
    });

    test('MealComponent.fromMap() and ==', () {
      Map<String, dynamic> map = threeMediumSlices.toMap();
      MealComponent expectation = MealComponent.fromMap(map);
      expect(threeMediumSlices, expectation);
    });

    test('MealComponent.fromJson() and ==', () {
      String json = threeMediumSlices.toJson();
      MealComponent expectation = MealComponent.fromJson(json);
      expect(threeMediumSlices, expectation);
    });

    test('MealComponent.staticConstructor()', () {
      MealComponent expectation = MealComponent.staticConstructor(
          reference: threeMediumSlices.reference,
          grams: threeMediumSlices.grams);
      expect(expectation.runtimeType, MealComponent);
    });
  });
}

@CreateTestTemplates(MealComponent, 'threeMediumSlices')
void mealComponentTests() {
  group('MealComponent Tests', () {
    test('MealComponent.getBaseIngredients', () {
      // TODO: complete test
      // dynamic result = threeMediumSlices.getBaseIngredients();
      // expect(result, expectation);
    });
  });
}

void main() {}
