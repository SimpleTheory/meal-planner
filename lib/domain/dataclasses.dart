import 'package:nutrition_app/mydataclasses/metadata.dart';
import 'dart:convert';
import 'package:dataclasses/dataclasses.dart';

import 'individual_nutrients.dart';

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

  Diet copyWithDiet({String? name, DRI? dri}) =>
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

  DRI copyWithDRI({Nutrients? nutrients}) =>
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

  Day copyWithDay({List<Meal>? meals, int? dayNumber}) =>
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

  Meal copyWithMeal(
          {List<MealComponent>? ingredients,
          int? servingSize,
          String? name,
          dynamic? image}) =>
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
          {dynamic? image,
          String? name,
          Source? source,
          dynamic? sourceMetadata,
          List<AltMeasure>? altMeasures}) =>
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
  // List off nutrients here
  final Nutrient calcium;
  final Nutrient carbohydrate;
  final Nutrient cholesterol;
  final Nutrient calories;
  final Nutrient saturatedFat;
  final Nutrient totalFat;
  final Nutrient transFat;
  final Nutrient iron;
  final Nutrient fiber;
  final Nutrient potassium;
  final Nutrient sodium;
  final Nutrient protein;
  final Nutrient sugars;
  final Nutrient choline;
  final Nutrient copper;
  final Nutrient ala;
  final Nutrient linoleicAcid;
  final Nutrient epa;
  final Nutrient dpa;
  final Nutrient dha;
  final Nutrient folate;
  final Nutrient magnesium;
  final Nutrient manganese;
  final Nutrient niacin;
  final Nutrient phosphorus;
  final Nutrient pantothenicAcid;
  final Nutrient riboflavin;
  final Nutrient selenium;
  final Nutrient thiamin;
  final Nutrient vitaminE;
  final Nutrient vitaminA;
  final Nutrient vitaminB12;
  final Nutrient vitaminB6;
  final Nutrient vitaminC;
  final Nutrient vitaminD;
  final Nutrient vitaminK;
  final Nutrient zinc;
  late final Nutrient unsaturatedFat;

  Nutrients operator +(Nutrients other) => Nutrients(
        calcium: Nutrient.Calcium(calcium.value + other.calcium.value),
        carbohydrate: Nutrient.Carbohydrate(
            carbohydrate.value + other.carbohydrate.value),
        cholesterol:
            Nutrient.Cholesterol(cholesterol.value + other.cholesterol.value),
        calories: Nutrient.Calories(calories.value + other.calories.value),
        saturatedFat: Nutrient.SaturatedFat(
            saturatedFat.value + other.saturatedFat.value),
        totalFat: Nutrient.TotalFat(totalFat.value + other.totalFat.value),
        transFat: Nutrient.TransFat(transFat.value + other.transFat.value),
        iron: Nutrient.Iron(iron.value + other.iron.value),
        fiber: Nutrient.Fiber(fiber.value + other.fiber.value),
        potassium: Nutrient.Potassium(potassium.value + other.potassium.value),
        sodium: Nutrient.Sodium(sodium.value + other.sodium.value),
        protein: Nutrient.Protein(protein.value + other.protein.value),
        sugars: Nutrient.Sugars(sugars.value + other.sugars.value),
        choline: Nutrient.Choline(choline.value + other.choline.value),
        copper: Nutrient.Copper(copper.value + other.copper.value),
        ala: Nutrient.ALA(ala.value + other.ala.value),
        linoleicAcid: Nutrient.LinoleicAcid(
            linoleicAcid.value + other.linoleicAcid.value),
        epa: Nutrient.EPA(epa.value + other.epa.value),
        dpa: Nutrient.DPA(dpa.value + other.dpa.value),
        dha: Nutrient.DHA(dha.value + other.dha.value),
        folate: Nutrient.Folate(folate.value + other.folate.value),
        magnesium: Nutrient.Magnesium(magnesium.value + other.magnesium.value),
        manganese: Nutrient.Manganese(manganese.value + other.manganese.value),
        niacin: Nutrient.Niacin(niacin.value + other.niacin.value),
        phosphorus:
            Nutrient.Phosphorus(phosphorus.value + other.phosphorus.value),
        pantothenicAcid: Nutrient.PantothenicAcid(
            pantothenicAcid.value + other.pantothenicAcid.value),
        riboflavin:
            Nutrient.Riboflavin(riboflavin.value + other.riboflavin.value),
        selenium: Nutrient.Selenium(selenium.value + other.selenium.value),
        thiamin: Nutrient.Thiamin(thiamin.value + other.thiamin.value),
        vitaminE: Nutrient.VitaminE(vitaminE.value + other.vitaminE.value),
        vitaminA: Nutrient.VitaminA(vitaminA.value + other.vitaminA.value),
        vitaminB12:
            Nutrient.VitaminB12(vitaminB12.value + other.vitaminB12.value),
        vitaminB6: Nutrient.VitaminB6(vitaminB6.value + other.vitaminB6.value),
        vitaminC: Nutrient.VitaminC(vitaminC.value + other.vitaminC.value),
        vitaminD: Nutrient.VitaminD(vitaminD.value + other.vitaminD.value),
        vitaminK: Nutrient.VitaminK(vitaminK.value + other.vitaminK.value),
        zinc: Nutrient.Zinc(zinc.value + other.zinc.value),
      );

  Nutrients operator -(Nutrients other) => Nutrients(
        calcium: Nutrient.Calcium(calcium.value - other.calcium.value),
        carbohydrate: Nutrient.Carbohydrate(
            carbohydrate.value - other.carbohydrate.value),
        cholesterol:
            Nutrient.Cholesterol(cholesterol.value - other.cholesterol.value),
        calories: Nutrient.Calories(calories.value - other.calories.value),
        saturatedFat: Nutrient.SaturatedFat(
            saturatedFat.value - other.saturatedFat.value),
        totalFat: Nutrient.TotalFat(totalFat.value - other.totalFat.value),
        transFat: Nutrient.TransFat(transFat.value - other.transFat.value),
        iron: Nutrient.Iron(iron.value - other.iron.value),
        fiber: Nutrient.Fiber(fiber.value - other.fiber.value),
        potassium: Nutrient.Potassium(potassium.value - other.potassium.value),
        sodium: Nutrient.Sodium(sodium.value - other.sodium.value),
        protein: Nutrient.Protein(protein.value - other.protein.value),
        sugars: Nutrient.Sugars(sugars.value - other.sugars.value),
        choline: Nutrient.Choline(choline.value - other.choline.value),
        copper: Nutrient.Copper(copper.value - other.copper.value),
        ala: Nutrient.ALA(ala.value - other.ala.value),
        linoleicAcid: Nutrient.LinoleicAcid(
            linoleicAcid.value - other.linoleicAcid.value),
        epa: Nutrient.EPA(epa.value - other.epa.value),
        dpa: Nutrient.DPA(dpa.value - other.dpa.value),
        dha: Nutrient.DHA(dha.value - other.dha.value),
        folate: Nutrient.Folate(folate.value - other.folate.value),
        magnesium: Nutrient.Magnesium(magnesium.value - other.magnesium.value),
        manganese: Nutrient.Manganese(manganese.value - other.manganese.value),
        niacin: Nutrient.Niacin(niacin.value - other.niacin.value),
        phosphorus:
            Nutrient.Phosphorus(phosphorus.value - other.phosphorus.value),
        pantothenicAcid: Nutrient.PantothenicAcid(
            pantothenicAcid.value - other.pantothenicAcid.value),
        riboflavin:
            Nutrient.Riboflavin(riboflavin.value - other.riboflavin.value),
        selenium: Nutrient.Selenium(selenium.value - other.selenium.value),
        thiamin: Nutrient.Thiamin(thiamin.value - other.thiamin.value),
        vitaminE: Nutrient.VitaminE(vitaminE.value - other.vitaminE.value),
        vitaminA: Nutrient.VitaminA(vitaminA.value - other.vitaminA.value),
        vitaminB12:
            Nutrient.VitaminB12(vitaminB12.value - other.vitaminB12.value),
        vitaminB6: Nutrient.VitaminB6(vitaminB6.value - other.vitaminB6.value),
        vitaminC: Nutrient.VitaminC(vitaminC.value - other.vitaminC.value),
        vitaminD: Nutrient.VitaminD(vitaminD.value - other.vitaminD.value),
        vitaminK: Nutrient.VitaminK(vitaminK.value - other.vitaminK.value),
        zinc: Nutrient.Zinc(zinc.value - other.zinc.value),
      );

  Nutrients operator *(num other) => Nutrients(
        calcium: Nutrient.Calcium(calcium.value * other),
        carbohydrate: Nutrient.Carbohydrate(carbohydrate.value * other),
        cholesterol: Nutrient.Cholesterol(cholesterol.value * other),
        calories: Nutrient.Calories(calories.value * other),
        saturatedFat: Nutrient.SaturatedFat(saturatedFat.value * other),
        totalFat: Nutrient.TotalFat(totalFat.value * other),
        transFat: Nutrient.TransFat(transFat.value * other),
        iron: Nutrient.Iron(iron.value * other),
        fiber: Nutrient.Fiber(fiber.value * other),
        potassium: Nutrient.Potassium(potassium.value * other),
        sodium: Nutrient.Sodium(sodium.value * other),
        protein: Nutrient.Protein(protein.value * other),
        sugars: Nutrient.Sugars(sugars.value * other),
        choline: Nutrient.Choline(choline.value * other),
        copper: Nutrient.Copper(copper.value * other),
        ala: Nutrient.ALA(ala.value * other),
        linoleicAcid: Nutrient.LinoleicAcid(linoleicAcid.value * other),
        epa: Nutrient.EPA(epa.value * other),
        dpa: Nutrient.DPA(dpa.value * other),
        dha: Nutrient.DHA(dha.value * other),
        folate: Nutrient.Folate(folate.value * other),
        magnesium: Nutrient.Magnesium(magnesium.value * other),
        manganese: Nutrient.Manganese(manganese.value * other),
        niacin: Nutrient.Niacin(niacin.value * other),
        phosphorus: Nutrient.Phosphorus(phosphorus.value * other),
        pantothenicAcid:
            Nutrient.PantothenicAcid(pantothenicAcid.value * other),
        riboflavin: Nutrient.Riboflavin(riboflavin.value * other),
        selenium: Nutrient.Selenium(selenium.value * other),
        thiamin: Nutrient.Thiamin(thiamin.value * other),
        vitaminE: Nutrient.VitaminE(vitaminE.value * other),
        vitaminA: Nutrient.VitaminA(vitaminA.value * other),
        vitaminB12: Nutrient.VitaminB12(vitaminB12.value * other),
        vitaminB6: Nutrient.VitaminB6(vitaminB6.value * other),
        vitaminC: Nutrient.VitaminC(vitaminC.value * other),
        vitaminD: Nutrient.VitaminD(vitaminD.value * other),
        vitaminK: Nutrient.VitaminK(vitaminK.value * other),
        zinc: Nutrient.Zinc(zinc.value * other),
      );

  Nutrients operator /(num other) => Nutrients(
        calcium: Nutrient.Calcium(calcium.value / other),
        carbohydrate: Nutrient.Carbohydrate(carbohydrate.value / other),
        cholesterol: Nutrient.Cholesterol(cholesterol.value / other),
        calories: Nutrient.Calories(calories.value / other),
        saturatedFat: Nutrient.SaturatedFat(saturatedFat.value / other),
        totalFat: Nutrient.TotalFat(totalFat.value / other),
        transFat: Nutrient.TransFat(transFat.value / other),
        iron: Nutrient.Iron(iron.value / other),
        fiber: Nutrient.Fiber(fiber.value / other),
        potassium: Nutrient.Potassium(potassium.value / other),
        sodium: Nutrient.Sodium(sodium.value / other),
        protein: Nutrient.Protein(protein.value / other),
        sugars: Nutrient.Sugars(sugars.value / other),
        choline: Nutrient.Choline(choline.value / other),
        copper: Nutrient.Copper(copper.value / other),
        ala: Nutrient.ALA(ala.value / other),
        linoleicAcid: Nutrient.LinoleicAcid(linoleicAcid.value / other),
        epa: Nutrient.EPA(epa.value / other),
        dpa: Nutrient.DPA(dpa.value / other),
        dha: Nutrient.DHA(dha.value / other),
        folate: Nutrient.Folate(folate.value / other),
        magnesium: Nutrient.Magnesium(magnesium.value / other),
        manganese: Nutrient.Manganese(manganese.value / other),
        niacin: Nutrient.Niacin(niacin.value / other),
        phosphorus: Nutrient.Phosphorus(phosphorus.value / other),
        pantothenicAcid:
            Nutrient.PantothenicAcid(pantothenicAcid.value / other),
        riboflavin: Nutrient.Riboflavin(riboflavin.value / other),
        selenium: Nutrient.Selenium(selenium.value / other),
        thiamin: Nutrient.Thiamin(thiamin.value / other),
        vitaminE: Nutrient.VitaminE(vitaminE.value / other),
        vitaminA: Nutrient.VitaminA(vitaminA.value / other),
        vitaminB12: Nutrient.VitaminB12(vitaminB12.value / other),
        vitaminB6: Nutrient.VitaminB6(vitaminB6.value / other),
        vitaminC: Nutrient.VitaminC(vitaminC.value / other),
        vitaminD: Nutrient.VitaminD(vitaminD.value / other),
        vitaminK: Nutrient.VitaminK(vitaminK.value / other),
        zinc: Nutrient.Zinc(zinc.value / other),
      );

  // <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  Nutrients({
    required this.calcium,
    required this.carbohydrate,
    required this.cholesterol,
    required this.calories,
    required this.saturatedFat,
    required this.totalFat,
    required this.transFat,
    required this.iron,
    required this.fiber,
    required this.potassium,
    required this.sodium,
    required this.protein,
    required this.sugars,
    required this.choline,
    required this.copper,
    required this.ala,
    required this.linoleicAcid,
    required this.epa,
    required this.dpa,
    required this.dha,
    required this.folate,
    required this.magnesium,
    required this.manganese,
    required this.niacin,
    required this.phosphorus,
    required this.pantothenicAcid,
    required this.riboflavin,
    required this.selenium,
    required this.thiamin,
    required this.vitaminE,
    required this.vitaminA,
    required this.vitaminB12,
    required this.vitaminB6,
    required this.vitaminC,
    required this.vitaminD,
    required this.vitaminK,
    required this.zinc,
  }) {
    // TODO: initiate late attribute `unsaturatedFat`
  }

  factory Nutrients.staticConstructor({
    required calcium,
    required carbohydrate,
    required cholesterol,
    required calories,
    required saturatedFat,
    required totalFat,
    required transFat,
    required iron,
    required fiber,
    required potassium,
    required sodium,
    required protein,
    required sugars,
    required choline,
    required copper,
    required ala,
    required linoleicAcid,
    required epa,
    required dpa,
    required dha,
    required folate,
    required magnesium,
    required manganese,
    required niacin,
    required phosphorus,
    required pantothenicAcid,
    required riboflavin,
    required selenium,
    required thiamin,
    required vitaminE,
    required vitaminA,
    required vitaminB12,
    required vitaminB6,
    required vitaminC,
    required vitaminD,
    required vitaminK,
    required zinc,
  }) =>
      Nutrients(
          calcium: calcium,
          carbohydrate: carbohydrate,
          cholesterol: cholesterol,
          calories: calories,
          saturatedFat: saturatedFat,
          totalFat: totalFat,
          transFat: transFat,
          iron: iron,
          fiber: fiber,
          potassium: potassium,
          sodium: sodium,
          protein: protein,
          sugars: sugars,
          choline: choline,
          copper: copper,
          ala: ala,
          linoleicAcid: linoleicAcid,
          epa: epa,
          dpa: dpa,
          dha: dha,
          folate: folate,
          magnesium: magnesium,
          manganese: manganese,
          niacin: niacin,
          phosphorus: phosphorus,
          pantothenicAcid: pantothenicAcid,
          riboflavin: riboflavin,
          selenium: selenium,
          thiamin: thiamin,
          vitaminE: vitaminE,
          vitaminA: vitaminA,
          vitaminB12: vitaminB12,
          vitaminB6: vitaminB6,
          vitaminC: vitaminC,
          vitaminD: vitaminD,
          vitaminK: vitaminK,
          zinc: zinc);

  Map<String, dynamic> get attributes__ => {
        "calcium": calcium,
        "carbohydrate": carbohydrate,
        "cholesterol": cholesterol,
        "calories": calories,
        "saturatedFat": saturatedFat,
        "totalFat": totalFat,
        "transFat": transFat,
        "iron": iron,
        "fiber": fiber,
        "potassium": potassium,
        "sodium": sodium,
        "protein": protein,
        "sugars": sugars,
        "choline": choline,
        "copper": copper,
        "ala": ala,
        "linoleicAcid": linoleicAcid,
        "epa": epa,
        "dpa": dpa,
        "dha": dha,
        "folate": folate,
        "magnesium": magnesium,
        "manganese": manganese,
        "niacin": niacin,
        "phosphorus": phosphorus,
        "pantothenicAcid": pantothenicAcid,
        "riboflavin": riboflavin,
        "selenium": selenium,
        "thiamin": thiamin,
        "vitaminE": vitaminE,
        "vitaminA": vitaminA,
        "vitaminB12": vitaminB12,
        "vitaminB6": vitaminB6,
        "vitaminC": vitaminC,
        "vitaminD": vitaminD,
        "vitaminK": vitaminK,
        "zinc": zinc,
        "unsaturatedFat": unsaturatedFat
      };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Nutrients &&
          runtimeType == other.runtimeType &&
          equals(calcium, other.calcium) &&
          equals(carbohydrate, other.carbohydrate) &&
          equals(cholesterol, other.cholesterol) &&
          equals(calories, other.calories) &&
          equals(saturatedFat, other.saturatedFat) &&
          equals(totalFat, other.totalFat) &&
          equals(transFat, other.transFat) &&
          equals(iron, other.iron) &&
          equals(fiber, other.fiber) &&
          equals(potassium, other.potassium) &&
          equals(sodium, other.sodium) &&
          equals(protein, other.protein) &&
          equals(sugars, other.sugars) &&
          equals(choline, other.choline) &&
          equals(copper, other.copper) &&
          equals(ala, other.ala) &&
          equals(linoleicAcid, other.linoleicAcid) &&
          equals(epa, other.epa) &&
          equals(dpa, other.dpa) &&
          equals(dha, other.dha) &&
          equals(folate, other.folate) &&
          equals(magnesium, other.magnesium) &&
          equals(manganese, other.manganese) &&
          equals(niacin, other.niacin) &&
          equals(phosphorus, other.phosphorus) &&
          equals(pantothenicAcid, other.pantothenicAcid) &&
          equals(riboflavin, other.riboflavin) &&
          equals(selenium, other.selenium) &&
          equals(thiamin, other.thiamin) &&
          equals(vitaminE, other.vitaminE) &&
          equals(vitaminA, other.vitaminA) &&
          equals(vitaminB12, other.vitaminB12) &&
          equals(vitaminB6, other.vitaminB6) &&
          equals(vitaminC, other.vitaminC) &&
          equals(vitaminD, other.vitaminD) &&
          equals(vitaminK, other.vitaminK) &&
          equals(zinc, other.zinc) &&
          equals(unsaturatedFat, other.unsaturatedFat));

  @override
  int get hashCode =>
      calcium.hashCode ^
      carbohydrate.hashCode ^
      cholesterol.hashCode ^
      calories.hashCode ^
      saturatedFat.hashCode ^
      totalFat.hashCode ^
      transFat.hashCode ^
      iron.hashCode ^
      fiber.hashCode ^
      potassium.hashCode ^
      sodium.hashCode ^
      protein.hashCode ^
      sugars.hashCode ^
      choline.hashCode ^
      copper.hashCode ^
      ala.hashCode ^
      linoleicAcid.hashCode ^
      epa.hashCode ^
      dpa.hashCode ^
      dha.hashCode ^
      folate.hashCode ^
      magnesium.hashCode ^
      manganese.hashCode ^
      niacin.hashCode ^
      phosphorus.hashCode ^
      pantothenicAcid.hashCode ^
      riboflavin.hashCode ^
      selenium.hashCode ^
      thiamin.hashCode ^
      vitaminE.hashCode ^
      vitaminA.hashCode ^
      vitaminB12.hashCode ^
      vitaminB6.hashCode ^
      vitaminC.hashCode ^
      vitaminD.hashCode ^
      vitaminK.hashCode ^
      zinc.hashCode ^
      unsaturatedFat.hashCode;

  @override
  String toString() =>
      'Nutrients(calcium: $calcium, carbohydrate: $carbohydrate, cholesterol: $cholesterol, calories: $calories, saturatedFat: $saturatedFat, totalFat: $totalFat, transFat: $transFat, iron: $iron, fiber: $fiber, potassium: $potassium, sodium: $sodium, protein: $protein, sugars: $sugars, choline: $choline, copper: $copper, ala: $ala, linoleicAcid: $linoleicAcid, epa: $epa, dpa: $dpa, dha: $dha, folate: $folate, magnesium: $magnesium, manganese: $manganese, niacin: $niacin, phosphorus: $phosphorus, pantothenicAcid: $pantothenicAcid, riboflavin: $riboflavin, selenium: $selenium, thiamin: $thiamin, vitaminE: $vitaminE, vitaminA: $vitaminA, vitaminB12: $vitaminB12, vitaminB6: $vitaminB6, vitaminC: $vitaminC, vitaminD: $vitaminD, vitaminK: $vitaminK, zinc: $zinc, unsaturatedFat: $unsaturatedFat)';

  Nutrients copyWithNutrients(
          {Nutrient? calcium,
          Nutrient? carbohydrate,
          Nutrient? cholesterol,
          Nutrient? calories,
          Nutrient? saturatedFat,
          Nutrient? totalFat,
          Nutrient? transFat,
          Nutrient? iron,
          Nutrient? fiber,
          Nutrient? potassium,
          Nutrient? sodium,
          Nutrient? protein,
          Nutrient? sugars,
          Nutrient? choline,
          Nutrient? copper,
          Nutrient? ala,
          Nutrient? linoleicAcid,
          Nutrient? epa,
          Nutrient? dpa,
          Nutrient? dha,
          Nutrient? folate,
          Nutrient? magnesium,
          Nutrient? manganese,
          Nutrient? niacin,
          Nutrient? phosphorus,
          Nutrient? pantothenicAcid,
          Nutrient? riboflavin,
          Nutrient? selenium,
          Nutrient? thiamin,
          Nutrient? vitaminE,
          Nutrient? vitaminA,
          Nutrient? vitaminB12,
          Nutrient? vitaminB6,
          Nutrient? vitaminC,
          Nutrient? vitaminD,
          Nutrient? vitaminK,
          Nutrient? zinc}) =>
      Nutrients(
          calcium: calcium ?? this.calcium,
          carbohydrate: carbohydrate ?? this.carbohydrate,
          cholesterol: cholesterol ?? this.cholesterol,
          calories: calories ?? this.calories,
          saturatedFat: saturatedFat ?? this.saturatedFat,
          totalFat: totalFat ?? this.totalFat,
          transFat: transFat ?? this.transFat,
          iron: iron ?? this.iron,
          fiber: fiber ?? this.fiber,
          potassium: potassium ?? this.potassium,
          sodium: sodium ?? this.sodium,
          protein: protein ?? this.protein,
          sugars: sugars ?? this.sugars,
          choline: choline ?? this.choline,
          copper: copper ?? this.copper,
          ala: ala ?? this.ala,
          linoleicAcid: linoleicAcid ?? this.linoleicAcid,
          epa: epa ?? this.epa,
          dpa: dpa ?? this.dpa,
          dha: dha ?? this.dha,
          folate: folate ?? this.folate,
          magnesium: magnesium ?? this.magnesium,
          manganese: manganese ?? this.manganese,
          niacin: niacin ?? this.niacin,
          phosphorus: phosphorus ?? this.phosphorus,
          pantothenicAcid: pantothenicAcid ?? this.pantothenicAcid,
          riboflavin: riboflavin ?? this.riboflavin,
          selenium: selenium ?? this.selenium,
          thiamin: thiamin ?? this.thiamin,
          vitaminE: vitaminE ?? this.vitaminE,
          vitaminA: vitaminA ?? this.vitaminA,
          vitaminB12: vitaminB12 ?? this.vitaminB12,
          vitaminB6: vitaminB6 ?? this.vitaminB6,
          vitaminC: vitaminC ?? this.vitaminC,
          vitaminD: vitaminD ?? this.vitaminD,
          vitaminK: vitaminK ?? this.vitaminK,
          zinc: zinc ?? this.zinc);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'Nutrients', ...nestedJsonMap(attributes__)};

  factory Nutrients.fromJson(String json) =>
      Nutrients.fromMap(jsonDecode(json));

  factory Nutrients.fromMap(Map map) {
    Nutrient calcium = dejsonify(map['calcium']);
    Nutrient carbohydrate = dejsonify(map['carbohydrate']);
    Nutrient cholesterol = dejsonify(map['cholesterol']);
    Nutrient calories = dejsonify(map['calories']);
    Nutrient saturatedFat = dejsonify(map['saturatedFat']);
    Nutrient totalFat = dejsonify(map['totalFat']);
    Nutrient transFat = dejsonify(map['transFat']);
    Nutrient iron = dejsonify(map['iron']);
    Nutrient fiber = dejsonify(map['fiber']);
    Nutrient potassium = dejsonify(map['potassium']);
    Nutrient sodium = dejsonify(map['sodium']);
    Nutrient protein = dejsonify(map['protein']);
    Nutrient sugars = dejsonify(map['sugars']);
    Nutrient choline = dejsonify(map['choline']);
    Nutrient copper = dejsonify(map['copper']);
    Nutrient ala = dejsonify(map['ala']);
    Nutrient linoleicAcid = dejsonify(map['linoleicAcid']);
    Nutrient epa = dejsonify(map['epa']);
    Nutrient dpa = dejsonify(map['dpa']);
    Nutrient dha = dejsonify(map['dha']);
    Nutrient folate = dejsonify(map['folate']);
    Nutrient magnesium = dejsonify(map['magnesium']);
    Nutrient manganese = dejsonify(map['manganese']);
    Nutrient niacin = dejsonify(map['niacin']);
    Nutrient phosphorus = dejsonify(map['phosphorus']);
    Nutrient pantothenicAcid = dejsonify(map['pantothenicAcid']);
    Nutrient riboflavin = dejsonify(map['riboflavin']);
    Nutrient selenium = dejsonify(map['selenium']);
    Nutrient thiamin = dejsonify(map['thiamin']);
    Nutrient vitaminE = dejsonify(map['vitaminE']);
    Nutrient vitaminA = dejsonify(map['vitaminA']);
    Nutrient vitaminB12 = dejsonify(map['vitaminB12']);
    Nutrient vitaminB6 = dejsonify(map['vitaminB6']);
    Nutrient vitaminC = dejsonify(map['vitaminC']);
    Nutrient vitaminD = dejsonify(map['vitaminD']);
    Nutrient vitaminK = dejsonify(map['vitaminK']);
    Nutrient zinc = dejsonify(map['zinc']);

    // No casting

    return Nutrients(
        calcium: calcium,
        carbohydrate: carbohydrate,
        cholesterol: cholesterol,
        calories: calories,
        saturatedFat: saturatedFat,
        totalFat: totalFat,
        transFat: transFat,
        iron: iron,
        fiber: fiber,
        potassium: potassium,
        sodium: sodium,
        protein: protein,
        sugars: sugars,
        choline: choline,
        copper: copper,
        ala: ala,
        linoleicAcid: linoleicAcid,
        epa: epa,
        dpa: dpa,
        dha: dha,
        folate: folate,
        magnesium: magnesium,
        manganese: manganese,
        niacin: niacin,
        phosphorus: phosphorus,
        pantothenicAcid: pantothenicAcid,
        riboflavin: riboflavin,
        selenium: selenium,
        thiamin: thiamin,
        vitaminE: vitaminE,
        vitaminA: vitaminA,
        vitaminB12: vitaminB12,
        vitaminB6: vitaminB6,
        vitaminC: vitaminC,
        vitaminD: vitaminD,
        vitaminK: vitaminK,
        zinc: zinc);
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
