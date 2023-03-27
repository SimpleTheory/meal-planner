import 'package:nutrition_app/mydataclasses/metadata.dart';
import 'dart:convert';
import 'package:dataclasses/dataclasses.dart';
import 'package:nutrition_app/domain/individual_nutrients.dart';
import 'package:ari_utils/ari_utils.dart';

/// AGG ROOT
@Dataclass()
class App {
  Settings settings;
  List<Diet> diets;

  @Generate
}

@Dataclass()
class Settings {
  String apikey = '';
  bool darkMode = true;

  @Generate
}

/// Diet Branch

@Dataclass()
class Diet {
  List<Day> days;

  @Generate
}

@Dataclass()
class Day {
  List<Meal> meals;

  @Generate
}

@Dataclass()
class Meal {
  List<MealComponent> ingredients;

  MealComponent toMealComponent() {}

  @Generate
}

@Dataclass()
class MealComponent {
  // <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  MealComponent();

  factory MealComponent.staticConstructor() => MealComponent();

  Map<String, dynamic> get attributes__ => {};

  @override
  String toString() => 'MealComponent()';

  MealComponent copyWithMealComponent() => MealComponent();

  String toJson() => jsonEncode(toMap());

  Map<String, dynamic> toMap() =>
      {'__type': 'MealComponent', ...nestedJsonMap(attributes__)};

  factory MealComponent.fromJson(String json) =>
      MealComponent.fromMap(jsonDecode(json));

  factory MealComponent.fromMap(Map map) {
    // No casting

    return MealComponent();
  }
// </Dataclass>

// </editor-fold>
}

/// Infinitive (Includes: Meal)

@Dataclass()
class Ingredient {
  MealComponent toMealComponent() {}

  @Generate
}

@Dataclass()
class Nutrients {
  // List off nutrients here

  List<Nutrient> get nutList => throw UnimplementedError();
  Nutrients operator +(Nutrients other) {}
  Nutrients operator *(num other) {}

  @Generate()
}

@Dataclass()
class Danny {
  String name;
  var family;

  @Generate()
}

/// Data carriers (Kind of Nutrients also^)

/// Other
// @Dataclass()
// class DRI {
//
//  @Gen
// }

// Everything has a nutrients
// TODO Attribute classes!
