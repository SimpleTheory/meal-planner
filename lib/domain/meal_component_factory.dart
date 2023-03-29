import 'dart:convert';
import 'package:dataclasses/dataclasses.dart';
import 'package:nutrition_app/domain.dart';
import 'package:nutrition_app/mydataclasses/metadata.dart';

/// Interfaces
abstract class MealComponentFactory {
  String name;
  BaseNutrients baseNutrient;
  Map<String, num> altMeasures2grams;

  MealComponentFactory(this.baseNutrient, this.altMeasures2grams, this.name) {
    altMeasures2grams['grams'] = 1;
  }
  MealComponent toMealComponent(
      String measure, num quantity, MealComponentFactory reference) {
    num grams = quantity * altMeasures2grams[measure]!;
    return MealComponent(grams: grams, reference: reference);
  }

  Uri? get photo => null;
}

/// Meal Component Implementation
/// Infinitive (Includes: Meal)

@Dataclass()
class Ingredient extends MealComponentFactory {
  // <editor-fold desc="Parent Attrs">
  @Super('+++')
  String name;
  @Super('+')
  BaseNutrients baseNutrient;
  @Super('++')
  Map<String, num> altMeasures2grams;
  @override
  Uri? photo;
  // </editor-fold>
  IngredientSource source;
  dynamic sourceMetadata;

  // <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  Ingredient(
      {required this.name,
      required this.baseNutrient,
      required this.altMeasures2grams,
      required this.source,
      this.photo,
      this.sourceMetadata})
      : super(
          baseNutrient,
          altMeasures2grams,
          name,
        );

  factory Ingredient.staticConstructor(
          {required name,
          required baseNutrient,
          required altMeasures2grams,
          required source,
          photo,
          sourceMetadata}) =>
      Ingredient(
          name: name,
          baseNutrient: baseNutrient,
          altMeasures2grams: altMeasures2grams,
          source: source,
          photo: photo,
          sourceMetadata: sourceMetadata);

  Map<String, dynamic> get attributes__ => {
        "name": name,
        "baseNutrient": baseNutrient,
        "altMeasures2grams": altMeasures2grams,
        "photo": photo,
        "source": source,
        "sourceMetadata": sourceMetadata
      };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Ingredient &&
          runtimeType == other.runtimeType &&
          equals(name, other.name) &&
          equals(baseNutrient, other.baseNutrient) &&
          equals(altMeasures2grams, other.altMeasures2grams) &&
          equals(photo, other.photo) &&
          equals(source, other.source) &&
          equals(sourceMetadata, other.sourceMetadata));

  @override
  int get hashCode =>
      name.hashCode ^
      baseNutrient.hashCode ^
      altMeasures2grams.hashCode ^
      photo.hashCode ^
      source.hashCode ^
      sourceMetadata.hashCode;

  @override
  String toString() =>
      'Ingredient(name: $name, baseNutrient: $baseNutrient, altMeasures2grams: $altMeasures2grams, photo: $photo, source: $source, sourceMetadata: $sourceMetadata)';

  Ingredient copyWithIngredient(
          {String? name,
          BaseNutrients? baseNutrient,
          Map<String, num>? altMeasures2grams,
          Uri? photo,
          IngredientSource? source,
          dynamic? sourceMetadata}) =>
      Ingredient(
          name: name ?? this.name,
          baseNutrient: baseNutrient ?? this.baseNutrient,
          altMeasures2grams: altMeasures2grams ?? this.altMeasures2grams,
          photo: photo ?? this.photo,
          source: source ?? this.source,
          sourceMetadata: sourceMetadata ?? this.sourceMetadata);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'Ingredient', ...nestedJsonMap(attributes__)};

  factory Ingredient.fromJson(String json) =>
      Ingredient.fromMap(jsonDecode(json));

  factory Ingredient.fromMap(Map map) {
    String name = map['name'];
    BaseNutrients baseNutrient = dejsonify(map['baseNutrient']);
    Map altMeasures2gramsTemp = dejsonify(map['altMeasures2grams']);
    Uri? photo = dejsonify(map['photo']);
    IngredientSource source = dejsonify(map['source']);
    dynamic? sourceMetadata = dejsonify(map['sourceMetadata']);

    Map<String, num> altMeasures2grams = Map<String, num>.from(
        altMeasures2gramsTemp
            .map((__k0, __v0) => MapEntry(__k0 as String, __v0 as num)));

    return Ingredient(
        name: name,
        baseNutrient: baseNutrient,
        altMeasures2grams: altMeasures2grams,
        photo: photo,
        source: source,
        sourceMetadata: sourceMetadata);
  }
  // </Dataclass>

// </editor-fold>
}

@Dataclass(constructor: false)
class Meal extends MealComponentFactory {
  @Super('+++')
  String name;
  List<MealComponent> ingredients;
  int servings;
  bool isSubRecipe;
  @override
  Uri? photo;

  Meal(
      {required this.name,
      required this.ingredients,
      this.servings = 1,
      this.photo,
      required this.isSubRecipe})
      : super(
            BaseNutrients(
                grams: (ingredients
                        .map((e) => e.grams)
                        .toList()
                        .reduce((previous, current) => previous + current)) /
                    servings,
                nutrients: Nutrients.sum(
                        ingredients.map((e) => e.nutrients).toList()) /
                    servings),
            {
              'servings': (ingredients
                      .map((e) => e.grams)
                      .toList()
                      .reduce((previous, current) => previous + current)) /
                  servings
            },
            name);

  // <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  factory Meal.staticConstructor(
          {required name,
          required ingredients,
          required servings,
          required isSubRecipe,
          photo}) =>
      Meal(
          name: name,
          ingredients: ingredients,
          servings: servings,
          isSubRecipe: isSubRecipe,
          photo: photo);

  Map<String, dynamic> get attributes__ => {
        "name": name,
        "ingredients": ingredients,
        "servings": servings,
        "isSubRecipe": isSubRecipe,
        "photo": photo
      };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Meal &&
          runtimeType == other.runtimeType &&
          equals(name, other.name) &&
          equals(ingredients, other.ingredients) &&
          equals(servings, other.servings) &&
          equals(isSubRecipe, other.isSubRecipe) &&
          equals(photo, other.photo));

  @override
  int get hashCode =>
      name.hashCode ^
      ingredients.hashCode ^
      servings.hashCode ^
      isSubRecipe.hashCode ^
      photo.hashCode;

  @override
  String toString() =>
      'Meal(name: $name, ingredients: $ingredients, servings: $servings, isSubRecipe: $isSubRecipe, photo: $photo)';

  Meal copyWithMeal(
          {String? name,
          List<MealComponent>? ingredients,
          int? servings,
          bool? isSubRecipe,
          Uri? photo}) =>
      Meal(
          name: name ?? this.name,
          ingredients: ingredients ?? this.ingredients,
          servings: servings ?? this.servings,
          isSubRecipe: isSubRecipe ?? this.isSubRecipe,
          photo: photo ?? this.photo);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'Meal', ...nestedJsonMap(attributes__)};

  factory Meal.fromJson(String json) => Meal.fromMap(jsonDecode(json));

  factory Meal.fromMap(Map map) {
    String name = map['name'];
    List ingredientsTemp = dejsonify(map['ingredients']);
    int servings = map['servings'];
    bool isSubRecipe = map['isSubRecipe'];
    Uri? photo = dejsonify(map['photo']);

    List<MealComponent> ingredients = List<MealComponent>.from(ingredientsTemp);

    return Meal(
        name: name,
        ingredients: ingredients,
        servings: servings,
        isSubRecipe: isSubRecipe,
        photo: photo);
  }
  // </Dataclass>

// </editor-fold>
}
