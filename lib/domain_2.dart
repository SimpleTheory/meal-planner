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


  Nutrients operator +(Nutrients other) =>
      Nutrients(
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

  Nutrients operator -(Nutrients other) =>
      Nutrients(
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

  Nutrients operator *(num other) =>
      Nutrients(
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

  Nutrients operator /(num other) =>
      Nutrients(
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


  Nutrients(
      {required this.calcium, required this.carbohydrate, required this.cholesterol, required this.calories, required this.saturatedFat, required this.totalFat, required this.transFat, required this.iron, required this.fiber, required this.potassium, required this.sodium, required this.protein, required this.sugars, required this.choline, required this.copper, required this.ala, required this.linoleicAcid, required this.epa, required this.dpa, required this.dha, required this.folate, required this.magnesium, required this.manganese, required this.niacin, required this.phosphorus, required this.pantothenicAcid, required this.riboflavin, required this.selenium, required this.thiamin, required this.vitaminE, required this.vitaminA, required this.vitaminB12, required this.vitaminB6, required this.vitaminC, required this.vitaminD, required this.vitaminK, required this.zinc,}) {
    unsaturatedFat = UnsaturatedFat(totalFat.value - saturatedFat.value);
  }

  factory Nutrients.staticConstructor(
      {required calcium, required carbohydrate, required cholesterol, required calories, required saturatedFat, required totalFat, required transFat, required iron, required fiber, required potassium, required sodium, required protein, required sugars, required choline, required copper, required ala, required linoleicAcid, required ePA, required dPA, required dHA, required folate, required magnesium, required manganese, required niacin, required phosphorus, required pantothenicAcid, required riboflavin, required selenium, required thiamin, required vitaminE, required vitaminA, required vitaminB12, required vitaminB6, required vitaminC, required vitaminD, required vitaminK, required zinc,}) =>
      Nutrients(calcium: calcium,
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
          (other is Nutrients && runtimeType == other.runtimeType &&
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
      'Nutrients(calcium: $calcium, carbohydrate: $carbohydrate, cholesterol: $cholesterol, calories: $calories, saturatedFat: $saturatedFat, totalFat: $totalFat, transFat: $transFat, iron: $iron, fiber: $fiber, potassium: $potassium, sodium: $sodium, protein: $protein, sugars: $sugars, choline: $choline, copper: $copper, ala: $ala, linoleicAcid: $linoleicAcid, ePA: $epa, dPA: $dpa, dHA: $dha, folate: $folate, magnesium: $magnesium, manganese: $manganese, niacin: $niacin, phosphorus: $phosphorus, pantothenicAcid: $pantothenicAcid, riboflavin: $riboflavin, selenium: $selenium, thiamin: $thiamin, vitaminE: $vitaminE, vitaminA: $vitaminA, vitaminB12: $vitaminB12, vitaminB6: $vitaminB6, vitaminC: $vitaminC, vitaminD: $vitaminD, vitaminK: $vitaminK, zinc: $zinc, unsaturatedFat: $unsaturatedFat)';

  Nutrients copyWith(
      {Calcium? calcium, Carbohydrate? carbohydrate, Cholesterol? cholesterol, Calories? calories, SaturatedFat? saturatedFat, TotalFat? totalFat, TransFat? transFat, Iron? iron, Fiber? fiber, Potassium? potassium, Sodium? sodium, Protein? protein, Sugars? sugars, Choline? choline, Copper? copper, ALA? ala, LinoleicAcid? linoleicAcid, EPA? epa, DPA? dpa, DHA? dha, Folate? folate, Magnesium? magnesium, Manganese? manganese, Niacin? niacin, Phosphorus? phosphorus, PantothenicAcid? pantothenicAcid, Riboflavin? riboflavin, Selenium? selenium, Thiamin? thiamin, VitaminE? vitaminE, VitaminA? vitaminA, VitaminB12? vitaminB12, VitaminB6? vitaminB6, VitaminC? vitaminC, VitaminD? vitaminD, VitaminK? vitaminK, Zinc? zinc}) =>
      Nutrients(calcium: calcium ?? this.calcium,
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

  factory Nutrients.fromMap(Map map){
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

    return Nutrients(calcium: calcium,
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

/// Data carriers (Kind of Nutrients also^)

/// Other
// @Dataclass()
// class DRI {
//
//  @Gen
// }

// Everything has a nutrients
// TODO Attribute classes!
