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


  Diet({required this.name, required this.dri,});

  factory Diet.staticConstructor({required name, required dri,}) =>
      Diet(name: name, dri: dri);

  Map<String, dynamic> get attributes__ => {"name": name, "dri": dri};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          (other is Diet && runtimeType == other.runtimeType &&
              equals(name, other.name) && equals(dri, other.dri));

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

  factory Diet.fromMap(Map map){
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


  DRI({required this.nutrients,});

  factory DRI.staticConstructor({required nutrients,}) =>
      DRI(nutrients: nutrients);

  Map<String, dynamic> get attributes__ => {"nutrients": nutrients};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          (other is DRI && runtimeType == other.runtimeType &&
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

  factory DRI.fromMap(Map map){
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


  Day({required this.meals, required this.dayNumber,});

  factory Day.staticConstructor({required meals, required dayNumber,}) =>
      Day(meals: meals, dayNumber: dayNumber);

  Map<String, dynamic> get attributes__ =>
      {"meals": meals, "dayNumber": dayNumber};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          (other is Day && runtimeType == other.runtimeType &&
              equals(meals, other.meals) && equals(dayNumber, other.dayNumber));

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

  factory Day.fromMap(Map map){
    List mealsTemp = dejsonify(map['meals']);
    int dayNumber = map['dayNumber'];

    List<Meal> meals =
    List<Meal>.from(mealsTemp);

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
      {required this.ingredients, required this.name, this.servingSize = 1, this.image}) {
    // TODO: initiate late attribute `grams`
  }

  factory Meal.staticConstructor(
      {required ingredients, required name, servingSize = 1, image}) =>
      Meal(ingredients: ingredients,
          name: name,
          servingSize: servingSize,
          image: image);

  Map<String, dynamic> get attributes__ =>
      {
        "ingredients": ingredients,
        "servingSize": servingSize,
        "name": name,
        "image": image,
        "grams": grams
      };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          (other is Meal && runtimeType == other.runtimeType &&
              equals(ingredients, other.ingredients) &&
              equals(servingSize, other.servingSize) &&
              equals(name, other.name) && equals(image, other.image) &&
              equals(grams, other.grams));

  @override
  int get hashCode =>
      ingredients.hashCode ^ servingSize.hashCode ^ name.hashCode ^ image
          .hashCode ^ grams.hashCode;

  @override
  String toString() =>
      'Meal(ingredients: $ingredients, servingSize: $servingSize, name: $name, image: $image, grams: $grams)';

  Meal copyWithMeal({List<
      MealComponent>? ingredients, int? servingSize, String? name, dynamic? image}) =>
      Meal(ingredients: ingredients ?? this.ingredients,
          servingSize: servingSize ?? this.servingSize,
          name: name ?? this.name,
          image: image ?? this.image);

  String toJson() => jsonEncode(toMap());

  Map<String, dynamic> toMap() =>
      {'__type': 'Meal', ...nestedJsonMap(attributes__)};

  factory Meal.fromJson(String json) => Meal.fromMap(jsonDecode(json));

  factory Meal.fromMap(Map map){
    List ingredientsTemp = dejsonify(map['ingredients']);
    int servingSize = map['servingSize'];
    String name = map['name'];
    dynamic? image = map['image'] == null ? null : dejsonify(map['image']);

    List<MealComponent> ingredients =
    List<MealComponent>.from(ingredientsTemp);

    return Meal(ingredients: ingredients,
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
      {required this.name, required this.source, required this.altMeasures, this.image, this.sourceMetadata});

  factory BaseIngredient.staticConstructor(
      {required name, required source, required altMeasures, image, sourceMetadata}) =>
      BaseIngredient(name: name,
          source: source,
          altMeasures: altMeasures,
          image: image,
          sourceMetadata: sourceMetadata);

  Map<String, dynamic> get attributes__ =>
      {
        "image": image,
        "name": name,
        "source": source,
        "sourceMetadata": sourceMetadata,
        "altMeasures": altMeasures
      };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          (other is BaseIngredient && runtimeType == other.runtimeType &&
              equals(image, other.image) && equals(name, other.name) &&
              equals(source, other.source) &&
              equals(sourceMetadata, other.sourceMetadata) &&
              equals(altMeasures, other.altMeasures));

  @override
  int get hashCode =>
      image.hashCode ^ name.hashCode ^ source.hashCode ^ sourceMetadata
          .hashCode ^ altMeasures.hashCode;

  @override
  String toString() =>
      'BaseIngredient(image: $image, name: $name, source: $source, sourceMetadata: $sourceMetadata, altMeasures: $altMeasures)';

  BaseIngredient copyWithBaseIngredient(
      {dynamic? image, String? name, Source? source, dynamic? sourceMetadata, List<
          AltMeasure>? altMeasures}) =>
      BaseIngredient(image: image ?? this.image,
          name: name ?? this.name,
          source: source ?? this.source,
          sourceMetadata: sourceMetadata ?? this.sourceMetadata,
          altMeasures: altMeasures ?? this.altMeasures);

  String toJson() => jsonEncode(toMap());

  Map<String, dynamic> toMap() =>
      {'__type': 'BaseIngredient', ...nestedJsonMap(attributes__)};

  factory BaseIngredient.fromJson(String json) =>
      BaseIngredient.fromMap(jsonDecode(json));

  factory BaseIngredient.fromMap(Map map){
    dynamic? image = map['image'] == null ? null : dejsonify(map['image']);
    String name = map['name'];
    Source source = dejsonify(map['source']);
    dynamic? sourceMetadata = map['sourceMetadata'] == null ? null : dejsonify(
        map['sourceMetadata']);
    List altMeasuresTemp = dejsonify(map['altMeasures']);

    List<AltMeasure> altMeasures =
    List<AltMeasure>.from(altMeasuresTemp);

    return BaseIngredient(image: image,
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

  Ingredient({required this.grams,
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


  Ingredient();

  factory Ingredient.staticConstructor()=> Ingredient();

  Map<String, dynamic> get attributes__ => {};

  @override
  String toString() => 'Ingredient()';

  Ingredient copyWithIngredient() => Ingredient();

  String toJson() => jsonEncode(toMap());

  Map<String, dynamic> toMap() =>
      {'__type': 'Ingredient', ...nestedJsonMap(attributes__)};

  factory Ingredient.fromJson(String json) =>
      Ingredient.fromMap(jsonDecode(json));

  factory Ingredient.fromMap(Map map){
    // No casting

    return Ingredient();
  }
// </Dataclass>

// </editor-fold>
}

@Dataclass()
class Ingredient {
  MealComponent toMealComponent() {}

  @Generate
}

@Dataclass()
class Nutrients2 {
  // List off nutrients here
  final Calcium calcium;
  final Carbohydrate carbohydrate;
  final Cholesterol cholesterol;
  final Calories calories;
  final SaturatedFat saturatedFat;
  final TotalFat totalFat;
  final TransFat transFat;
  final Iron iron;
  final Fiber fiber;
  final Potassium potassium;
  final Sodium sodium;
  final Protein protein;
  final Sugars sugars;
  final Choline choline;
  final Copper copper;
  final ALA ala;
  final LinoleicAcid linoleicAcid;
  final EPA epa;
  final DPA dpa;
  final DHA dha;
  final Folate folate;
  final Magnesium magnesium;
  final Manganese manganese;
  final Niacin niacin;
  final Phosphorus phosphorus;
  final PantothenicAcid pantothenicAcid;
  final Riboflavin riboflavin;
  final Selenium selenium;
  final Thiamin thiamin;
  final VitaminE vitaminE;
  final VitaminA vitaminA;
  final VitaminB12 vitaminB12;
  final VitaminB6 vitaminB6;
  final VitaminC vitaminC;
  final VitaminD vitaminD;
  final VitaminK vitaminK;
  final Zinc zinc;
  late final UnsaturatedFat unsaturatedFat;


  Nutrients2 operator +(Nutrients2 other) =>
    Nutrients2(
       calcium: Calcium(calcium.value + other.calcium.value),
       carbohydrate: Carbohydrate(carbohydrate.value + other.carbohydrate.value),
       cholesterol: Cholesterol(cholesterol.value + other.cholesterol.value),
       calories: Calories(calories.value + other.calories.value),
       saturatedFat: SaturatedFat(saturatedFat.value + other.saturatedFat.value),
       totalFat: TotalFat(totalFat.value + other.totalFat.value),
       transFat: TransFat(transFat.value + other.transFat.value),
       iron: Iron(iron.value + other.iron.value),
       fiber: Fiber(fiber.value + other.fiber.value),
       potassium: Potassium(potassium.value + other.potassium.value),
       sodium: Sodium(sodium.value + other.sodium.value),
       protein: Protein(protein.value + other.protein.value),
       sugars: Sugars(sugars.value + other.sugars.value),
       choline: Choline(choline.value + other.choline.value),
       copper: Copper(copper.value + other.copper.value),
       ala: ALA(ala.value + other.ala.value),
       linoleicAcid: LinoleicAcid(linoleicAcid.value + other.linoleicAcid.value),
       epa: EPA(epa.value + other.epa.value),
       dpa: DPA(dpa.value + other.dpa.value),
       dha: DHA(dha.value + other.dha.value),
       folate: Folate(folate.value + other.folate.value),
       magnesium: Magnesium(magnesium.value + other.magnesium.value),
       manganese: Manganese(manganese.value + other.manganese.value),
       niacin: Niacin(niacin.value + other.niacin.value),
       phosphorus: Phosphorus(phosphorus.value + other.phosphorus.value),
       pantothenicAcid: PantothenicAcid(pantothenicAcid.value + other.pantothenicAcid.value),
       riboflavin: Riboflavin(riboflavin.value + other.riboflavin.value),
       selenium: Selenium(selenium.value + other.selenium.value),
       thiamin: Thiamin(thiamin.value + other.thiamin.value),
       vitaminE: VitaminE(vitaminE.value + other.vitaminE.value),
       vitaminA: VitaminA(vitaminA.value + other.vitaminA.value),
       vitaminB12: VitaminB12(vitaminB12.value + other.vitaminB12.value),
       vitaminB6: VitaminB6(vitaminB6.value + other.vitaminB6.value),
       vitaminC: VitaminC(vitaminC.value + other.vitaminC.value),
       vitaminD: VitaminD(vitaminD.value + other.vitaminD.value),
       vitaminK: VitaminK(vitaminK.value + other.vitaminK.value),
       zinc: Zinc(zinc.value + other.zinc.value),
  );

  Nutrients2 operator -(Nutrients2 other) =>
    Nutrients2(
      calcium: Calcium(calcium.value - other.calcium.value),
      carbohydrate: Carbohydrate(carbohydrate.value - other.carbohydrate.value),
      cholesterol: Cholesterol(cholesterol.value - other.cholesterol.value),
      calories: Calories(calories.value - other.calories.value),
      saturatedFat: SaturatedFat(saturatedFat.value - other.saturatedFat.value),
      totalFat: TotalFat(totalFat.value - other.totalFat.value),
      transFat: TransFat(transFat.value - other.transFat.value),
      iron: Iron(iron.value - other.iron.value),
      fiber: Fiber(fiber.value - other.fiber.value),
      potassium: Potassium(potassium.value - other.potassium.value),
      sodium: Sodium(sodium.value - other.sodium.value),
      protein: Protein(protein.value - other.protein.value),
      sugars: Sugars(sugars.value - other.sugars.value),
      choline: Choline(choline.value - other.choline.value),
      copper: Copper(copper.value - other.copper.value),
      ala: ALA(ala.value - other.ala.value),
      linoleicAcid: LinoleicAcid(linoleicAcid.value - other.linoleicAcid.value),
      epa: EPA(epa.value - other.epa.value),
      dpa: DPA(dpa.value - other.dpa.value),
      dha: DHA(dha.value - other.dha.value),
      folate: Folate(folate.value - other.folate.value),
      magnesium: Magnesium(magnesium.value - other.magnesium.value),
      manganese: Manganese(manganese.value - other.manganese.value),
      niacin: Niacin(niacin.value - other.niacin.value),
      phosphorus: Phosphorus(phosphorus.value - other.phosphorus.value),
      pantothenicAcid: PantothenicAcid(pantothenicAcid.value - other.pantothenicAcid.value),
      riboflavin: Riboflavin(riboflavin.value - other.riboflavin.value),
      selenium: Selenium(selenium.value - other.selenium.value),
      thiamin: Thiamin(thiamin.value - other.thiamin.value),
      vitaminE: VitaminE(vitaminE.value - other.vitaminE.value),
      vitaminA: VitaminA(vitaminA.value - other.vitaminA.value),
      vitaminB12: VitaminB12(vitaminB12.value - other.vitaminB12.value),
      vitaminB6: VitaminB6(vitaminB6.value - other.vitaminB6.value),
      vitaminC: VitaminC(vitaminC.value - other.vitaminC.value),
      vitaminD: VitaminD(vitaminD.value - other.vitaminD.value),
      vitaminK: VitaminK(vitaminK.value - other.vitaminK.value),
      zinc: Zinc(zinc.value - other.zinc.value),
    );

  Nutrients2 operator *(num other) =>
    Nutrients2(
      calcium: Calcium(calcium.value * other),
      carbohydrate: Carbohydrate(carbohydrate.value * other),
      cholesterol: Cholesterol(cholesterol.value * other),
      calories: Calories(calories.value * other),
      saturatedFat: SaturatedFat(saturatedFat.value * other),
      totalFat: TotalFat(totalFat.value * other),
      transFat: TransFat(transFat.value * other),
      iron: Iron(iron.value * other),
      fiber: Fiber(fiber.value * other),
      potassium: Potassium(potassium.value * other),
      sodium: Sodium(sodium.value * other),
      protein: Protein(protein.value * other),
      sugars: Sugars(sugars.value * other),
      choline: Choline(choline.value * other),
      copper: Copper(copper.value * other),
      ala: ALA(ala.value * other),
      linoleicAcid: LinoleicAcid(linoleicAcid.value * other),
      epa: EPA(epa.value * other),
      dpa: DPA(dpa.value * other),
      dha: DHA(dha.value * other),
      folate: Folate(folate.value * other),
      magnesium: Magnesium(magnesium.value * other),
      manganese: Manganese(manganese.value * other),
      niacin: Niacin(niacin.value * other),
      phosphorus: Phosphorus(phosphorus.value * other),
      pantothenicAcid: PantothenicAcid(pantothenicAcid.value * other),
      riboflavin: Riboflavin(riboflavin.value * other),
      selenium: Selenium(selenium.value * other),
      thiamin: Thiamin(thiamin.value * other),
      vitaminE: VitaminE(vitaminE.value * other),
      vitaminA: VitaminA(vitaminA.value * other),
      vitaminB12: VitaminB12(vitaminB12.value * other),
      vitaminB6: VitaminB6(vitaminB6.value * other),
      vitaminC: VitaminC(vitaminC.value * other),
      vitaminD: VitaminD(vitaminD.value * other),
      vitaminK: VitaminK(vitaminK.value * other),
      zinc: Zinc(zinc.value * other),
    );

  Nutrients2 operator /(num other) => 
    Nutrients2(
        calcium: Calcium(calcium.value / other),
        carbohydrate: Carbohydrate(carbohydrate.value / other),
        cholesterol: Cholesterol(cholesterol.value / other),
        calories: Calories(calories.value / other),
        saturatedFat: SaturatedFat(saturatedFat.value / other),
        totalFat: TotalFat(totalFat.value / other),
        transFat: TransFat(transFat.value / other),
        iron: Iron(iron.value / other),
        fiber: Fiber(fiber.value / other),
        potassium: Potassium(potassium.value / other),
        sodium: Sodium(sodium.value / other),
        protein: Protein(protein.value / other),
        sugars: Sugars(sugars.value / other),
        choline: Choline(choline.value / other),
        copper: Copper(copper.value / other),
        ala: ALA(ala.value / other),
        linoleicAcid: LinoleicAcid(linoleicAcid.value / other),
        epa: EPA(epa.value / other),
        dpa: DPA(dpa.value / other),
        dha: DHA(dha.value / other),
        folate: Folate(folate.value / other),
        magnesium: Magnesium(magnesium.value / other),
        manganese: Manganese(manganese.value / other),
        niacin: Niacin(niacin.value / other),
        phosphorus: Phosphorus(phosphorus.value / other),
        pantothenicAcid: PantothenicAcid(pantothenicAcid.value / other),
        riboflavin: Riboflavin(riboflavin.value / other),
        selenium: Selenium(selenium.value / other),
        thiamin: Thiamin(thiamin.value / other),
        vitaminE: VitaminE(vitaminE.value / other),
        vitaminA: VitaminA(vitaminA.value / other),
        vitaminB12: VitaminB12(vitaminB12.value / other),
        vitaminB6: VitaminB6(vitaminB6.value / other),
        vitaminC: VitaminC(vitaminC.value / other),
        vitaminD: VitaminD(vitaminD.value / other),
        vitaminK: VitaminK(vitaminK.value / other),
        zinc: Zinc(zinc.value / other),
      );

  // <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>


  Nutrients2(
      {required this.calcium, required this.carbohydrate, required this.cholesterol, required this.calories, required this.saturatedFat, required this.totalFat, required this.transFat, required this.iron, required this.fiber, required this.potassium, required this.sodium, required this.protein, required this.sugars, required this.choline, required this.copper, required this.ala, required this.linoleicAcid, required this.epa, required this.dpa, required this.dha, required this.folate, required this.magnesium, required this.manganese, required this.niacin, required this.phosphorus, required this.pantothenicAcid, required this.riboflavin, required this.selenium, required this.thiamin, required this.vitaminE, required this.vitaminA, required this.vitaminB12, required this.vitaminB6, required this.vitaminC, required this.vitaminD, required this.vitaminK, required this.zinc,}) {
    unsaturatedFat = UnsaturatedFat(totalFat.value - saturatedFat.value);
  }

  factory Nutrients2.staticConstructor(
      {required calcium, required carbohydrate, required cholesterol, required calories, required saturatedFat, required totalFat, required transFat, required iron, required fiber, required potassium, required sodium, required protein, required sugars, required choline, required copper, required ala, required linoleicAcid, required ePA, required dPA, required dHA, required folate, required magnesium, required manganese, required niacin, required phosphorus, required pantothenicAcid, required riboflavin, required selenium, required thiamin, required vitaminE, required vitaminA, required vitaminB12, required vitaminB6, required vitaminC, required vitaminD, required vitaminK, required zinc,}) =>
      Nutrients2(calcium: calcium,
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
          epa: ePA,
          dpa: dPA,
          dha: dHA,
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

  Map<String, dynamic> get attributes__ =>
      {
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
        "ePA": epa,
        "dPA": dpa,
        "dHA": dha,
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
          (other is Nutrients2 && runtimeType == other.runtimeType &&
              equals(calcium, other.calcium) &&
              equals(carbohydrate, other.carbohydrate) &&
              equals(cholesterol, other.cholesterol) &&
              equals(calories, other.calories) &&
              equals(saturatedFat, other.saturatedFat) &&
              equals(totalFat, other.totalFat) &&
              equals(transFat, other.transFat) && equals(iron, other.iron) &&
              equals(fiber, other.fiber) &&
              equals(potassium, other.potassium) &&
              equals(sodium, other.sodium) && equals(protein, other.protein) &&
              equals(sugars, other.sugars) && equals(choline, other.choline) &&
              equals(copper, other.copper) && equals(ala, other.ala) &&
              equals(linoleicAcid, other.linoleicAcid) &&
              equals(epa, other.epa) && equals(dpa, other.dpa) &&
              equals(dha, other.dha) && equals(folate, other.folate) &&
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
              equals(vitaminK, other.vitaminK) && equals(zinc, other.zinc) &&
              equals(unsaturatedFat, other.unsaturatedFat));

  @override
  int get hashCode =>
      calcium.hashCode ^ carbohydrate.hashCode ^ cholesterol.hashCode ^ calories
          .hashCode ^ saturatedFat.hashCode ^ totalFat.hashCode ^ transFat
          .hashCode ^ iron.hashCode ^ fiber.hashCode ^ potassium
          .hashCode ^ sodium.hashCode ^ protein.hashCode ^ sugars
          .hashCode ^ choline.hashCode ^ copper.hashCode ^ ala
          .hashCode ^ linoleicAcid.hashCode ^ epa.hashCode ^ dpa.hashCode ^ dha
          .hashCode ^ folate.hashCode ^ magnesium.hashCode ^ manganese
          .hashCode ^ niacin.hashCode ^ phosphorus.hashCode ^ pantothenicAcid
          .hashCode ^ riboflavin.hashCode ^ selenium.hashCode ^ thiamin
          .hashCode ^ vitaminE.hashCode ^ vitaminA.hashCode ^ vitaminB12
          .hashCode ^ vitaminB6.hashCode ^ vitaminC.hashCode ^ vitaminD
          .hashCode ^ vitaminK.hashCode ^ zinc.hashCode ^ unsaturatedFat
          .hashCode;

  @override
  String toString() =>
      'Nutrients2(calcium: $calcium, carbohydrate: $carbohydrate, cholesterol: $cholesterol, calories: $calories, saturatedFat: $saturatedFat, totalFat: $totalFat, transFat: $transFat, iron: $iron, fiber: $fiber, potassium: $potassium, sodium: $sodium, protein: $protein, sugars: $sugars, choline: $choline, copper: $copper, ala: $ala, linoleicAcid: $linoleicAcid, ePA: $epa, dPA: $dpa, dHA: $dha, folate: $folate, magnesium: $magnesium, manganese: $manganese, niacin: $niacin, phosphorus: $phosphorus, pantothenicAcid: $pantothenicAcid, riboflavin: $riboflavin, selenium: $selenium, thiamin: $thiamin, vitaminE: $vitaminE, vitaminA: $vitaminA, vitaminB12: $vitaminB12, vitaminB6: $vitaminB6, vitaminC: $vitaminC, vitaminD: $vitaminD, vitaminK: $vitaminK, zinc: $zinc, unsaturatedFat: $unsaturatedFat)';

  Nutrients2 copyWith(
      {Calcium? calcium, Carbohydrate? carbohydrate, Cholesterol? cholesterol, Calories? calories, SaturatedFat? saturatedFat, TotalFat? totalFat, TransFat? transFat, Iron? iron, Fiber? fiber, Potassium? potassium, Sodium? sodium, Protein? protein, Sugars? sugars, Choline? choline, Copper? copper, ALA? ala, LinoleicAcid? linoleicAcid, EPA? ePA, DPA? dPA, DHA? dHA, Folate? folate, Magnesium? magnesium, Manganese? manganese, Niacin? niacin, Phosphorus? phosphorus, PantothenicAcid? pantothenicAcid, Riboflavin? riboflavin, Selenium? selenium, Thiamin? thiamin, VitaminE? vitaminE, VitaminA? vitaminA, VitaminB12? vitaminB12, VitaminB6? vitaminB6, VitaminC? vitaminC, VitaminD? vitaminD, VitaminK? vitaminK, Zinc? zinc}) =>
      Nutrients2(calcium: calcium ?? this.calcium,
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
          epa: ePA ?? this.epa,
          dpa: dPA ?? this.dpa,
          dha: dHA ?? this.dha,
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
      {'__type': 'Nutrients2', ...nestedJsonMap(attributes__)};

  factory Nutrients2.fromJson(String json) =>
      Nutrients2.fromMap(jsonDecode(json));

  factory Nutrients2.fromMap(Map map){
    Calcium calcium = dejsonify(map['calcium']);
    Carbohydrate carbohydrate = dejsonify(map['carbohydrate']);
    Cholesterol cholesterol = dejsonify(map['cholesterol']);
    Calories calories = dejsonify(map['calories']);
    SaturatedFat saturatedFat = dejsonify(map['saturatedFat']);
    TotalFat totalFat = dejsonify(map['totalFat']);
    TransFat transFat = dejsonify(map['transFat']);
    Iron iron = dejsonify(map['iron']);
    Fiber fiber = dejsonify(map['fiber']);
    Potassium potassium = dejsonify(map['potassium']);
    Sodium sodium = dejsonify(map['sodium']);
    Protein protein = dejsonify(map['protein']);
    Sugars sugars = dejsonify(map['sugars']);
    Choline choline = dejsonify(map['choline']);
    Copper copper = dejsonify(map['copper']);
    ALA ala = dejsonify(map['ala']);
    LinoleicAcid linoleicAcid = dejsonify(map['linoleicAcid']);
    EPA ePA = dejsonify(map['ePA']);
    DPA dPA = dejsonify(map['dPA']);
    DHA dHA = dejsonify(map['dHA']);
    Folate folate = dejsonify(map['folate']);
    Magnesium magnesium = dejsonify(map['magnesium']);
    Manganese manganese = dejsonify(map['manganese']);
    Niacin niacin = dejsonify(map['niacin']);
    Phosphorus phosphorus = dejsonify(map['phosphorus']);
    PantothenicAcid pantothenicAcid = dejsonify(map['pantothenicAcid']);
    Riboflavin riboflavin = dejsonify(map['riboflavin']);
    Selenium selenium = dejsonify(map['selenium']);
    Thiamin thiamin = dejsonify(map['thiamin']);
    VitaminE vitaminE = dejsonify(map['vitaminE']);
    VitaminA vitaminA = dejsonify(map['vitaminA']);
    VitaminB12 vitaminB12 = dejsonify(map['vitaminB12']);
    VitaminB6 vitaminB6 = dejsonify(map['vitaminB6']);
    VitaminC vitaminC = dejsonify(map['vitaminC']);
    VitaminD vitaminD = dejsonify(map['vitaminD']);
    VitaminK vitaminK = dejsonify(map['vitaminK']);
    Zinc zinc = dejsonify(map['zinc']);

    // No casting

    return Nutrients2(calcium: calcium,
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
        epa: ePA,
        dpa: dPA,
        dha: dHA,
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
