import 'package:nutrition_app/mydataclasses/metadata.dart';
import 'dart:convert';
import 'package:dataclasses/dataclasses.dart';

// @Dataclass()
// class Settings {
//   String
// }

@Dataclass()
class Diet {
  String name;
  DRI dri;
  List<Ingredient> shoppingList() {
    throw UnimplementedError();
  }

  // <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  Diet({
    required this.name,
    required this.dri,
  });

  factory Diet.staticConstructor({
    required name,
    required dri,
  }) =>
      Diet(name: name, dri: dri);

  Map<String, dynamic> get attributes__ => {"name": name, "dri": dri};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Diet &&
          runtimeType == other.runtimeType &&
          equals(name, other.name) &&
          equals(dri, other.dri));

  @override
  int get hashCode => name.hashCode ^ dri.hashCode;

  @override
  String toString() => 'Diet(name: $name, dri: $dri)';

  Diet copyWithDiet(String? name, DRI? dri) =>
      Diet(name: name ?? this.name, dri: dri ?? this.dri);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'Diet', ...nestedJsonMap(attributes__)};

  factory Diet.fromJson(String json) => Diet.fromMap(jsonDecode(json));

  factory Diet.fromMap(Map map) {
    String name = map['name'];
    DRI dri = dejsonify(map['dri']);

    // No casting

    return Diet(name: name, dri: dri);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class DRI {
  Nutrients nutrients;

  compareToNutrients() {}
  DRI subify() {
    throw UnimplementedError();
  }

  // <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  DRI({
    required this.nutrients,
  });

  factory DRI.staticConstructor({
    required nutrients,
  }) =>
      DRI(nutrients: nutrients);

  Map<String, dynamic> get attributes__ => {"nutrients": nutrients};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DRI &&
          runtimeType == other.runtimeType &&
          equals(nutrients, other.nutrients));

  @override
  int get hashCode => nutrients.hashCode;

  @override
  String toString() => 'DRI(nutrients: $nutrients)';

  DRI copyWithDRI(Nutrients? nutrients) =>
      DRI(nutrients: nutrients ?? this.nutrients);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'DRI', ...nestedJsonMap(attributes__)};

  factory DRI.fromJson(String json) => DRI.fromMap(jsonDecode(json));

  factory DRI.fromMap(Map map) {
    Nutrients nutrients = dejsonify(map['nutrients']);

    // No casting

    return DRI(nutrients: nutrients);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class Day {
  List<Meal> meals;
  int dayNumber;

  Nutrients get nutrients {
    throw UnimplementedError();
  }

  // <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  Day({
    required this.meals,
    required this.dayNumber,
  });

  factory Day.staticConstructor({
    required meals,
    required dayNumber,
  }) =>
      Day(meals: meals, dayNumber: dayNumber);

  Map<String, dynamic> get attributes__ =>
      {"meals": meals, "dayNumber": dayNumber};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Day &&
          runtimeType == other.runtimeType &&
          equals(meals, other.meals) &&
          equals(dayNumber, other.dayNumber));

  @override
  int get hashCode => meals.hashCode ^ dayNumber.hashCode;

  @override
  String toString() => 'Day(meals: $meals, dayNumber: $dayNumber)';

  Day copyWithDay(List<Meal>? meals, int? dayNumber) =>
      Day(meals: meals ?? this.meals, dayNumber: dayNumber ?? this.dayNumber);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'Day', ...nestedJsonMap(attributes__)};

  factory Day.fromJson(String json) => Day.fromMap(jsonDecode(json));

  factory Day.fromMap(Map map) {
    List mealsTemp = dejsonify(map['meals']);
    int dayNumber = map['dayNumber'];

    List<Meal> meals = List<Meal>.from(mealsTemp);

    return Day(meals: meals, dayNumber: dayNumber);
  }
  // </Dataclass>

  // </editor-fold>
}

abstract class MealComponent {
  late dynamic image;
  Nutrients get nutrients;
  late String name;
  Source get source;
  late num grams;
}

@Dataclass()
class Meal implements MealComponent {
  List<MealComponent> ingredients;
  int servingSize = 1;
  String name;
  dynamic image;
  final Source source = Source.meal;
  late num grams;

  @override
  get nutrients => throw UnimplementedError();

  // <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  Meal(
      {required this.ingredients,
      required this.name,
      this.servingSize = 1,
      this.image}) {
    // TODO: initiate late attribute `grams`
  }

  factory Meal.staticConstructor(
          {required ingredients, required name, servingSize = 1, image}) =>
      Meal(
          ingredients: ingredients,
          name: name,
          servingSize: servingSize,
          image: image);

  Map<String, dynamic> get attributes__ => {
        "ingredients": ingredients,
        "servingSize": servingSize,
        "name": name,
        "image": image,
        "grams": grams
      };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Meal &&
          runtimeType == other.runtimeType &&
          equals(ingredients, other.ingredients) &&
          equals(servingSize, other.servingSize) &&
          equals(name, other.name) &&
          equals(image, other.image) &&
          equals(grams, other.grams));

  @override
  int get hashCode =>
      ingredients.hashCode ^
      servingSize.hashCode ^
      name.hashCode ^
      image.hashCode ^
      grams.hashCode;

  @override
  String toString() =>
      'Meal(ingredients: $ingredients, servingSize: $servingSize, name: $name, image: $image, grams: $grams)';

  Meal copyWithMeal(List<MealComponent>? ingredients, int? servingSize,
          String? name, dynamic? image) =>
      Meal(
          ingredients: ingredients ?? this.ingredients,
          servingSize: servingSize ?? this.servingSize,
          name: name ?? this.name,
          image: image ?? this.image);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'Meal', ...nestedJsonMap(attributes__)};

  factory Meal.fromJson(String json) => Meal.fromMap(jsonDecode(json));

  factory Meal.fromMap(Map map) {
    List ingredientsTemp = dejsonify(map['ingredients']);
    int servingSize = map['servingSize'];
    String name = map['name'];
    dynamic? image = map['image'] == null ? null : dejsonify(map['image']);

    List<MealComponent> ingredients = List<MealComponent>.from(ingredientsTemp);

    return Meal(
        ingredients: ingredients,
        servingSize: servingSize,
        name: name,
        image: image);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class BaseIngredient {
  dynamic image;
  String name;
  Source source;
  dynamic sourceMetadata;
  List<AltMeasure> altMeasures;

  Ingredient toIngredient(String measure, int quantity) {
    num grams = AltMeasure.fromMeasures(altMeasures, measure).toGrams(quantity);
    return Ingredient(
        grams: grams,
        image: image,
        name: name,
        source: source,
        sourceMetadata: sourceMetadata,
        altMeasures: altMeasures);
  }

  // <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  BaseIngredient(
      {required this.name,
      required this.source,
      required this.altMeasures,
      this.image,
      this.sourceMetadata});

  factory BaseIngredient.staticConstructor(
          {required name,
          required source,
          required altMeasures,
          image,
          sourceMetadata}) =>
      BaseIngredient(
          name: name,
          source: source,
          altMeasures: altMeasures,
          image: image,
          sourceMetadata: sourceMetadata);

  Map<String, dynamic> get attributes__ => {
        "image": image,
        "name": name,
        "source": source,
        "sourceMetadata": sourceMetadata,
        "altMeasures": altMeasures
      };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BaseIngredient &&
          runtimeType == other.runtimeType &&
          equals(image, other.image) &&
          equals(name, other.name) &&
          equals(source, other.source) &&
          equals(sourceMetadata, other.sourceMetadata) &&
          equals(altMeasures, other.altMeasures));

  @override
  int get hashCode =>
      image.hashCode ^
      name.hashCode ^
      source.hashCode ^
      sourceMetadata.hashCode ^
      altMeasures.hashCode;

  @override
  String toString() =>
      'BaseIngredient(image: $image, name: $name, source: $source, sourceMetadata: $sourceMetadata, altMeasures: $altMeasures)';

  BaseIngredient copyWithBaseIngredient(
          dynamic? image,
          String? name,
          Source? source,
          dynamic? sourceMetadata,
          List<AltMeasure>? altMeasures) =>
      BaseIngredient(
          image: image ?? this.image,
          name: name ?? this.name,
          source: source ?? this.source,
          sourceMetadata: sourceMetadata ?? this.sourceMetadata,
          altMeasures: altMeasures ?? this.altMeasures);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'BaseIngredient', ...nestedJsonMap(attributes__)};

  factory BaseIngredient.fromJson(String json) =>
      BaseIngredient.fromMap(jsonDecode(json));

  factory BaseIngredient.fromMap(Map map) {
    dynamic? image = map['image'] == null ? null : dejsonify(map['image']);
    String name = map['name'];
    Source source = dejsonify(map['source']);
    dynamic? sourceMetadata =
        map['sourceMetadata'] == null ? null : dejsonify(map['sourceMetadata']);
    List altMeasuresTemp = dejsonify(map['altMeasures']);

    List<AltMeasure> altMeasures = List<AltMeasure>.from(altMeasuresTemp);

    return BaseIngredient(
        image: image,
        name: name,
        source: source,
        sourceMetadata: sourceMetadata,
        altMeasures: altMeasures);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class Ingredient extends BaseIngredient implements MealComponent {
  @override
  num grams;

  Ingredient(
      {required this.grams,
      required super.image,
      required super.name,
      required super.source,
      required super.sourceMetadata,
      required super.altMeasures});

  @override
  Nutrients get nutrients => throw UnimplementedError();
}

@Dataclass()
class Nutrients {
  Nutrient calories;
  Nutrient unsaturatedFat;
  Nutrient saturatedFat;
  Nutrient protein;
  Nutrient carbohydrates;
  // TODO continue this list

  // <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  Nutrients({
    required this.calories,
    required this.unsaturatedFat,
    required this.saturatedFat,
    required this.protein,
    required this.carbohydrates,
  });

  factory Nutrients.staticConstructor({
    required calories,
    required unsaturatedFat,
    required saturatedFat,
    required protein,
    required carbohydrates,
  }) =>
      Nutrients(
          calories: calories,
          unsaturatedFat: unsaturatedFat,
          saturatedFat: saturatedFat,
          protein: protein,
          carbohydrates: carbohydrates);

  Map<String, dynamic> get attributes__ => {
        "calories": calories,
        "unsaturatedFat": unsaturatedFat,
        "saturatedFat": saturatedFat,
        "protein": protein,
        "carbohydrates": carbohydrates
      };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Nutrients &&
          runtimeType == other.runtimeType &&
          equals(calories, other.calories) &&
          equals(unsaturatedFat, other.unsaturatedFat) &&
          equals(saturatedFat, other.saturatedFat) &&
          equals(protein, other.protein) &&
          equals(carbohydrates, other.carbohydrates));

  @override
  int get hashCode =>
      calories.hashCode ^
      unsaturatedFat.hashCode ^
      saturatedFat.hashCode ^
      protein.hashCode ^
      carbohydrates.hashCode;

  @override
  String toString() =>
      'Nutrients(calories: $calories, unsaturatedFat: $unsaturatedFat, saturatedFat: $saturatedFat, protein: $protein, carbohydrates: $carbohydrates)';

  Nutrients copyWithNutrients(Nutrient? calories, Nutrient? unsaturatedFat,
          Nutrient? saturatedFat, Nutrient? protein, Nutrient? carbohydrates) =>
      Nutrients(
          calories: calories ?? this.calories,
          unsaturatedFat: unsaturatedFat ?? this.unsaturatedFat,
          saturatedFat: saturatedFat ?? this.saturatedFat,
          protein: protein ?? this.protein,
          carbohydrates: carbohydrates ?? this.carbohydrates);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'Nutrients', ...nestedJsonMap(attributes__)};

  factory Nutrients.fromJson(String json) =>
      Nutrients.fromMap(jsonDecode(json));

  factory Nutrients.fromMap(Map map) {
    Nutrient calories = dejsonify(map['calories']);
    Nutrient unsaturatedFat = dejsonify(map['unsaturatedFat']);
    Nutrient saturatedFat = dejsonify(map['saturatedFat']);
    Nutrient protein = dejsonify(map['protein']);
    Nutrient carbohydrates = dejsonify(map['carbohydrates']);

    // No casting

    return Nutrients(
        calories: calories,
        unsaturatedFat: unsaturatedFat,
        saturatedFat: saturatedFat,
        protein: protein,
        carbohydrates: carbohydrates);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class Nutrient {
  int quantity;
  String unit;
  // <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  Nutrient({
    required this.quantity,
    required this.unit,
  });

  factory Nutrient.staticConstructor({
    required quantity,
    required unit,
  }) =>
      Nutrient(quantity: quantity, unit: unit);

  Map<String, dynamic> get attributes__ => {"quantity": quantity, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Nutrient &&
          runtimeType == other.runtimeType &&
          equals(quantity, other.quantity) &&
          equals(unit, other.unit));

  @override
  int get hashCode => quantity.hashCode ^ unit.hashCode;

  @override
  String toString() => 'Nutrient(quantity: $quantity, unit: $unit)';

  Nutrient copyWithNutrient(int? quantity, String? unit) =>
      Nutrient(quantity: quantity ?? this.quantity, unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'Nutrient', ...nestedJsonMap(attributes__)};

  factory Nutrient.fromJson(String json) => Nutrient.fromMap(jsonDecode(json));

  factory Nutrient.fromMap(Map map) {
    int quantity = map['quantity'];
    String unit = map['unit'];

    // No casting

    return Nutrient(quantity: quantity, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

class AltMeasure {
  String name;
  int origin = 1;
  int gramRatio;

  num toGrams(num quantity) {
    return quantity * gramRatio;
  }

  AltMeasure({
    required this.name,
    this.origin = 1,
    required this.gramRatio,
  });
  static AltMeasure fromMeasures(List<AltMeasure> measures, String name) {
    for (AltMeasure measure in measures) {
      if (measure.name.toLowerCase() == name.toLowerCase()) {
        return measure;
      }
    }
    throw Exception('$name not in $measures');
  }
}

enum Source { upc, string, meal, custom }
