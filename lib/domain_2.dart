import 'package:nutrition_app/domain/dataclasses.dart';
import 'package:nutrition_app/mydataclasses/metadata.dart';
import 'dart:convert';
import 'package:dataclasses/dataclasses.dart';
import 'package:nutrition_app/domain/individual_nutrients.dart';
import 'dart:collection';
import 'package:ari_utils/ari_utils.dart';

import 'api/dri.dart';


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
  AnthroMetrics anthroMetrics;

  @Generate
}

/// Diet Branch

@Dataclass()
class Diet {
  List<Day> days;
  List<Meal> meals;
  List<Ingredient> baseIngredients;
  List<MealComponentFactory> get ingredients => [...baseIngredients, ...meals.where((element) => element.isSubRecipe)];
  AnthroMetrics anthroMetrics
  DRIS dris;

  DRIS get dayDri => throw UnimplementedError();
  Nutrients get averageNutrition {
    List<Nutrients> dayNut = days.map((e) => e.nutrients).toList();
    Nutrients sum = Nutrients.sum(dayNut);
    return sum / dayNut.length;
  }

  @Generate
}

@Dataclass()
class Day {
  List<Meal> meals;

  Nutrients get nutrients=>throw UnimplementedError();
  @Generate
}

@Dataclass(constructor: false)
class Meal extends MealComponentFactory{
  List<MealComponent> ingredients;
  int servings;
  bool isSubRecipe;


  Meal({required this.ingredients, required this.servings, required this.isSubRecipe}) :
   super(BaseNutrients(
          grams: (ingredients.map((e) => e.grams).toList().reduce((previous, current) => previous + current)) / servings,
          nutrients: Nutrients.sum(ingredients.map((e) => e.nutrients).toList())/servings),
          {'servings': (ingredients.map((e) => e.grams).toList().reduce((previous, current) => previous + current)) / servings}
      );


  @Generate
}

@Dataclass()
class MealComponent {
  MealComponentFactory reference;
  num grams;
  Nutrients get nutrients{
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
      {MealComponentFactory? reference, int? grams}) =>
      MealComponent(
          reference: reference ?? this.reference, grams: grams ?? this.grams);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'MealComponent', ...nestedJsonMap(attributes__)};

  factory MealComponent.fromJson(String json) =>
      MealComponent.fromMap(jsonDecode(json));

  factory MealComponent.fromMap(Map map) {
    MealComponentFactory reference = dejsonify(map['reference']);
    int grams = map['grams'];

    // No casting

    return MealComponent(reference: reference, grams: grams);
  }
// </Dataclass>

// </editor-fold>
}

/// Infinitive (Includes: Meal)

@Dataclass()
class Ingredient extends MealComponentFactory {
    @override
  @Super('baseNutrient')
  BaseNutrients baseNutrient;
  @override
  @Super('altMeasures2grams')
  Map<String, num> altMeasures2grams;





  @Generate()
}


/// Data carriers (Nutrients and DRIs)
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

  Nutrients operator +(Nutrients other) =>
      Nutrients(
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

  Nutrients operator -(Nutrients other) =>
      Nutrients(
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

  Nutrients operator *(num other) =>
      Nutrients(
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

  Nutrients operator /(num other) =>
      Nutrients(
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

  static Nutrients sum(List<Nutrients> listOfNutrients){
    if (listOfNutrients.isEmpty){return Nutrients.zero();}
    return listOfNutrients.reduce((previous, current) => previous + current);
  }

  // <editor-fold desc="Dataclass Section">

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
    unsaturatedFat =
        Nutrient.UnsaturatedFat(totalFat.value - saturatedFat.value);
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

  Nutrients copyWith({Nutrient? calcium,
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
  
  factory Nutrients.zero()=>
      Nutrients(
          calcium: Nutrient.Calcium(0),
          carbohydrate: Nutrient.Carbohydrate(0),
          cholesterol: Nutrient.Cholesterol(0),
          calories: Nutrient.Calories(0),
          saturatedFat: Nutrient.SaturatedFat(0),
          totalFat: Nutrient.TotalFat(0),
          transFat: Nutrient.TransFat(0),
          iron: Nutrient.Iron(0),
          fiber: Nutrient.Fiber(0),
          potassium: Nutrient.Potassium(0),
          sodium: Nutrient.Sodium(0),
          protein: Nutrient.Protein(0),
          sugars: Nutrient.Sugars(0),
          choline: Nutrient.Choline(0),
          copper: Nutrient.Copper(0),
          ala: Nutrient.ALA(0),
          linoleicAcid: Nutrient.LinoleicAcid(0),
          epa: Nutrient.EPA(0),
          dpa: Nutrient.DPA(0),
          dha: Nutrient.DHA(0),
          folate: Nutrient.Folate(0),
          magnesium: Nutrient.Magnesium(0),
          manganese: Nutrient.Manganese(0),
          niacin: Nutrient.Niacin(0),
          phosphorus: Nutrient.Phosphorus(0),
          pantothenicAcid: Nutrient.PantothenicAcid(0),
          riboflavin: Nutrient.Riboflavin(0),
          selenium: Nutrient.Selenium(0),
          thiamin: Nutrient.Thiamin(0),
          vitaminE: Nutrient.VitaminE(0),
          vitaminA: Nutrient.VitaminA(0),
          vitaminB12: Nutrient.VitaminB12(0),
          vitaminB6: Nutrient.VitaminB6(0),
          vitaminC: Nutrient.VitaminC(0),
          vitaminD: Nutrient.VitaminD(0),
          vitaminK: Nutrient.VitaminK(0),
          zinc: Nutrient.Zinc(0));

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

@Dataclass()
class DRI {
  String name;
  num? dri;
  num? upperLimit;
  String? unit;

  bool compare(val) {
    throw UnimplementedError();
    // TODO IMPLEMENT COMPARISON TO NUM OR NUTRIENT
  }

  DRI operator *(num num) =>
      copyWith(dri: dri == null ? null : dri! * num,
          upperLimit: upperLimit == null ? null : upperLimit! * num);

  DRI operator /(num num) =>
      copyWith(dri: dri == null ? null : dri! / num,
          upperLimit: upperLimit == null ? null : upperLimit! / num);

  // <editor-fold desc="Dataclass Objects">
  DRI(this.name, {this.dri, this.upperLimit, this.unit}) {
    if (dri == 0) {
      dri = null;
    }
    if (upperLimit == 0) {
      upperLimit = null;
    }
    substitutions();
  }

  @override
  String toString() {
    if (upperLimit != null) {
      return '$name: $dri - $upperLimit $unit';
    } else {
      return '$name: $dri $unit';
    }
  }

  void substitutions() {
    if (name == 'Estimated Daily Caloric Needs') {
      name = 'Calories';
    }
    if (name == 'Sodium') {
      upperLimit = 3000;
    }
    if (name == 'Magnesium') {
      upperLimit = null;
    }
  }

  factory DRI.driMacro(List<String> instantiationString,
      [AnthroMetrics? anthro]) {
    RegExpMatch? search = macroSearch.firstMatch(instantiationString[1]);
    String name = instantiationString[0];
    num? dri;
    num? ul;
    String? unit;

    if (search != null) {
      List<String?> values = RegExp(r'[0-9,.]+')
          .allMatches(search.group(0)!)
          .map((e) => e.group(0))
          .toList();
      dri = toNum(values[0]);
      ul = toNum(values[1]);
      unit = RegExp(r'[A-Za-z]+').firstMatch(search.group(0)!)?.group(0);
    } else {
      RegExpMatch? search = valueUnitSearch.firstMatch(instantiationString[1]);
      dri = search != null ? toNum(
          RegExp(r'[0-9,.]+').firstMatch(search.group(0)!)?.group(0)) : null;
      unit =
      search != null ? RegExp(r'[A-Za-z]+').firstMatch(search.group(0)!)?.group(
          0) : null;
    }
    if (name == 'Protein' && anthro != null) {
      ul = (anthro.weight * 0.8).round();
    }
    return DRI(name, dri: dri, upperLimit: ul, unit: unit);
  }

  factory DRI.driMicro(List<String> instantiationString) {
    RegExpMatch? driLine = valueUnitSearch.firstMatch(instantiationString[1]);
    RegExpMatch? ulLine = valueUnitSearch.firstMatch(instantiationString[2]);
    String? dri = driLine?.group(1);
    String? unit = driLine?.group(2);
    String? ul = ulLine?.group(1);
    return DRI(instantiationString[0], dri: toNum(dri),
        upperLimit: toNum(ul),
        unit: unit);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is DRI &&
              runtimeType == other.runtimeType &&
              name == other.name &&
              dri == other.dri &&
              upperLimit == other.upperLimit &&
              unit == other.unit;

  @override
  int get hashCode =>
      name.hashCode ^ dri.hashCode ^ upperLimit.hashCode ^ unit.hashCode;

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'dri': dri,
      'upperLimit': upperLimit,
      'unit': unit,
    };
  }

  factory DRI.fromMap(Map<String, dynamic> map) {
    return DRI(
      map['name'] as String,
      dri: map['dri'] as num,
      upperLimit: map['upperLimit'] as num,
      unit: map['unit'] as String,
    );
  }

  DRI copyWith({dri, upperLimit}) =>
      DRI(name, dri: dri ?? this.dri,
          upperLimit: upperLimit ?? this.upperLimit, unit: unit);
//</editor-fold>

}

@Dataclass()
class DRIS {
  DRI calcium;
  DRI carbohydrate;
  DRI cholesterol;
  DRI calories;
  late DRI saturatedFat;
  DRI totalFat;
  // DRI transFat = DRI('TransFat', unit: 'g', upperLimit: );
  DRI iron;
  DRI fiber;
  DRI potassium;
  DRI sodium;
  DRI protein;
  DRI sugars;
  DRI choline;
  DRI copper;
  DRI ala;
  DRI linoleicAcid;
  DRI epa;
  DRI dpa;
  DRI dha;
  DRI folate;
  DRI magnesium;
  DRI manganese;
  DRI niacin;
  DRI phosphorus;
  DRI pantothenicAcid;
  DRI riboflavin;
  DRI selenium;
  DRI thiamin;
  DRI vitaminE;
  DRI vitaminA;
  DRI vitaminB12;
  DRI vitaminB6;
  DRI vitaminC;
  DRI vitaminD;
  DRI vitaminK;
  DRI zinc;
  late DRI unsaturatedFat;


  // TODO CREATE MACRO SETTERS
  // TODO Comparer to nutrients

  DRIS operator *(num num) {
    return
      DRIS(
        calcium: calcium * num,
        carbohydrate: carbohydrate * num,
        cholesterol: cholesterol * num,
        calories: calories * num,
        saturatedFat: saturatedFat * num,
        totalFat: totalFat * num,
        // transFat: transFat * num,
        iron: iron * num,
        fiber: fiber * num,
        potassium: potassium * num,
        sodium: sodium * num,
        protein: protein * num,
        sugars: sugars * num,
        choline: choline * num,
        copper: copper * num,
        ala: ala * num,
        linoleicAcid: linoleicAcid * num,
        epa: epa * num,
        dpa: dpa * num,
        dha: dha * num,
        folate: folate * num,
        magnesium: magnesium * num,
        manganese: manganese * num,
        niacin: niacin * num,
        phosphorus: phosphorus * num,
        pantothenicAcid: pantothenicAcid * num,
        riboflavin: riboflavin * num,
        selenium: selenium * num,
        thiamin: thiamin * num,
        vitaminE: vitaminE * num,
        vitaminA: vitaminA * num,
        vitaminB12: vitaminB12 * num,
        vitaminB6: vitaminB6 * num,
        vitaminC: vitaminC * num,
        vitaminD: vitaminD * num,
        vitaminK: vitaminK * num,
        zinc: zinc * num,);
  }
  DRIS operator /(num num) {
    return
      DRIS(
        calcium: calcium / num,
        carbohydrate: carbohydrate / num,
        cholesterol: cholesterol / num,
        calories: calories / num,
        saturatedFat: saturatedFat / num,
        totalFat: totalFat / num,
        // transFat: transFat / num,
        iron: iron / num,
        fiber: fiber / num,
        potassium: potassium / num,
        sodium: sodium / num,
        protein: protein / num,
        sugars: sugars / num,
        choline: choline / num,
        copper: copper / num,
        ala: ala / num,
        linoleicAcid: linoleicAcid / num,
        epa: epa / num,
        dpa: dpa / num,
        dha: dha / num,
        folate: folate / num,
        magnesium: magnesium / num,
        manganese: manganese / num,
        niacin: niacin / num,
        phosphorus: phosphorus / num,
        pantothenicAcid: pantothenicAcid / num,
        riboflavin: riboflavin / num,
        selenium: selenium / num,
        thiamin: thiamin / num,
        vitaminE: vitaminE / num,
        vitaminA: vitaminA / num,
        vitaminB12: vitaminB12 / num,
        vitaminB6: vitaminB6 / num,
        vitaminC: vitaminC / num,
        vitaminD: vitaminD / num,
        vitaminK: vitaminK / num,
        zinc: zinc / num,);
  }


  @Generate()
}

@Dataclass(constructor: false)
class AnthroMetrics {
  Sex sex;
  int age;
  int weight;
  int feet;
  int inches;
  Activity activity;

  AnthroMetrics({required this.sex,
    required this.age,
    required this.weight,
    required this.feet,
    required this.inches,
    required this.activity});

  @Generate()

  factory AnthroMetrics.fromMetric(Sex sex, int age, int weight, int height,
      Activity activity) {
    weight = (weight * 2.20462).round();
    height = (height * 0.393701).round();
    int feet = height ~/ 12;
    int inches = height % 12;
    return AnthroMetrics(
        sex: sex,
        age: age,
        weight: weight,
        feet: feet,
        inches: inches,
        activity: activity);
  }

  Map<String, String> toDictForPost() {
    String sexStr = sex == Sex.M ? 'male' : 'female';
    Map<String, String> result = {
      'age_value': age.toString(),
      'sex': sexStr,
      'feet': feet.toString(),
      'inches': inches.toString(),
      'activity_level': activity.name.toString().replaceAll('_', ' '),
      'pounds': weight.toString()
    };
    if (sex == Sex.F) {
      result['pregnancy-lactating'] = 'none';
    }
    return result;
  }

}

class BaseNutrients{
  num grams;
  Nutrients nutrients;

  BaseNutrients({
    required this.grams,
    required this.nutrients,
  });

}

/// Interfaces
abstract class MealComponentFactory {
  BaseNutrients baseNutrient;
  Map<String, num> altMeasures2grams;

  MealComponentFactory(this.baseNutrient, this.altMeasures2grams){
    altMeasures2grams['grams'] = 1;
  }
  MealComponent toMealComponent(String measure, num quantity, MealComponentFactory reference){
    num grams = quantity * altMeasures2grams[measure]!;
    return MealComponent(grams: grams, reference: reference);
  }

}

@Dataclass()
class UIComponents{
  String name;
  Uri Photo;

  // TODO Attribute this and attribute other classes with this

}


// Everything has a nutrients
// TODO Attribute classes!

