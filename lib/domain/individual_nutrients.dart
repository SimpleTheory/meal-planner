import 'package:nutrition_app/mydataclasses/metadata.dart';
import 'dart:convert';
import 'package:dataclasses/dataclasses.dart';

// TODO REFACTOR NUTRIENTS

abstract class Nutrient2 {
  final num value;
  static late final int? apiId;
  static late final String unit;
  String get name => runtimeType.toString();

  bool checkIfSame(Nutrient2 other) => name == other.name;
  void error(Nutrient2 other) {
    throw Exception('Can\'t operate on $name with ${other.name} as they are'
        'not the same nutrient');
  }

  void errorCheck(Nutrient2 other) {
    if (!checkIfSame(other)) {
      error(other);
    }
  }

  Nutrient2 operator +(Nutrient2 other) {
    errorCheck(other);
    return copyWith(value + other.value);
  }

  Nutrient2 operator -(Nutrient2 other) {
    errorCheck(other);
    return copyWith(value - other.value);
  }

  Nutrient2 operator *(num other) {
    return copyWith(value * other);
  }

  Nutrient2 operator /(num other) {
    return copyWith(value / other);
  }

//<editor-fold desc="Data Methods">

  Nutrient2(this.value);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Nutrient2 &&
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

  Nutrient2 copyWith(num? value);

  Map<String, dynamic> toMap() {
    return {'value': value, '__type': name};
  }

  factory Nutrient2.fromMap(Map map) {
    // TODO: implement Nutrient.fromMap
    throw UnimplementedError();
  }

//</editor-fold>
}

@Dataclass(constructor: false, copyWith: false, toStr: false)
class Nutrient {
  final num value;
  final int? apiId;
  final String unit;
  final String name;

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

  //<editor-fold desc="Custom Data Methods and Constructors">

  @override
  String toString() {
    return '$name{'
        'value: $value'
        'unit: $unit}';
  }

  Nutrient copyWith(num? value) => Nutrient(
      value: value ?? this.value, apiId: apiId, unit: unit, name: name);

  Nutrient({
    required this.value,
    required this.apiId,
    required this.unit,
    required this.name,
  });
  Nutrient.Calcium(this.value,
      {this.apiId = 301, this.unit = "mg", this.name = "Calcium"});
  Nutrient.Carbohydrate(this.value,
      {this.apiId = 205, this.unit = "g", this.name = "Carbohydrate"});
  Nutrient.Cholesterol(this.value,
      {this.apiId = 601, this.unit = "mg", this.name = "Cholesterol"});
  Nutrient.Calories(this.value,
      {this.apiId = 208, this.unit = "kcal", this.name = "Calories"});
  Nutrient.SaturatedFat(this.value,
      {this.apiId = 606, this.unit = "g", this.name = "SaturatedFat"});
  Nutrient.TotalFat(this.value,
      {this.apiId = 204, this.unit = "g", this.name = "TotalFat"});
  Nutrient.TransFat(this.value,
      {this.apiId = 605, this.unit = "g", this.name = "TransFat"});
  Nutrient.Iron(this.value,
      {this.apiId = 303, this.unit = "mg", this.name = "Iron"});
  Nutrient.Fiber(this.value,
      {this.apiId = 291, this.unit = "g", this.name = "Fiber"});
  Nutrient.Potassium(this.value,
      {this.apiId = 306, this.unit = "mg", this.name = "Potassium"});
  Nutrient.Sodium(this.value,
      {this.apiId = 307, this.unit = "mg", this.name = "Sodium"});
  Nutrient.Protein(this.value,
      {this.apiId = 203, this.unit = "g", this.name = "Protein"});
  Nutrient.Sugars(this.value,
      {this.apiId = 269, this.unit = "g", this.name = "Sugars"});
  Nutrient.Choline(this.value,
      {this.apiId = 421, this.unit = "mg", this.name = "Choline"});
  Nutrient.Copper(this.value,
      {this.apiId = 312, this.unit = "mg", this.name = "Copper"});
  Nutrient.ALA(this.value,
      {this.apiId = 851, this.unit = "g", this.name = "ALA"});
  Nutrient.LinoleicAcid(this.value,
      {this.apiId = 685, this.unit = "g", this.name = "LinoleicAcid"});
  Nutrient.EPA(this.value,
      {this.apiId = 629, this.unit = "g", this.name = "EPA"});
  Nutrient.DPA(this.value,
      {this.apiId = 631, this.unit = "g", this.name = "DPA"});
  Nutrient.DHA(this.value,
      {this.apiId = 621, this.unit = "g", this.name = "DHA"});
  Nutrient.Folate(this.value,
      {this.apiId = 417, this.unit = "µg", this.name = "Folate"});
  Nutrient.Magnesium(this.value,
      {this.apiId = 304, this.unit = "mg", this.name = "Magnesium"});
  Nutrient.Manganese(this.value,
      {this.apiId = 315, this.unit = "mg", this.name = "Manganese"});
  Nutrient.Niacin(this.value,
      {this.apiId = 406, this.unit = "mg", this.name = "Niacin"});
  Nutrient.Phosphorus(this.value,
      {this.apiId = 305, this.unit = "mg", this.name = "Phosphorus"});
  Nutrient.PantothenicAcid(this.value,
      {this.apiId = 410, this.unit = "mg", this.name = "PantothenicAcid"});
  Nutrient.Riboflavin(this.value,
      {this.apiId = 405, this.unit = "mg", this.name = "Riboflavin"});
  Nutrient.Selenium(this.value,
      {this.apiId = 317, this.unit = "µg", this.name = "Selenium"});
  Nutrient.Thiamin(this.value,
      {this.apiId = 404, this.unit = "mg", this.name = "Thiamin"});
  Nutrient.VitaminE(this.value,
      {this.apiId = 323, this.unit = "mg", this.name = "VitaminE"});
  Nutrient.VitaminA(this.value,
      {this.apiId = 320, this.unit = "µg", this.name = "VitaminA"});
  Nutrient.VitaminB12(this.value,
      {this.apiId = 418, this.unit = "µg", this.name = "VitaminB12"});
  Nutrient.VitaminB6(this.value,
      {this.apiId = 415, this.unit = "mg", this.name = "VitaminB6"});
  Nutrient.VitaminC(this.value,
      {this.apiId = 401, this.unit = "mg", this.name = "VitaminC"});
  Nutrient.VitaminD(this.value,
      {this.apiId = 328, this.unit = "µg", this.name = "VitaminD"});
  Nutrient.VitaminK(this.value,
      {this.apiId = 430, this.unit = "µg", this.name = "VitaminK"});
  Nutrient.Zinc(this.value,
      {this.apiId = 309, this.unit = "mg", this.name = "Zinc"});
  Nutrient.UnsaturatedFat(this.value,
      {this.apiId, this.unit = 'g', this.name = 'UnstauratedFat'});
//</editor-fold>

  // <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  factory Nutrient.staticConstructor(
          {required value, required unit, required name, apiId}) =>
      Nutrient(value: value, unit: unit, name: name, apiId: apiId);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit, "name": name};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Nutrient &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit) &&
          equals(name, other.name));

  @override
  int get hashCode =>
      value.hashCode ^ apiId.hashCode ^ unit.hashCode ^ name.hashCode;

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'Nutrient', ...nestedJsonMap(attributes__)};

  factory Nutrient.fromJson(String json) => Nutrient.fromMap(jsonDecode(json));

  factory Nutrient.fromMap(Map map) {
    num value = map['value'];
    int? apiId = map['apiId'];
    String unit = map['unit'];
    String name = map['name'];

    // No casting

    return Nutrient(value: value, apiId: apiId, unit: unit, name: name);
  }
  // </Dataclass>

  // </editor-fold>
}
