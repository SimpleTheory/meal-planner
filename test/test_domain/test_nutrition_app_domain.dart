import 'dart:convert';
import 'package:nutrition_app/mydataclasses/metadata.dart';
import 'package:test/test.dart';
import 'package:dataclasses/dataclasses.dart';
import 'package:dataclasses/dataclasses.dart'  as dc_eq show equals;
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
    '{"__type":"Ingredient","name":"milk","baseNutrient":{"__type":"BaseNutrients","grams":244,"nutrients":{"__type":"Nutrients","calcium":{"__type":"Nutrient","value":292.8,"unit":"mg","name":"Calcium"},"carbohydrate":{"__type":"Nutrient","value":11.712,"unit":"g","name":"Carbohydrate"},"cholesterol":{"__type":"Nutrient","value":19.52,"unit":"mg","name":"Cholesterol"},"calories":{"__type":"Nutrient","value":122,"unit":"kcal","name":"Calories"},"saturatedFat":{"__type":"Nutrient","value":3.0671,"unit":"g","name":"SaturatedFat"},"totalFat":{"__type":"Nutrient","value":4.8312,"unit":"g","name":"TotalFat"},"transFat":{"__type":"Nutrient","value":0.2074,"unit":"g","name":"TransFat"},"iron":{"__type":"Nutrient","value":0.0488,"unit":"mg","name":"Iron"},"fiber":{"__type":"Nutrient","value":0,"unit":"g","name":"Fiber"},"potassium":{"__type":"Nutrient","value":341.6,"unit":"mg","name":"Potassium"},"sodium":{"__type":"Nutrient","value":114.68,"unit":"mg","name":"Sodium"},"protein":{"__type":"Nutrient","value":8.052,"unit":"g","name":"Protein"},"sugars":{"__type":"Nutrient","value":12.3464,"unit":"g","name":"Sugars"},"choline":{"__type":"Nutrient","value":40.016,"unit":"mg","name":"Choline"},"copper":{"__type":"Nutrient","value":0.0146,"unit":"mg","name":"Copper"},"ala":{"__type":"Nutrient","value":0.0195,"unit":"g","name":"ALA"},"linoleicAcid":{"__type":"Nutrient","value":0,"unit":"g","name":"LinoleicAcid"},"epa":{"__type":"Nutrient","value":0,"unit":"g","name":"EPA"},"dpa":{"__type":"Nutrient","value":0,"unit":"g","name":"DPA"},"dha":{"__type":"Nutrient","value":0,"unit":"g","name":"DHA"},"folate":{"__type":"Nutrient","value":12.2,"unit":"µg","name":"Folate"},"magnesium":{"__type":"Nutrient","value":26.84,"unit":"mg","name":"Magnesium"},"manganese":{"__type":"Nutrient","value":0.0342,"unit":"mg","name":"Manganese"},"niacin":{"__type":"Nutrient","value":0.2245,"unit":"mg","name":"Niacin"},"phosphorus":{"__type":"Nutrient","value":224.48,"unit":"mg","name":"Phosphorus"},"pantothenicAcid":{"__type":"Nutrient","value":0.8686,"unit":"mg","name":"PantothenicAcid"},"riboflavin":{"__type":"Nutrient","value":0.4514,"unit":"mg","name":"Riboflavin"},"selenium":{"__type":"Nutrient","value":6.1,"unit":"µg","name":"Selenium"},"thiamin":{"__type":"Nutrient","value":0.0952,"unit":"mg","name":"Thiamin"},"vitaminE":{"__type":"Nutrient","value":0.0732,"unit":"mg","name":"VitaminE"},"vitaminA":{"__type":"Nutrient","value":134.2,"unit":"µg","name":"VitaminA"},"vitaminB12":{"__type":"Nutrient","value":1.2932,"unit":"µg","name":"VitaminB12"},"vitaminB6":{"__type":"Nutrient","value":0.0927,"unit":"mg","name":"VitaminB6"},"vitaminC":{"__type":"Nutrient","value":0.488,"unit":"mg","name":"VitaminC"},"vitaminD":{"__type":"Nutrient","value":2.928,"unit":"µg","name":"VitaminD"},"vitaminK":{"__type":"Nutrient","value":0.488,"unit":"µg","name":"VitaminK"},"zinc":{"__type":"Nutrient","value":1.1712,"unit":"mg","name":"Zinc"},"unsaturatedFat":{"__type":"Nutrient","value":1.7641,"unit":"g","name":"UnstauratedFat"}}},"altMeasures2grams":{"cup":244,"fl oz":30.5,"quart":976,"g":100,"tsp":5.08,"tbsp":15.25,"grams":1},"photo":{"__type":"Uri","url":"https://nix-tag-images.s3.amazonaws.com/377_highres.jpg"},"source":{"__type":"IngredientSource","__enum":true,"value":"IngredientSource.string"},"sourceMetadata":"milk"}'
  ),
  Ingredient.fromJson(
    '{"__type":"Ingredient","name":"No Sugar Keto Cup, Dark Chocolate","baseNutrient":{"__type":"BaseNutrients","grams":17,"nutrients":{"__type":"Nutrients","calcium":{"__type":"Nutrient","value":10,"unit":"mg","name":"Calcium"},"carbohydrate":{"__type":"Nutrient","value":9,"unit":"g","name":"Carbohydrate"},"cholesterol":{"__type":"Nutrient","value":0,"unit":"mg","name":"Cholesterol"},"calories":{"__type":"Nutrient","value":70,"unit":"kcal","name":"Calories"},"saturatedFat":{"__type":"Nutrient","value":4.5,"unit":"g","name":"SaturatedFat"},"totalFat":{"__type":"Nutrient","value":7,"unit":"g","name":"TotalFat"},"transFat":{"__type":"Nutrient","value":0,"unit":"g","name":"TransFat"},"iron":{"__type":"Nutrient","value":1.3,"unit":"mg","name":"Iron"},"fiber":{"__type":"Nutrient","value":4,"unit":"g","name":"Fiber"},"potassium":{"__type":"Nutrient","value":35,"unit":"mg","name":"Potassium"},"sodium":{"__type":"Nutrient","value":0,"unit":"mg","name":"Sodium"},"protein":{"__type":"Nutrient","value":1,"unit":"g","name":"Protein"},"sugars":{"__type":"Nutrient","value":0,"unit":"g","name":"Sugars"},"choline":{"__type":"Nutrient","value":0,"unit":"mg","name":"Choline"},"copper":{"__type":"Nutrient","value":0,"unit":"mg","name":"Copper"},"ala":{"__type":"Nutrient","value":0,"unit":"g","name":"ALA"},"linoleicAcid":{"__type":"Nutrient","value":0,"unit":"g","name":"LinoleicAcid"},"epa":{"__type":"Nutrient","value":0,"unit":"g","name":"EPA"},"dpa":{"__type":"Nutrient","value":0,"unit":"g","name":"DPA"},"dha":{"__type":"Nutrient","value":0,"unit":"g","name":"DHA"},"folate":{"__type":"Nutrient","value":0,"unit":"µg","name":"Folate"},"magnesium":{"__type":"Nutrient","value":0,"unit":"mg","name":"Magnesium"},"manganese":{"__type":"Nutrient","value":0,"unit":"mg","name":"Manganese"},"niacin":{"__type":"Nutrient","value":0,"unit":"mg","name":"Niacin"},"phosphorus":{"__type":"Nutrient","value":0,"unit":"mg","name":"Phosphorus"},"pantothenicAcid":{"__type":"Nutrient","value":0,"unit":"mg","name":"PantothenicAcid"},"riboflavin":{"__type":"Nutrient","value":0,"unit":"mg","name":"Riboflavin"},"selenium":{"__type":"Nutrient","value":0,"unit":"µg","name":"Selenium"},"thiamin":{"__type":"Nutrient","value":0,"unit":"mg","name":"Thiamin"},"vitaminE":{"__type":"Nutrient","value":0,"unit":"mg","name":"VitaminE"},"vitaminA":{"__type":"Nutrient","value":0,"unit":"µg","name":"VitaminA"},"vitaminB12":{"__type":"Nutrient","value":0,"unit":"µg","name":"VitaminB12"},"vitaminB6":{"__type":"Nutrient","value":0,"unit":"mg","name":"VitaminB6"},"vitaminC":{"__type":"Nutrient","value":0,"unit":"mg","name":"VitaminC"},"vitaminD":{"__type":"Nutrient","value":0,"unit":"µg","name":"VitaminD"},"vitaminK":{"__type":"Nutrient","value":0,"unit":"µg","name":"VitaminK"},"zinc":{"__type":"Nutrient","value":0,"unit":"mg","name":"Zinc"},"unsaturatedFat":{"__type":"Nutrient","value":2.5,"unit":"g","name":"UnstauratedFat"}}},"altMeasures2grams":{"piece":17,"grams":1},"photo":{"__type":"Uri","url":"https://nutritionix-api.s3.amazonaws.com/5fb2849e5c1ca76c4b2019cb.jpeg"},"source":{"__type":"IngredientSource","__enum":true,"value":"IngredientSource.upc"},"sourceMetadata":687910000636}'
  ),
  Ingredient.fromJson(
    '{"__type":"Ingredient","name":"pizza","baseNutrient":{"__type":"BaseNutrients","grams":107,"nutrients":{"__type":"Nutrients","calcium":{"__type":"Nutrient","value":201.16,"unit":"mg","name":"Calcium"},"carbohydrate":{"__type":"Nutrient","value":35.6631,"unit":"g","name":"Carbohydrate"},"cholesterol":{"__type":"Nutrient","value":18.19,"unit":"mg","name":"Cholesterol"},"calories":{"__type":"Nutrient","value":284.62,"unit":"kcal","name":"Calories"},"saturatedFat":{"__type":"Nutrient","value":4.7776,"unit":"g","name":"SaturatedFat"},"totalFat":{"__type":"Nutrient","value":10.3683,"unit":"g","name":"TotalFat"},"transFat":{"__type":"Nutrient","value":0.2579,"unit":"g","name":"TransFat"},"iron":{"__type":"Nutrient","value":2.6536,"unit":"mg","name":"Iron"},"fiber":{"__type":"Nutrient","value":2.461,"unit":"g","name":"Fiber"},"potassium":{"__type":"Nutrient","value":184.04,"unit":"mg","name":"Potassium"},"sodium":{"__type":"Nutrient","value":639.86,"unit":"mg","name":"Sodium"},"protein":{"__type":"Nutrient","value":12.1873,"unit":"g","name":"Protein"},"sugars":{"__type":"Nutrient","value":3.8306,"unit":"g","name":"Sugars"},"choline":{"__type":"Nutrient","value":17.548,"unit":"mg","name":"Choline"},"copper":{"__type":"Nutrient","value":0.1124,"unit":"mg","name":"Copper"},"ala":{"__type":"Nutrient","value":0.1873,"unit":"g","name":"ALA"},"linoleicAcid":{"__type":"Nutrient","value":0.0032,"unit":"g","name":"LinoleicAcid"},"epa":{"__type":"Nutrient","value":0.0043,"unit":"g","name":"EPA"},"dpa":{"__type":"Nutrient","value":0.0043,"unit":"g","name":"DPA"},"dha":{"__type":"Nutrient","value":0,"unit":"g","name":"DHA"},"folate":{"__type":"Nutrient","value":99.51,"unit":"µg","name":"Folate"},"magnesium":{"__type":"Nutrient","value":25.68,"unit":"mg","name":"Magnesium"},"manganese":{"__type":"Nutrient","value":0.3852,"unit":"mg","name":"Manganese"},"niacin":{"__type":"Nutrient","value":4.0928,"unit":"mg","name":"Niacin"},"phosphorus":{"__type":"Nutrient","value":231.12,"unit":"mg","name":"Phosphorus"},"pantothenicAcid":{"__type":"Nutrient","value":0,"unit":"mg","name":"PantothenicAcid"},"riboflavin":{"__type":"Nutrient","value":0.2087,"unit":"mg","name":"Riboflavin"},"selenium":{"__type":"Nutrient","value":21.293,"unit":"µg","name":"Selenium"},"thiamin":{"__type":"Nutrient","value":0.4173,"unit":"mg","name":"Thiamin"},"vitaminE":{"__type":"Nutrient","value":0.8881,"unit":"mg","name":"VitaminE"},"vitaminA":{"__type":"Nutrient","value":73.83,"unit":"µg","name":"VitaminA"},"vitaminB12":{"__type":"Nutrient","value":0.4494,"unit":"µg","name":"VitaminB12"},"vitaminB6":{"__type":"Nutrient","value":0.0856,"unit":"mg","name":"VitaminB6"},"vitaminC":{"__type":"Nutrient","value":1.498,"unit":"mg","name":"VitaminC"},"vitaminD":{"__type":"Nutrient","value":0,"unit":"µg","name":"VitaminD"},"vitaminK":{"__type":"Nutrient","value":7.169,"unit":"µg","name":"VitaminK"},"zinc":{"__type":"Nutrient","value":1.4338,"unit":"mg","name":"Zinc"},"unsaturatedFat":{"__type":"Nutrient","value":5.5907,"unit":"g","name":"UnstauratedFat"}}},"altMeasures2grams":{"slice":107,"pizza":853,"large slice":170,"medium slice":80,"small slice":65,"large pizza":853,"medium pizza":640,"small pizza":390,"personal pan pizza":225,"personal pan pizza slice":56.25,"g":100,"wt. oz":28.3495,"grams":1},"photo":{"__type":"Uri","url":"https://nix-tag-images.s3.amazonaws.com/1060_highres.jpg"},"source":{"__type":"IngredientSource","__enum":true,"value":"IngredientSource.string"},"sourceMetadata":"pizza"}'
  )
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
      '{"__type":"DRIS","calcium":{"name":"Calcium","dri":1000,"upperLimit":2500,"unit":"mg","note":null,"__type":"DRI"},"carbohydrate":{"name":"Carbohydrate","dri":358,"upperLimit":518,"unit":"g","note":null,"__type":"DRI"},"cholesterol":{"name":"Cholesterol","dri":null,"upperLimit":300,"unit":"mg","note":null,"__type":"DRI"},"calories":{"name":"Calories","dri":2867.4,"upperLimit":3186,"unit":"kcal","note":null,"__type":"DRI"},"totalFat":{"name":"Total Fat","dri":71,"upperLimit":124,"unit":"g","note":null,"__type":"DRI"},"iron":{"name":"Iron","dri":8,"upperLimit":45,"unit":"mg","note":null,"__type":"DRI"},"fiber":{"name":"Total Fiber","dri":38,"upperLimit":null,"unit":"g","note":null,"__type":"DRI"},"potassium":{"name":"Potassium","dri":3400,"upperLimit":null,"unit":"mg","note":null,"__type":"DRI"},"sodium":{"name":"Sodium","dri":1500,"upperLimit":3000,"unit":"mg","note":null,"__type":"DRI"},"protein":{"name":"Protein","dri":73,"upperLimit":160,"unit":"g","note":null,"__type":"DRI"},"sugars":{"name":"Sugars","dri":null,"upperLimit":36,"unit":"g","note":null,"__type":"DRI"},"choline":{"name":"Choline","dri":0.55,"upperLimit":3.5,"unit":"g","note":null,"__type":"DRI"},"copper":{"name":"Copper","dri":900,"upperLimit":10000,"unit":"mcg","note":null,"__type":"DRI"},"ala":{"name":"α-Linolenic Acid","dri":1.6,"upperLimit":null,"unit":"g","note":null,"__type":"DRI"},"linoleicAcid":{"name":"Linoleic Acid","dri":17,"upperLimit":null,"unit":"g","note":null,"__type":"DRI"},"epa":{"name":"EPA","dri":200,"upperLimit":1800,"unit":"mg","note":null,"__type":"DRI"},"dpa":{"name":"DPA","dri":50,"upperLimit":null,"unit":"mg","note":null,"__type":"DRI"},"dha":{"name":"DHA","dri":200,"upperLimit":1800,"unit":"mg","note":null,"__type":"DRI"},"folate":{"name":"Folate","dri":400,"upperLimit":1000,"unit":"mcg","note":null,"__type":"DRI"},"magnesium":{"name":"Magnesium","dri":400,"upperLimit":null,"unit":"mg","note":null,"__type":"DRI"},"manganese":{"name":"Manganese","dri":2.3,"upperLimit":11,"unit":"mg","note":null,"__type":"DRI"},"niacin":{"name":"Niacin","dri":16,"upperLimit":35,"unit":"mg","note":null,"__type":"DRI"},"phosphorus":{"name":"Phosphorus","dri":0.7,"upperLimit":4,"unit":"g","note":null,"__type":"DRI"},"pantothenicAcid":{"name":"Pantothenic Acid","dri":5,"upperLimit":null,"unit":"mg","note":null,"__type":"DRI"},"riboflavin":{"name":"Riboflavin","dri":1.3,"upperLimit":null,"unit":"mg","note":null,"__type":"DRI"},"selenium":{"name":"Selenium","dri":55,"upperLimit":400,"unit":"mcg","note":null,"__type":"DRI"},"thiamin":{"name":"Thiamin","dri":1.2,"upperLimit":null,"unit":"mg","note":null,"__type":"DRI"},"vitaminE":{"name":"Vitamin E","dri":15,"upperLimit":1000,"unit":"mg","note":null,"__type":"DRI"},"vitaminA":{"name":"Vitamin A","dri":900,"upperLimit":3000,"unit":"mcg","note":null,"__type":"DRI"},"vitaminB12":{"name":"Vitamin B12","dri":2.4,"upperLimit":null,"unit":"mcg","note":null,"__type":"DRI"},"vitaminB6":{"name":"Vitamin B6","dri":1.3,"upperLimit":100,"unit":"mg","note":null,"__type":"DRI"},"vitaminC":{"name":"Vitamin C","dri":90,"upperLimit":2000,"unit":"mg","note":null,"__type":"DRI"},"vitaminD":{"name":"Vitamin D","dri":15,"upperLimit":100,"unit":"mcg","note":null,"__type":"DRI"},"vitaminK":{"name":"Vitamin K","dri":120,"upperLimit":null,"unit":"mcg","note":null,"__type":"DRI"},"zinc":{"name":"Zinc","dri":11,"upperLimit":40,"unit":"mg","note":null,"__type":"DRI"},"transFat":{"name":"Trans Fat","dri":null,"upperLimit":1,"unit":"g","note":null,"__type":"DRI"},"unsaturatedFat":{"name":"Unsaturated Fat","dri":63.9,"upperLimit":124,"unit":"g","note":null,"__type":"DRI"},"saturatedFat":{"name":"Saturated Fat","dri":null,"upperLimit":35.4,"unit":"g","note":null,"__type":"DRI"}}'
)
);
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
      // Map map = app.toMap();
      // App expectation = App.fromMap(map);
      // expect(app == expectation, true);
    });

    test('App.fromJson() and ==', () {
      // String json = app.toJson();
      // App expectation = App.fromJson(json);
      // expect(app, expectation);
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

//@CreateTestTemplates(Diet, 'diet')
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
      List<MealComponent> result = diet.getShoppingList();
      expect(
          dc_eq.equals(result.map((e) => [e.name, e.grams]).toList(), [['pizza', 240], ['No Sugar Keto Cup, Dark Chocolate', 50], ['milk', 100]]), true);
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

//@CreateTestTemplates(MealComponent, 'threeMediumSlices')
void mealComponentTests() {
  group('MealComponent Tests', () {
    test('MealComponent.getBaseIngredients', () {
      // TODO: complete test
      dynamic result = threeMediumSlices.getBaseIngredients();
      expect(result, MealComponent(reference: threeMediumSlices.reference, grams: threeMediumSlices.grams));
    });
    test('getBaseIngredientNesting', () async {
      final flour = await Ingredient.fromApi(settings, 'flour');
      final salt = await Ingredient.fromApi(settings, 'salt');
      final water = await Ingredient.fromApi(settings, 'water');
      final mozz = await Ingredient.fromApi(settings, 'mozzarella');
      final sauce = await Ingredient.fromApi(settings, 'pizza sauce');

      final sub = Meal(name: 'dough', ingredients: [
        flour.toMealComponent('cup', 1, flour),
        water.toMealComponent('cup', 1, water),
        salt.toMealComponent('tsp', 2, salt),
      ], isSubRecipe: true);

      final pizza = Meal(name: 'pizza recipe',
          ingredients: [
            sub.toMealComponent('grams', 200, sub),
            sauce.toMealComponent('grams', 30, sauce),
            mozz.toMealComponent('grams', 50, mozz)
          ],
          isSubRecipe: false);
      // print(pizza.toMealComponent('serving', 1, pizza).getBaseIngredients());
      // print(pizza.toMealComponent('serving', 1, pizza).nutrients.toStr());
      expect(pizza.baseIngredients().toString(), '[MealComponent(reference: Ingredient(name: flour, baseNutrient: BaseNutrients(grams: 125, nutrients: Nutrients(calcium: Calcium(value: 18.75, unit: mg), carbohydrate: Carbohydrate(value: 95.3875, unit: g), cholesterol: Cholesterol(value: 0, unit: mg), calories: Calories(value: 455, unit: kcal), saturatedFat: SaturatedFat(value: 0.1938, unit: g), totalFat: TotalFat(value: 1.225, unit: g), transFat: TransFat(value: 0, unit: g), iron: Iron(value: 5.8, unit: mg), fiber: Fiber(value: 3.375, unit: g), potassium: Potassium(value: 133.75, unit: mg), sodium: Sodium(value: 2.5, unit: mg), protein: Protein(value: 12.9125, unit: g), sugars: Sugars(value: 0.3375, unit: g), choline: Choline(value: 13, unit: mg), copper: Copper(value: 0.18, unit: mg), ala: ALA(value: 0, unit: g), linoleicAcid: LinoleicAcid(value: 0, unit: g), epa: EPA(value: 0, unit: g), dpa: DPA(value: 0, unit: g), dha: DHA(value: 0, unit: g), folate: Folate(value: 228.75, unit: µg), magnesium: Magnesium(value: 27.5, unit: mg), manganese: Manganese(value: 0.8525, unit: mg), niacin: Niacin(value: 7.38, unit: mg), phosphorus: Phosphorus(value: 135, unit: mg), pantothenicAcid: PantothenicAcid(value: 0.5475, unit: mg), riboflavin: Riboflavin(value: 0.6175, unit: mg), selenium: Selenium(value: 42.375, unit: µg), thiamin: Thiamin(value: 0.9813, unit: mg), vitaminE: VitaminE(value: 0.075, unit: mg), vitaminA: VitaminA(value: 0, unit: µg), vitaminB12: VitaminB12(value: 0, unit: µg), vitaminB6: VitaminB6(value: 0.055, unit: mg), vitaminC: VitaminC(value: 0, unit: mg), vitaminD: VitaminD(value: 0, unit: µg), vitaminK: VitaminK(value: 0.375, unit: µg), zinc: Zinc(value: 0.875, unit: mg), unsaturatedFat: UnstauratedFat(value: 1.0312000000000001, unit: g))), altMeasures2grams: {cup: 125, g: 100, wt. oz: 28.3495, tsp: 2.6, tbsp: 7.81, grams: 1}, photo: https://nix-tag-images.s3.amazonaws.com/206_highres.jpg, source: IngredientSource.string, sourceMetadata: flour), grams: 125), MealComponent(reference: Ingredient(name: water, baseNutrient: BaseNutrients(grams: 237, nutrients: Nutrients(calcium: Calcium(value: 7.11, unit: mg), carbohydrate: Carbohydrate(value: 0, unit: g), cholesterol: Cholesterol(value: 0, unit: mg), calories: Calories(value: 0, unit: kcal), saturatedFat: SaturatedFat(value: 0, unit: g), totalFat: TotalFat(value: 0, unit: g), transFat: TransFat(value: 0, unit: g), iron: Iron(value: 0, unit: mg), fiber: Fiber(value: 0, unit: g), potassium: Potassium(value: 0, unit: mg), sodium: Sodium(value: 9.48, unit: mg), protein: Protein(value: 0, unit: g), sugars: Sugars(value: 0, unit: g), choline: Choline(value: 0, unit: mg), copper: Copper(value: 0.0237, unit: mg), ala: ALA(value: 0, unit: g), linoleicAcid: LinoleicAcid(value: 0, unit: g), epa: EPA(value: 0, unit: g), dpa: DPA(value: 0, unit: g), dha: DHA(value: 0, unit: g), folate: Folate(value: 0, unit: µg), magnesium: Magnesium(value: 2.37, unit: mg), manganese: Manganese(value: 0, unit: mg), niacin: Niacin(value: 0, unit: mg), phosphorus: Phosphorus(value: 0, unit: mg), pantothenicAcid: PantothenicAcid(value: 0, unit: mg), riboflavin: Riboflavin(value: 0, unit: mg), selenium: Selenium(value: 0, unit: µg), thiamin: Thiamin(value: 0, unit: mg), vitaminE: VitaminE(value: 0, unit: mg), vitaminA: VitaminA(value: 0, unit: µg), vitaminB12: VitaminB12(value: 0, unit: µg), vitaminB6: VitaminB6(value: 0, unit: mg), vitaminC: VitaminC(value: 0, unit: mg), vitaminD: VitaminD(value: 0, unit: µg), vitaminK: VitaminK(value: 0, unit: µg), zinc: Zinc(value: 0.0237, unit: mg), unsaturatedFat: UnstauratedFat(value: 0, unit: g))), altMeasures2grams: {serving 8 fl oz: 237, fl oz: 29.6, liter: 1000, g: 100, cup: 236.8, tsp: 4.93, tbsp: 14.8, grams: 1}, photo: https://nix-tag-images.s3.amazonaws.com/4483_highres.jpg, source: IngredientSource.string, sourceMetadata: water), grams: 236.8), MealComponent(reference: Ingredient(name: salt, baseNutrient: BaseNutrients(grams: 1.5, nutrients: Nutrients(calcium: Calcium(value: 0.36, unit: mg), carbohydrate: Carbohydrate(value: 0, unit: g), cholesterol: Cholesterol(value: 0, unit: mg), calories: Calories(value: 0, unit: kcal), saturatedFat: SaturatedFat(value: 0, unit: g), totalFat: TotalFat(value: 0, unit: g), transFat: TransFat(value: 0, unit: g), iron: Iron(value: 0.005, unit: mg), fiber: Fiber(value: 0, unit: g), potassium: Potassium(value: 0.12, unit: mg), sodium: Sodium(value: 581.37, unit: mg), protein: Protein(value: 0, unit: g), sugars: Sugars(value: 0, unit: g), choline: Choline(value: 0, unit: mg), copper: Copper(value: 0.0005, unit: mg), ala: ALA(value: 0, unit: g), linoleicAcid: LinoleicAcid(value: 0, unit: g), epa: EPA(value: 0, unit: g), dpa: DPA(value: 0, unit: g), dha: DHA(value: 0, unit: g), folate: Folate(value: 0, unit: µg), magnesium: Magnesium(value: 0.015, unit: mg), manganese: Manganese(value: 0.0015, unit: mg), niacin: Niacin(value: 0, unit: mg), phosphorus: Phosphorus(value: 0, unit: mg), pantothenicAcid: PantothenicAcid(value: 0, unit: mg), riboflavin: Riboflavin(value: 0, unit: mg), selenium: Selenium(value: 0.0015, unit: µg), thiamin: Thiamin(value: 0, unit: mg), vitaminE: VitaminE(value: 0, unit: mg), vitaminA: VitaminA(value: 0, unit: µg), vitaminB12: VitaminB12(value: 0, unit: µg), vitaminB6: VitaminB6(value: 0, unit: mg), vitaminC: VitaminC(value: 0, unit: mg), vitaminD: VitaminD(value: 0, unit: µg), vitaminK: VitaminK(value: 0, unit: µg), zinc: Zinc(value: 0.0015, unit: mg), unsaturatedFat: UnstauratedFat(value: 0, unit: g))), altMeasures2grams: {tsp: 1.5, tbsp: 18, cup: 292, dash: 0.4, to taste: 1.5, g: 100, wt. oz: 28.3495, grams: 1}, photo: https://nix-tag-images.s3.amazonaws.com/177_highres.jpg, source: IngredientSource.string, sourceMetadata: salt), grams: 3.0), MealComponent(reference: Ingredient(name: pizza sauce, baseNutrient: BaseNutrients(grams: 63, nutrients: Nutrients(calcium: Calcium(value: 34.02, unit: mg), carbohydrate: Carbohydrate(value: 5.4558, unit: g), cholesterol: Cholesterol(value: 0, unit: mg), calories: Calories(value: 34.02, unit: kcal), saturatedFat: SaturatedFat(value: 0.2898, unit: g), totalFat: TotalFat(value: 0.7245, unit: g), transFat: TransFat(value: 0, unit: g), iron: Iron(value: 0.567, unit: mg), fiber: Fiber(value: 1.26, unit: g), potassium: Potassium(value: 223.02, unit: mg), sodium: Sodium(value: 219.24, unit: mg), protein: Protein(value: 1.3734, unit: g), sugars: Sugars(value: 2.3814, unit: g), choline: Choline(value: 0, unit: mg), copper: Copper(value: 0.0863, unit: mg), ala: ALA(value: 0, unit: g), linoleicAcid: LinoleicAcid(value: 0, unit: g), epa: EPA(value: 0, unit: g), dpa: DPA(value: 0, unit: g), dha: DHA(value: 0, unit: g), folate: Folate(value: 6.3, unit: µg), magnesium: Magnesium(value: 13.23, unit: mg), manganese: Manganese(value: 0.1392, unit: mg), niacin: Niacin(value: 0.8952, unit: mg), phosphorus: Phosphorus(value: 31.5, unit: mg), pantothenicAcid: PantothenicAcid(value: 0.2356, unit: mg), riboflavin: Riboflavin(value: 0.0334, unit: mg), selenium: Selenium(value: 0, unit: µg), thiamin: Thiamin(value: 0.0384, unit: mg), vitaminE: VitaminE(value: 0, unit: mg), vitaminA: VitaminA(value: 0, unit: µg), vitaminB12: VitaminB12(value: 0.0126, unit: µg), vitaminB6: VitaminB6(value: 0.0857, unit: mg), vitaminC: VitaminC(value: 7.119, unit: mg), vitaminD: VitaminD(value: 0, unit: µg), vitaminK: VitaminK(value: 0, unit: µg), zinc: Zinc(value: 0.1575, unit: mg), unsaturatedFat: UnstauratedFat(value: 0.43470000000000003, unit: g))), altMeasures2grams: {cup: 63, fl oz: 31.5, g: 100, tsp: 5.25, tbsp: 15.75, grams: 1}, photo: https://nix-tag-images.s3.amazonaws.com/1236_highres.jpg, source: IngredientSource.string, sourceMetadata: pizza sauce), grams: 30), MealComponent(reference: Ingredient(name: mozzarella, baseNutrient: BaseNutrients(grams: 28.35, nutrients: Nutrients(calcium: Calcium(value: 143.1675, unit: mg), carbohydrate: Carbohydrate(value: 0.6209, unit: g), cholesterol: Cholesterol(value: 22.3965, unit: mg), calories: Calories(value: 85.05, unit: kcal), saturatedFat: SaturatedFat(value: 3.7286, unit: g), totalFat: TotalFat(value: 6.3362, unit: g), transFat: TransFat(value: 0, unit: g), iron: Iron(value: 0.1247, unit: mg), fiber: Fiber(value: 0, unit: g), potassium: Potassium(value: 21.546, unit: mg), sodium: Sodium(value: 177.7545, unit: mg), protein: Protein(value: 6.2852, unit: g), sugars: Sugars(value: 0.292, unit: g), choline: Choline(value: 4.3659, unit: mg), copper: Copper(value: 0.0031, unit: mg), ala: ALA(value: 0, unit: g), linoleicAcid: LinoleicAcid(value: 0, unit: g), epa: EPA(value: 0, unit: g), dpa: DPA(value: 0, unit: g), dha: DHA(value: 0, unit: g), folate: Folate(value: 1.9845, unit: µg), magnesium: Magnesium(value: 5.67, unit: mg), manganese: Manganese(value: 0.0085, unit: mg), niacin: Niacin(value: 0.0295, unit: mg), phosphorus: Phosphorus(value: 100.359, unit: mg), pantothenicAcid: PantothenicAcid(value: 0.04, unit: mg), riboflavin: Riboflavin(value: 0.0802, unit: mg), selenium: Selenium(value: 4.8195, unit: µg), thiamin: Thiamin(value: 0.0085, unit: mg), vitaminE: VitaminE(value: 0.0539, unit: mg), vitaminA: VitaminA(value: 50.7465, unit: µg), vitaminB12: VitaminB12(value: 0.6464, unit: µg), vitaminB6: VitaminB6(value: 0.0105, unit: mg), vitaminC: VitaminC(value: 0, unit: mg), vitaminD: VitaminD(value: 0.1134, unit: µg), vitaminK: VitaminK(value: 0.6521, unit: µg), zinc: Zinc(value: 0.8278, unit: mg), unsaturatedFat: UnstauratedFat(value: 2.6075999999999997, unit: g))), altMeasures2grams: {oz: 28.35, cup, shredded: 112, slices: 170, slice: 28.33, g: 100, grams: 1}, photo: https://nix-tag-images.s3.amazonaws.com/690_highres.jpg, source: IngredientSource.string, sourceMetadata: mozzarella), grams: 50)]');
    });

  });
}

void main() {
  appDataclassMethods();
  appTests();
  settingsDataclassMethods();
  settingsTests();
  mealDataclassMethods();
  mealTests();
  ingredientDataclassMethods();
  ingredientTests();
  mealComponentDataclassMethods();
  mealComponentTests();
  dietDataclassMethods();
  dietTests();
  dayDataclassMethods();
  dayTests();

}
