import 'package:nutrition_app/mydataclasses/metadata.dart';
import 'dart:convert';
import 'package:dataclasses/dataclasses.dart';

abstract class Nutrient {
  final num value;
  static late final int? apiId;
  static late final String unit;
  String get name => runtimeType.toString();

  bool checkIfSame(Nutrient other) => name == other.name;
  void error(Nutrient other) {
    throw Exception('Can\'t operate on $name with ${other.name} as they are'
        'not the same nutrient');
  }

  void errorCheck(Nutrient other) {
    if (!checkIfSame(other)) {
      error(other);
    }
  }

  Nutrient operator +(Nutrient other) {
    errorCheck(other);
    return copyWith(value + other.value);
  }

  Nutrient operator -(Nutrient other) {
    errorCheck(other);
    return copyWith(value - other.value);
  }

  Nutrient operator *(num other) {
    return copyWith(value * other);
  }

  Nutrient operator /(num other) {
    return copyWith(value / other);
  }

//<editor-fold desc="Data Methods">

  Nutrient(this.value);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Nutrient &&
          runtimeType == other.runtimeType &&
          value == other.value);

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() {
    return '$name{'
        'value: $value'
        'unit: $unit}';
  }

  Nutrient copyWith(num? value);

  Map<String, dynamic> toMap() {
    return {'value': value, '__type': name};
  }

  factory Nutrient.fromMap(Map map) {
    // TODO: implement Nutrient.fromMap
    throw UnimplementedError();
  }

//</editor-fold>
}

@Dataclass(all: false, constructor: true, copyWith: true)
class Calcium extends Nutrient {
  static const int apiId = 301;
  static const String unit = 'mg';

  // <editor-fold desc="Dataclass Section">

  // <Dataclass>

  Calcium(super.value);

  @override
  Calcium copyWith(num? value) => Calcium(value ?? this.value);
  @override
  factory Calcium.fromMap(Map map) => Calcium(map['value']);
  // </Dataclass>

  // </editor-fold>
}

@Dataclass(all: false, constructor: true, copyWith: true)
class Carbohydrate extends Nutrient {
  static const int apiId = 205;
  static const String unit = 'g';

  // <editor-fold desc="Dataclass Section">

  // <Dataclass>

  Carbohydrate(super.value);

  @override
  Carbohydrate copyWith(num? value) => Carbohydrate(value ?? this.value);
  @override
  factory Carbohydrate.fromMap(Map map) => Carbohydrate(map['value']);
  // </Dataclass>

  // </editor-fold>
}

@Dataclass(all: false, constructor: true, copyWith: true)
class Cholesterol extends Nutrient {
  static const int apiId = 601;
  static const String unit = 'mg';

  // <editor-fold desc="Dataclass Section">

  // <Dataclass>

  @override
  Cholesterol(super.value);

  Cholesterol copyWith(num? value) => Cholesterol(value ?? this.value);
  @override
  factory Cholesterol.fromMap(Map map) => Cholesterol(map['value']);
  // </Dataclass>

  // </editor-fold>
}

@Dataclass(all: false, constructor: true, copyWith: true)
class Calories extends Nutrient {
  static const int apiId = 208;
  static const String unit = 'kcal';

  // <editor-fold desc="Dataclass Section">

  // <Dataclass>

  Calories(super.value);

  @override
  Calories copyWith(num? value) => Calories(value ?? this.value);
  @override
  factory Calories.fromMap(Map map) => Calories(map['value']);
  // </Dataclass>

  // </editor-fold>
}

@Dataclass(all: false, constructor: true, copyWith: true)
class SaturatedFat extends Nutrient {
  static const int apiId = 606;
  static const String unit = 'g';

  // <editor-fold desc="Dataclass Section">

  // <Dataclass>

  SaturatedFat(super.value);

  @override
  SaturatedFat copyWith(num? value) => SaturatedFat(value ?? this.value);
  @override
  factory SaturatedFat.fromMap(Map map) => SaturatedFat(map['value']);
  // </Dataclass>

  // </editor-fold>
}

@Dataclass(all: false, constructor: true, copyWith: true)
class TotalFat extends Nutrient {
  static const int apiId = 204;
  static const String unit = 'g';

  // <editor-fold desc="Dataclass Section">

  // <Dataclass>

  TotalFat(super.value);

  @override
  TotalFat copyWith(num? value) => TotalFat(value ?? this.value);
  @override
  factory TotalFat.fromMap(Map map) => TotalFat(map['value']);
  // </Dataclass>

  // </editor-fold>
}

@Dataclass(all: false, constructor: true, copyWith: true)
class TransFat extends Nutrient {
  static const int apiId = 605;
  static const String unit = 'g';

  // <editor-fold desc="Dataclass Section">

  // <Dataclass>

  TransFat(super.value);

  @override
  TransFat copyWith(num? value) => TransFat(value ?? this.value);
  @override
  factory TransFat.fromMap(Map map) => TransFat(map['value']);
  // </Dataclass>

  // </editor-fold>
}

@Dataclass(all: false, constructor: true, copyWith: true)
class Iron extends Nutrient {
  static const int apiId = 303;
  static const String unit = 'mg';

  // <editor-fold desc="Dataclass Section">

  // <Dataclass>

  Iron(super.value);

  @override
  Iron copyWith(num? value) => Iron(value ?? this.value);
  @override
  factory Iron.fromMap(Map map) => Iron(map['value']);
  // </Dataclass>

  // </editor-fold>
}

@Dataclass(all: false, constructor: true, copyWith: true)
class Fiber extends Nutrient {
  static const int apiId = 291;
  static const String unit = 'g';

  // <editor-fold desc="Dataclass Section">

  // <Dataclass>

  Fiber(super.value);

  @override
  Fiber copyWith(num? value) => Fiber(value ?? this.value);
  @override
  factory Fiber.fromMap(Map map) => Fiber(map['value']);
  // </Dataclass>

  // </editor-fold>
}

@Dataclass(all: false, constructor: true, copyWith: true)
class Potassium extends Nutrient {
  static const int apiId = 306;
  static const String unit = 'mg';

  // <editor-fold desc="Dataclass Section">

  // <Dataclass>

  Potassium(super.value);

  @override
  Potassium copyWith(num? value) => Potassium(value ?? this.value);
  @override
  factory Potassium.fromMap(Map map) => Potassium(map['value']);
  // </Dataclass>

  // </editor-fold>
}

@Dataclass(all: false, constructor: true, copyWith: true)
class Sodium extends Nutrient {
  static const int apiId = 307;
  static const String unit = 'mg';

  // <editor-fold desc="Dataclass Section">

  // <Dataclass>

  Sodium(super.value);

  @override
  Sodium copyWith(num? value) => Sodium(value ?? this.value);
  @override
  factory Sodium.fromMap(Map map) => Sodium(map['value']);
  // </Dataclass>

  // </editor-fold>
}

@Dataclass(all: false, constructor: true, copyWith: true)
class Protein extends Nutrient {
  static const int apiId = 203;
  static const String unit = 'g';

  // <editor-fold desc="Dataclass Section">

  // <Dataclass>

  Protein(super.value);

  @override
  Protein copyWith(num? value) => Protein(value ?? this.value);
  @override
  factory Protein.fromMap(Map map) => Protein(map['value']);
  // </Dataclass>

  // </editor-fold>
}

@Dataclass(all: false, constructor: true, copyWith: true)
class Sugars extends Nutrient {
  static const int apiId = 269;
  static const String unit = 'g';

  // <editor-fold desc="Dataclass Section">

  // <Dataclass>

  Sugars(super.value);

  @override
  Sugars copyWith(num? value) => Sugars(value ?? this.value);
  @override
  factory Sugars.fromMap(Map map) => Sugars(map['value']);
  // </Dataclass>

  // </editor-fold>
}

@Dataclass(all: false, constructor: true, copyWith: true)
class Choline extends Nutrient {
  static const int apiId = 421;
  static const String unit = 'mg';

  // <editor-fold desc="Dataclass Section">

  // <Dataclass>

  Choline(super.value);

  @override
  Choline copyWith(num? value) => Choline(value ?? this.value);
  @override
  factory Choline.fromMap(Map map) => Choline(map['value']);
  // </Dataclass>

  // </editor-fold>
}

@Dataclass(all: false, constructor: true, copyWith: true)
class Copper extends Nutrient {
  static const int apiId = 312;
  static const String unit = 'mg';

  // <editor-fold desc="Dataclass Section">

  // <Dataclass>

  Copper(super.value);

  @override
  Copper copyWith(num? value) => Copper(value ?? this.value);
  @override
  factory Copper.fromMap(Map map) => Copper(map['value']);
  // </Dataclass>

  // </editor-fold>
}

@Dataclass(all: false, constructor: true, copyWith: true)
class ALA extends Nutrient {
  static const int apiId = 851;
  static const String unit = 'g';

  // <editor-fold desc="Dataclass Section">

  // <Dataclass>

  ALA(super.value);

  @override
  ALA copyWith(num? value) => ALA(value ?? this.value);
  @override
  factory ALA.fromMap(Map map) => ALA(map['value']);
  // </Dataclass>

  // </editor-fold>
}

@Dataclass(all: false, constructor: true, copyWith: true)
class LinoleicAcid extends Nutrient {
  static const int apiId = 685;
  static const String unit = 'g';

  // <editor-fold desc="Dataclass Section">

  // <Dataclass>

  LinoleicAcid(super.value);

  @override
  LinoleicAcid copyWith(num? value) => LinoleicAcid(value ?? this.value);
  @override
  factory LinoleicAcid.fromMap(Map map) => LinoleicAcid(map['value']);
  // </Dataclass>

  // </editor-fold>
}

@Dataclass(all: false, constructor: true, copyWith: true)
class EPA extends Nutrient {
  static const int apiId = 629;
  static const String unit = 'g';

  // <editor-fold desc="Dataclass Section">

  // <Dataclass>

  EPA(super.value);

  @override
  EPA copyWith(num? value) => EPA(value ?? this.value);
  @override
  factory EPA.fromMap(Map map) => EPA(map['value']);
  // </Dataclass>

  // </editor-fold>
}

@Dataclass(all: false, constructor: true, copyWith: true)
class DPA extends Nutrient {
  static const int apiId = 631;
  static const String unit = 'g';

  // <editor-fold desc="Dataclass Section">

  // <Dataclass>

  DPA(super.value);

  @override
  DPA copyWith(num? value) => DPA(value ?? this.value);
  @override
  factory DPA.fromMap(Map map) => DPA(map['value']);
  // </Dataclass>

  // </editor-fold>
}

@Dataclass(all: false, constructor: true, copyWith: true)
class DHA extends Nutrient {
  static const int apiId = 621;
  static const String unit = 'g';

  // <editor-fold desc="Dataclass Section">

  // <Dataclass>

  DHA(super.value);

  @override
  DHA copyWith(num? value) => DHA(value ?? this.value);
  @override
  factory DHA.fromMap(Map map) => DHA(map['value']);
  // </Dataclass>

  // </editor-fold>
}

@Dataclass(all: false, constructor: true, copyWith: true)
class Folate extends Nutrient {
  static const int apiId = 417;
  static const String unit = 'µg';

  // <editor-fold desc="Dataclass Section">

  // <Dataclass>

  Folate(super.value);

  @override
  Folate copyWith(num? value) => Folate(value ?? this.value);
  @override
  factory Folate.fromMap(Map map) => Folate(map['value']);
  // </Dataclass>

  // </editor-fold>
}

@Dataclass(all: false, constructor: true, copyWith: true)
class Magnesium extends Nutrient {
  static const int apiId = 304;
  static const String unit = 'mg';

  // <editor-fold desc="Dataclass Section">

  // <Dataclass>

  Magnesium(super.value);

  @override
  Magnesium copyWith(num? value) => Magnesium(value ?? this.value);
  @override
  factory Magnesium.fromMap(Map map) => Magnesium(map['value']);
  // </Dataclass>

  // </editor-fold>
}

@Dataclass(all: false, constructor: true, copyWith: true)
class Manganese extends Nutrient {
  static const int apiId = 315;
  static const String unit = 'mg';

  // <editor-fold desc="Dataclass Section">

  // <Dataclass>

  Manganese(super.value);

  @override
  Manganese copyWith(num? value) => Manganese(value ?? this.value);
  @override
  factory Manganese.fromMap(Map map) => Manganese(map['value']);
  // </Dataclass>

  // </editor-fold>
}

@Dataclass(all: false, constructor: true, copyWith: true)
class Niacin extends Nutrient {
  static const int apiId = 406;
  static const String unit = 'mg';

  // <editor-fold desc="Dataclass Section">

  // <Dataclass>

  Niacin(super.value);

  @override
  Niacin copyWith(num? value) => Niacin(value ?? this.value);
  @override
  factory Niacin.fromMap(Map map) => Niacin(map['value']);
  // </Dataclass>

  // </editor-fold>
}

@Dataclass(all: false, constructor: true, copyWith: true)
class Phosphorus extends Nutrient {
  static const int apiId = 305;
  static const String unit = 'mg';

  // <editor-fold desc="Dataclass Section">

  // <Dataclass>

  Phosphorus(super.value);

  @override
  Phosphorus copyWith(num? value) => Phosphorus(value ?? this.value);
  @override
  factory Phosphorus.fromMap(Map map) => Phosphorus(map['value']);
  // </Dataclass>

  // </editor-fold>
}

@Dataclass(all: false, constructor: true, copyWith: true)
class PantothenicAcid extends Nutrient {
  static const int apiId = 410;
  static const String unit = 'mg';

  // <editor-fold desc="Dataclass Section">

  // <Dataclass>

  PantothenicAcid(super.value);

  @override
  PantothenicAcid copyWith(num? value) => PantothenicAcid(value ?? this.value);
  @override
  factory PantothenicAcid.fromMap(Map map) => PantothenicAcid(map['value']);
  // </Dataclass>

  // </editor-fold>
}

@Dataclass(all: false, constructor: true, copyWith: true)
class Riboflavin extends Nutrient {
  static const int apiId = 405;
  static const String unit = 'mg';

  // <editor-fold desc="Dataclass Section">

  // <Dataclass>

  Riboflavin(super.value);

  @override
  Riboflavin copyWith(num? value) => Riboflavin(value ?? this.value);
  @override
  factory Riboflavin.fromMap(Map map) => Riboflavin(map['value']);
  // </Dataclass>

  // </editor-fold>
}

@Dataclass(all: false, constructor: true, copyWith: true)
class Selenium extends Nutrient {
  static const int apiId = 317;
  static const String unit = 'µg';

  // <editor-fold desc="Dataclass Section">

  // <Dataclass>

  Selenium(super.value);

  @override
  Selenium copyWith(num? value) => Selenium(value ?? this.value);
  @override
  factory Selenium.fromMap(Map map) => Selenium(map['value']);
  // </Dataclass>

  // </editor-fold>
}

@Dataclass(all: false, constructor: true, copyWith: true)
class Thiamin extends Nutrient {
  static const int apiId = 404;
  static const String unit = 'mg';

  // <editor-fold desc="Dataclass Section">

  // <Dataclass>

  Thiamin(super.value);

  @override
  Thiamin copyWith(num? value) => Thiamin(value ?? this.value);
  @override
  factory Thiamin.fromMap(Map map) => Thiamin(map['value']);
  // </Dataclass>

  // </editor-fold>
}

@Dataclass(all: false, constructor: true, copyWith: true)
class VitaminE extends Nutrient {
  static const int apiId = 323;
  static const String unit = 'mg';

  // <editor-fold desc="Dataclass Section">

  // <Dataclass>

  VitaminE(super.value);

  @override
  VitaminE copyWith(num? value) => VitaminE(value ?? this.value);
  @override
  factory VitaminE.fromMap(Map map) => VitaminE(map['value']);
  // </Dataclass>

  // </editor-fold>
}

@Dataclass(all: false, constructor: true, copyWith: true)
class VitaminA extends Nutrient {
  static const int apiId = 320;
  static const String unit = 'µg';

  // <editor-fold desc="Dataclass Section">

  // <Dataclass>

  VitaminA(super.value);

  @override
  VitaminA copyWith(num? value) => VitaminA(value ?? this.value);
  @override
  factory VitaminA.fromMap(Map map) => VitaminA(map['value']);
  // </Dataclass>

  // </editor-fold>
}

@Dataclass(all: false, constructor: true, copyWith: true)
class VitaminB12 extends Nutrient {
  static const int apiId = 418;
  static const String unit = 'µg';

  // <editor-fold desc="Dataclass Section">

  // <Dataclass>

  VitaminB12(super.value);

  @override
  VitaminB12 copyWith(num? value) => VitaminB12(value ?? this.value);
  @override
  factory VitaminB12.fromMap(Map map) => VitaminB12(map['value']);
  // </Dataclass>

  // </editor-fold>
}

@Dataclass(all: false, constructor: true, copyWith: true)
class VitaminB6 extends Nutrient {
  static const int apiId = 415;
  static const String unit = 'mg';

  // <editor-fold desc="Dataclass Section">

  // <Dataclass>

  VitaminB6(super.value);

  @override
  VitaminB6 copyWith(num? value) => VitaminB6(value ?? this.value);
  @override
  factory VitaminB6.fromMap(Map map) => VitaminB6(map['value']);
  // </Dataclass>

  // </editor-fold>
}

@Dataclass(all: false, constructor: true, copyWith: true)
class VitaminC extends Nutrient {
  static const int apiId = 401;
  static const String unit = 'mg';

  // <editor-fold desc="Dataclass Section">

  // <Dataclass>

  VitaminC(super.value);

  @override
  VitaminC copyWith(num? value) => VitaminC(value ?? this.value);
  @override
  factory VitaminC.fromMap(Map map) => VitaminC(map['value']);
  // </Dataclass>

  // </editor-fold>
}

@Dataclass(all: false, constructor: true, copyWith: true)
class VitaminD extends Nutrient {
  static const int apiId = 328;
  static const String unit = 'µg';

  // <editor-fold desc="Dataclass Section">

  // <Dataclass>

  VitaminD(super.value);

  @override
  VitaminD copyWith(num? value) => VitaminD(value ?? this.value);
  @override
  factory VitaminD.fromMap(Map map) => VitaminD(map['value']);
  // </Dataclass>

  // </editor-fold>
}

@Dataclass(all: false, constructor: true, copyWith: true)
class VitaminK extends Nutrient {
  static const int apiId = 430;
  static const String unit = 'µg';

  // <editor-fold desc="Dataclass Section">

  // <Dataclass>

  VitaminK(super.value);

  @override
  VitaminK copyWith(num? value) => VitaminK(value ?? this.value);
  @override
  factory VitaminK.fromMap(Map map) => VitaminK(map['value']);
  // </Dataclass>

  // </editor-fold>
}

@Dataclass(all: false, constructor: true, copyWith: true)
class Zinc extends Nutrient {
  static const int apiId = 309;
  static const String unit = 'mg';

  // <editor-fold desc="Dataclass Section">

  // <Dataclass>

  Zinc(super.value);

  @override
  Zinc copyWith(num? value) => Zinc(value ?? this.value);
  @override
  factory Zinc.fromMap(Map map) => Zinc(map['value']);
  // </Dataclass>

  // </editor-fold>
}

@Dataclass(all: false, constructor: true, copyWith: true)
class UnsaturatedFat extends Nutrient {
  static const apiId = null;
  static const String unit = 'g';
  // <editor-fold desc="Dataclass Section">

  // <Dataclass>

  UnsaturatedFat(super.value);

  @override
  UnsaturatedFat copyWith(num? value) => UnsaturatedFat(value ?? this.value);
  @override
  factory UnsaturatedFat.fromMap(Map map) => UnsaturatedFat(map['value']);
  // </Dataclass>

  // </editor-fold>
}
