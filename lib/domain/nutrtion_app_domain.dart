import 'package:nutrition_app/mydataclasses/metadata.dart';
import 'dart:convert';
import 'package:dataclasses/dataclasses.dart';
import 'package:nutrition_app/domain.dart';
import 'package:nutrition_app/utils/utils.dart';

/// AGG ROOT
@Dataclass()
class App {
  Settings settings;
  Map<String, Diet> diets;
  Map<String, Meal> meals;
  Map<String, Ingredient> baseIngredients;
  List<MealComponentFactory> get ingredients => [
        ...baseIngredients.values,
        ...meals.values.where((element) => element.isSubRecipe)
      ];

  // What can an app do?
  // TODO: Make this actually good
  void addMeal(Meal meal) {
    meals[meal.name] = meal;
  }

  void addBaseIngredient(Ingredient ingredient) {
    baseIngredients[ingredient.name] = ingredient;
  }

  void addDiet(Diet diet) {
    diets[diet.name] = diet;
  }

  // Update Meal, Diet: just access key with copyWith

  // Delete: meal, ingredient, diet
  void deleteMeal(Meal meal) {}
  void deleteBaseIngredient(Ingredient ingredient) {}
  void deleteDiet(Diet diet) {}

  factory App.newApp(Settings settings) =>
      App(settings: settings, diets: {}, meals: {}, baseIngredients: {});

  // <editor-fold desc="Dataclass Section">

  // <editor-fold desc="Singleton Pattern">
  // static late final App _singleton;
  //
  // factory App() {
  //   return _singleton;
  // }
  //
  // App._internal({
  //   required this.settings,
  //   required this.diets,
  //   required this.meals,
  //   required this.baseIngredients,
  // });
  //
  // factory App.restart({required Settings settings}) {
  //   _singleton = App._internal(
  //       settings: settings,
  //       diets: <Diet>[],
  //       meals: <Meal>[],
  //       baseIngredients: <Ingredient>[]);
  //   return _singleton;
  // }

  // </editor-fold>

  // <editor-fold desc="Custom Data Functions">
  // App update(
  //     {Settings? settings,
  //     List<Diet>? diets,
  //     List<Meal>? meals,
  //     List<Ingredient>? baseIngredients}) {
  //   _singleton = App._internal(
  //       settings: settings ?? this.settings,
  //       diets: diets ?? this.diets,
  //       meals: meals ?? this.meals,
  //       baseIngredients: baseIngredients ?? this.baseIngredients);
  //   return _singleton;
  // }
  //
  // factory App.fromMap(Map map) {
  //   Settings settings = dejsonify(map['settings']);
  //   List dietsTemp = dejsonify(map['diets']);
  //   List mealsTemp = dejsonify(map['meals']);
  //   List baseIngredientsTemp = dejsonify(map['baseIngredients']);
  //
  //   List<Diet> diets = List<Diet>.from(dietsTemp);
  //
  //   List<Meal> meals = List<Meal>.from(mealsTemp);
  //
  //   List<Ingredient> baseIngredients =
  //       List<Ingredient>.from(baseIngredientsTemp);
  //
  //   _singleton = App._internal(
  //       settings: settings,
  //       diets: diets,
  //       meals: meals,
  //       baseIngredients: baseIngredients);
  //   return _singleton;
  // }
  // factory App.fromJson(String json) => App.fromMap(jsonDecode(json));
  // </editor-fold>

  // <editor-fold desc="Regular Dataclass Section">
  @Generate()
  // <Dataclass>

  App({
    required this.settings,
    required this.diets,
    required this.meals,
    required this.baseIngredients,
  });

  factory App.staticConstructor({
    required settings,
    required diets,
    required meals,
    required baseIngredients,
  }) =>
      App(
          settings: settings,
          diets: diets,
          meals: meals,
          baseIngredients: baseIngredients);

  Map<String, dynamic> get attributes__ => {
        "settings": settings,
        "diets": diets,
        "meals": meals,
        "baseIngredients": baseIngredients
      };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is App &&
          runtimeType == other.runtimeType &&
          equals(settings, other.settings) &&
          equals(diets, other.diets) &&
          equals(meals, other.meals) &&
          equals(baseIngredients, other.baseIngredients));

  @override
  int get hashCode =>
      settings.hashCode ^
      diets.hashCode ^
      meals.hashCode ^
      baseIngredients.hashCode;

  @override
  String toString() =>
      'App(settings: $settings, diets: $diets, meals: $meals, baseIngredients: $baseIngredients)';

  App copyWithApp(
          {Settings? settings,
          Map<String, Diet>? diets,
          Map<String, Meal>? meals,
          Map<String, Ingredient>? baseIngredients}) =>
      App(
          settings: settings ?? this.settings,
          diets: diets ?? this.diets,
          meals: meals ?? this.meals,
          baseIngredients: baseIngredients ?? this.baseIngredients);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'App', ...nestedJsonMap(attributes__)};

  factory App.fromJson(String json) => App.fromMap(jsonDecode(json));

  factory App.fromMap(Map map) {
    Settings settings = dejsonify(map['settings']);
    Map dietsTemp = dejsonify(map['diets']);
    Map mealsTemp = dejsonify(map['meals']);
    Map baseIngredientsTemp = dejsonify(map['baseIngredients']);

    Map<String, Diet> diets = Map<String, Diet>.from(
        dietsTemp.map((__k0, __v0) => MapEntry(__k0 as String, __v0 as Diet)));

    Map<String, Meal> meals = Map<String, Meal>.from(
        mealsTemp.map((__k0, __v0) => MapEntry(__k0 as String, __v0 as Meal)));

    Map<String, Ingredient> baseIngredients = Map<String, Ingredient>.from(
        baseIngredientsTemp
            .map((__k0, __v0) => MapEntry(__k0 as String, __v0 as Ingredient)));

    return App(
        settings: settings,
        diets: diets,
        meals: meals,
        baseIngredients: baseIngredients);
  }
  // </Dataclass>
  // </editor-fold>

  // </editor-fold>
}

/// Diet Branch

@Dataclass(constructor: false)
class Diet {
  String name;
  List<Day> days;
  DRIS dris;
  late Map<String, List<MealComponent>> shoppingList;

  // TODO persistent shopping list with categories

  Nutrients get averageNutrition {
    final dayNut = days.map((e) => e.nutrients);
    Nutrients sum = Nutrients.sum(dayNut);
    return sum / dayNut.length;
  }

  void createDay() {
    days.add(Day(name: days.length.toString(), meals: []));
  }

  static Future<Diet> create(String name, Settings settings) async {
    final dris = await DRIS.fromAPI(settings.anthroMetrics);
    return Diet(name: name, days: <Day>[], dris: dris);
}
  // For update access by index setter days[index] = newDay;

  void removeDay(int day) {
    days.removeAt(day);
  }

  List<MealComponent> initShoppingList() {
    List container = [];
    for (Day day in days) {
      for (MealComponent meal in day.meals) {
        container.add(meal.getBaseIngredients());
      }
    }
    List<MealComponent> flattened = flatten<MealComponent>(container).toList();
    final result = combineListValuesToMap<MealComponent, String, MealComponent>(
        flattened,
        (elemToKey) => elemToKey.name,
        (elemToValue) => elemToValue,
        (existingSameKeyValue, newSameKeyValue) =>
            existingSameKeyValue.copyWithMealComponent(
                grams: existingSameKeyValue.grams + newSameKeyValue.grams));
    return result.values.toList();
  }

  void updateShoppingList() {
    // TODO TEST
    Map<MealComponent, String> currentShoppingDummy = {};
    for (MapEntry<String, List<MealComponent>> keyList
        in shoppingList.entries) {
      currentShoppingDummy
          .addAll({for (MealComponent ing in keyList.value) ing: keyList.key});
    }
    Map<String, MealComponent> namesDummy = {
      for (MealComponent meal in currentShoppingDummy.keys) meal.name: meal
    };
    for (MealComponent mealComponent in initShoppingList()) {
      if (currentShoppingDummy.keys.contains(mealComponent)) {
        continue;
      } else if (namesDummy.containsKey(mealComponent.name)) {
        final temp = currentShoppingDummy[namesDummy[mealComponent.name]];
        currentShoppingDummy.remove(namesDummy[mealComponent.name]);
        currentShoppingDummy[mealComponent] = temp!;
      } else {
        currentShoppingDummy[mealComponent] = 'Good';
      }
    }
    shoppingList = {
      'Good': [],
      'Running Low': [],
      'Out of Stock': [],
      'On the Way': []
    };
    for (MapEntry<MealComponent, String> entry
        in currentShoppingDummy.entries) {
      shoppingList[entry.value]?.add(entry.key);
    }
  }

  // <editor-fold desc="Dataclass Section">
  Diet(
      {required this.name,
      required this.days,
      required this.dris,
      Map<String, List<MealComponent>>? shoppingList}) {
    this.shoppingList = shoppingList ??
        {
          'Good': initShoppingList(),
          'Running Low': [],
          'Out of Stock': [],
          'On the Way': []
        };
  }
  @Generate()
  // <Dataclass>

  factory Diet.staticConstructor({
    required name,
    required days,
    required dris,
  }) =>
      Diet(name: name, days: days, dris: dris);

  Map<String, dynamic> get attributes__ =>
      {"name": name, "days": days, "dris": dris, "shoppingList": shoppingList};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Diet &&
          runtimeType == other.runtimeType &&
          equals(name, other.name) &&
          equals(days, other.days) &&
          equals(dris, other.dris) &&
          equals(shoppingList, other.shoppingList));

  @override
  int get hashCode =>
      name.hashCode ^ days.hashCode ^ dris.hashCode ^ shoppingList.hashCode;

  @override
  String toString() =>
      'Diet(name: $name, days: $days, dris: $dris, shoppingList: $shoppingList)';

  Diet copyWithDiet({String? name, List<Day>? days, DRIS? dris}) => Diet(
      name: name ?? this.name,
      days: days ?? this.days,
      dris: dris ?? this.dris);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'Diet', ...nestedJsonMap(attributes__)};

  factory Diet.fromJson(String json) => Diet.fromMap(jsonDecode(json));

  factory Diet.fromMap(Map map) {
    String name = map['name'];
    List daysTemp = dejsonify(map['days']);
    DRIS dris = dejsonify(map['dris']);

    List<Day> days = List<Day>.from(daysTemp);

    return Diet(name: name, days: days, dris: dris);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class Day {
  String name;
  List<MealComponent> meals;

  Nutrients get nutrients => Nutrients.sum(meals.map((e) => e.nutrients));

  void addDayMeal(Meal meal) {
    meals.add(meal.toMealComponent('servings', 1, meal));
  }

  void deleteDayMeal(int index) {
    meals.removeAt(index);
  }

  void updateMealServingSize(int index, String measure, num newAmount) {
    MealComponent newMeal = meals[index]
        .reference
        .toMealComponent(measure, newAmount, meals[index].reference);
    meals[index] = newMeal;
  }

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

  String get name => reference.name;

  /// Returns List<MealComponent> or itself, depending on whether this references
  /// a Meal (List) or an Ingredient (Itself). In order to recursively get all
  /// leaf nodes.
  getBaseIngredients() {
    if (reference is Ingredient) {
      return this;
    } else {
      return reference.baseIngredients();
    }
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
