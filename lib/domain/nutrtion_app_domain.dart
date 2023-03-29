import 'package:nutrition_app/mydataclasses/metadata.dart';
import 'dart:convert';
import 'package:dataclasses/dataclasses.dart';
import 'package:nutrition_app/domain.dart';

/// AGG ROOT
@Dataclass(
    constructor: false,
    staticConstructor: false,
    eq: false,
    copyWith: false,
    fromJson: false)
class App {
  Settings settings;
  List<Diet> diets;
  List<Meal> meals;
  List<Ingredient> baseIngredients;
  List<MealComponentFactory> get ingredients =>
      [...baseIngredients, ...meals.where((element) => element.isSubRecipe)];

  // What can an app do?
  // Add meal
  // Add ingredient
  // Add diet
  // Update Settings
  // Update Meal
  // Update Diet
  // Delete: meal, ingredient, diet

  // <editor-fold desc="Dataclass Section">

  // <editor-fold desc="Singleton Pattern">
  static late final App _singleton;

  factory App() {
    return _singleton;
  }

  App._internal({
    required this.settings,
    required this.diets,
    required this.meals,
    required this.baseIngredients,
  });

  factory App.restart({required Settings settings}) {
    _singleton = App._internal(
        settings: settings,
        diets: <Diet>[],
        meals: <Meal>[],
        baseIngredients: <Ingredient>[]);
    return _singleton;
  }

  // </editor-fold>

  // <editor-fold desc="Custom Data Functions">
  App update(
      {Settings? settings,
      List<Diet>? diets,
      List<Meal>? meals,
      List<Ingredient>? baseIngredients}) {
    _singleton = App._internal(
        settings: settings ?? this.settings,
        diets: diets ?? this.diets,
        meals: meals ?? this.meals,
        baseIngredients: baseIngredients ?? this.baseIngredients);
    return _singleton;
  }

  factory App.fromMap(Map map) {
    Settings settings = dejsonify(map['settings']);
    List dietsTemp = dejsonify(map['diets']);
    List mealsTemp = dejsonify(map['meals']);
    List baseIngredientsTemp = dejsonify(map['baseIngredients']);

    List<Diet> diets = List<Diet>.from(dietsTemp);

    List<Meal> meals = List<Meal>.from(mealsTemp);

    List<Ingredient> baseIngredients =
        List<Ingredient>.from(baseIngredientsTemp);

    _singleton = App._internal(
        settings: settings,
        diets: diets,
        meals: meals,
        baseIngredients: baseIngredients);
    return _singleton;
  }
  factory App.fromJson(String json) => App.fromMap(jsonDecode(json));
  // </editor-fold>

  // <editor-fold desc="Regular Dataclass Section">
  @Generate()
  // <Dataclass>

  Map<String, dynamic> get attributes__ => {
        "settings": settings,
        "diets": diets,
        "meals": meals,
        "baseIngredients": baseIngredients
      };

  @override
  String toString() =>
      'App(settings: $settings, diets: $diets, meals: $meals, baseIngredients: $baseIngredients)';

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'App', ...nestedJsonMap(attributes__)};
  // </Dataclass>
  // </editor-fold>

  // </editor-fold>
}
// class App {
//   Settings settings;
//   List<Diet> diets;
//   List<Meal> meals;
//   List<Ingredient> baseIngredients;
//
//   static late final App _singleton;
//
//   factory App() {
//     return _singleton;
//   }
//
//   App._internal({
//     required this.settings,
//     required this.diets,
//     required this.meals,
//     required this.baseIngredients,
//   });
//
//   List<MealComponentFactory> get ingredients =>
//       [...baseIngredients, ...meals.where((element) => element.isSubRecipe)];
// }

/// Diet Branch

@Dataclass()
class Diet {
  String name;
  List<Day> days;
  AnthroMetrics anthroMetrics;
  DRIS dris;

  DRIS get dayDri => dris / days.length;
  Nutrients get averageNutrition {
    List<Nutrients> dayNut = days.map((e) => e.nutrients).toList();
    Nutrients sum = Nutrients.sum(dayNut);
    return sum / dayNut.length;
  }

  Day createDay() {}
  Meal createMeal() {}
  Ingredient createIngredient() {}

  // <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  Diet({
    required this.name,
    required this.days,
    required this.anthroMetrics,
    required this.dris,
  });

  factory Diet.staticConstructor({
    required name,
    required days,
    required anthroMetrics,
    required dris,
  }) =>
      Diet(name: name, days: days, anthroMetrics: anthroMetrics, dris: dris);

  Map<String, dynamic> get attributes__ => {
        "name": name,
        "days": days,
        "anthroMetrics": anthroMetrics,
        "dris": dris
      };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Diet &&
          runtimeType == other.runtimeType &&
          equals(name, other.name) &&
          equals(days, other.days) &&
          equals(anthroMetrics, other.anthroMetrics) &&
          equals(dris, other.dris));

  @override
  int get hashCode =>
      name.hashCode ^ days.hashCode ^ anthroMetrics.hashCode ^ dris.hashCode;

  @override
  String toString() =>
      'Diet(name: $name, days: $days, anthroMetrics: $anthroMetrics, dris: $dris)';

  Diet copyWithDiet(
          {String? name,
          List<Day>? days,
          AnthroMetrics? anthroMetrics,
          DRIS? dris}) =>
      Diet(
          name: name ?? this.name,
          days: days ?? this.days,
          anthroMetrics: anthroMetrics ?? this.anthroMetrics,
          dris: dris ?? this.dris);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'Diet', ...nestedJsonMap(attributes__)};

  factory Diet.fromJson(String json) => Diet.fromMap(jsonDecode(json));

  factory Diet.fromMap(Map map) {
    String name = map['name'];
    List daysTemp = dejsonify(map['days']);
    AnthroMetrics anthroMetrics = dejsonify(map['anthroMetrics']);
    DRIS dris = dejsonify(map['dris']);

    List<Day> days = List<Day>.from(daysTemp);

    return Diet(
        name: name, days: days, anthroMetrics: anthroMetrics, dris: dris);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class Day {
  String name;
  List<MealComponent> meals;

  Nutrients get nutrients => throw UnimplementedError();
  // <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  Day({
    required this.name,
    required this.meals,
  });

  factory Day.staticConstructor({
    required name,
    required meals,
  }) =>
      Day(name: name, meals: meals);

  Map<String, dynamic> get attributes__ => {"name": name, "meals": meals};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Day &&
          runtimeType == other.runtimeType &&
          equals(name, other.name) &&
          equals(meals, other.meals));

  @override
  int get hashCode => name.hashCode ^ meals.hashCode;

  @override
  String toString() => 'Day(name: $name, meals: $meals)';

  Day copyWithDay({String? name, List<MealComponent>? meals}) =>
      Day(name: name ?? this.name, meals: meals ?? this.meals);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'Day', ...nestedJsonMap(attributes__)};

  factory Day.fromJson(String json) => Day.fromMap(jsonDecode(json));

  factory Day.fromMap(Map map) {
    String name = map['name'];
    List mealsTemp = dejsonify(map['meals']);

    List<MealComponent> meals = List<MealComponent>.from(mealsTemp);

    return Day(name: name, meals: meals);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class MealComponent {
  // String measure;
  // num quantity;
  MealComponentFactory reference;
  num grams;
  Nutrients get nutrients {
    num ratio = grams / reference.baseNutrient.grams;
    return reference.baseNutrient.nutrients * ratio;
  }

  // <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  MealComponent({
    required this.reference,
    required this.grams,
  });

  factory MealComponent.staticConstructor({
    required reference,
    required grams,
  }) =>
      MealComponent(reference: reference, grams: grams);

  Map<String, dynamic> get attributes__ =>
      {"reference": reference, "grams": grams};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MealComponent &&
          runtimeType == other.runtimeType &&
          equals(reference, other.reference) &&
          equals(grams, other.grams));

  @override
  int get hashCode => reference.hashCode ^ grams.hashCode;

  @override
  String toString() => 'MealComponent(reference: $reference, grams: $grams)';

  MealComponent copyWithMealComponent(
          {MealComponentFactory? reference, num? grams}) =>
      MealComponent(
          reference: reference ?? this.reference, grams: grams ?? this.grams);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'MealComponent', ...nestedJsonMap(attributes__)};

  factory MealComponent.fromJson(String json) =>
      MealComponent.fromMap(jsonDecode(json));

  factory MealComponent.fromMap(Map map) {
    MealComponentFactory reference = dejsonify(map['reference']);
    num grams = map['grams'];

    // No casting

    return MealComponent(reference: reference, grams: grams);
  }
  // </Dataclass>

// </editor-fold>
}
