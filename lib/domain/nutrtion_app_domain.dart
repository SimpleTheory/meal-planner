import 'package:nutrition_app/mydataclasses/metadata.dart';
import 'dart:convert';
import 'package:dataclasses/dataclasses.dart';
import 'package:nutrition_app/domain.dart';

/// AGG ROOT
@Dataclass()
class App {
  Settings settings;
  List<Diet> diets;

  // What can an app do?

  // <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  App({
    required this.settings,
    required this.diets,
  });

  factory App.staticConstructor({
    required settings,
    required diets,
  }) =>
      App(settings: settings, diets: diets);

  Map<String, dynamic> get attributes__ =>
      {"settings": settings, "diets": diets};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is App &&
          runtimeType == other.runtimeType &&
          equals(settings, other.settings) &&
          equals(diets, other.diets));

  @override
  int get hashCode => settings.hashCode ^ diets.hashCode;

  @override
  String toString() => 'App(settings: $settings, diets: $diets)';

  App copyWithApp({Settings? settings, List<Diet>? diets}) =>
      App(settings: settings ?? this.settings, diets: diets ?? this.diets);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'App', ...nestedJsonMap(attributes__)};

  factory App.fromJson(String json) => App.fromMap(jsonDecode(json));

  factory App.fromMap(Map map) {
    Settings settings = dejsonify(map['settings']);
    List dietsTemp = dejsonify(map['diets']);

    List<Diet> diets = List<Diet>.from(dietsTemp);

    return App(settings: settings, diets: diets);
  }
  // </Dataclass>

  // </editor-fold>
}

/// Diet Branch

@Dataclass()
class Diet {
  String name;
  List<Day> days;
  List<Meal> meals;
  List<Ingredient> baseIngredients;
  AnthroMetrics anthroMetrics;
  DRIS dris;

  List<MealComponentFactory> get ingredients =>
      [...baseIngredients, ...meals.where((element) => element.isSubRecipe)];
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
    required this.meals,
    required this.baseIngredients,
    required this.anthroMetrics,
    required this.dris,
  });

  factory Diet.staticConstructor({
    required name,
    required days,
    required meals,
    required baseIngredients,
    required anthroMetrics,
    required dris,
  }) =>
      Diet(
          name: name,
          days: days,
          meals: meals,
          baseIngredients: baseIngredients,
          anthroMetrics: anthroMetrics,
          dris: dris);

  Map<String, dynamic> get attributes__ => {
        "name": name,
        "days": days,
        "meals": meals,
        "baseIngredients": baseIngredients,
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
          equals(meals, other.meals) &&
          equals(baseIngredients, other.baseIngredients) &&
          equals(anthroMetrics, other.anthroMetrics) &&
          equals(dris, other.dris));

  @override
  int get hashCode =>
      name.hashCode ^
      days.hashCode ^
      meals.hashCode ^
      baseIngredients.hashCode ^
      anthroMetrics.hashCode ^
      dris.hashCode;

  @override
  String toString() =>
      'Diet(name: $name, days: $days, meals: $meals, baseIngredients: $baseIngredients, anthroMetrics: $anthroMetrics, dris: $dris)';

  Diet copyWithDiet(
          {String? name,
          List<Day>? days,
          List<Meal>? meals,
          List<Ingredient>? baseIngredients,
          AnthroMetrics? anthroMetrics,
          DRIS? dris}) =>
      Diet(
          name: name ?? this.name,
          days: days ?? this.days,
          meals: meals ?? this.meals,
          baseIngredients: baseIngredients ?? this.baseIngredients,
          anthroMetrics: anthroMetrics ?? this.anthroMetrics,
          dris: dris ?? this.dris);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'Diet', ...nestedJsonMap(attributes__)};

  factory Diet.fromJson(String json) => Diet.fromMap(jsonDecode(json));

  factory Diet.fromMap(Map map) {
    String name = map['name'];
    List daysTemp = dejsonify(map['days']);
    List mealsTemp = dejsonify(map['meals']);
    List baseIngredientsTemp = dejsonify(map['baseIngredients']);
    AnthroMetrics anthroMetrics = dejsonify(map['anthroMetrics']);
    DRIS dris = dejsonify(map['dris']);

    List<Day> days = List<Day>.from(daysTemp);

    List<Meal> meals = List<Meal>.from(mealsTemp);

    List<Ingredient> baseIngredients =
        List<Ingredient>.from(baseIngredientsTemp);

    return Diet(
        name: name,
        days: days,
        meals: meals,
        baseIngredients: baseIngredients,
        anthroMetrics: anthroMetrics,
        dris: dris);
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



