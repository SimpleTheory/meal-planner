import 'package:nutrition_app/mydataclasses/metadata.dart';
import 'dart:convert';
import 'package:dataclasses/dataclasses.dart';

abstract class Nutrient {
  num value;
  int apiId;
  String unit;

  Nutrient(this.apiId, this.unit, this.value);
}

@Dataclass()
class Calcium implements Nutrient {
  num value;
  int apiId = 301;
  String unit = 'mg';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  Calcium({
    required this.value,
    this.apiId = 301,
    this.unit = 'mg',
  });

  factory Calcium.staticConstructor({
    required value,
    apiId = 301,
    unit = 'mg',
  }) =>
      Calcium(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Calcium &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode =>
      value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() =>
      'Calcium(value: $value, apiId: $apiId, unit: $unit)';

  Calcium copyWithCalcium(num? value, int? apiId, String? unit) =>
      Calcium(
          value: value ?? this.value,
          apiId: apiId ?? this.apiId,
          unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'Calcium', ...nestedJsonMap(attributes__)};

  factory Calcium.fromJson(String json) => Calcium.fromMap(jsonDecode(json));

  factory Calcium.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return Calcium(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class Carbohydrate implements Nutrient {
  num value;
  int apiId = 205;
  String unit = 'g';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  Carbohydrate({
    required this.value,
    this.apiId = 205,
    this.unit = 'g',
  });

  factory Carbohydrate.staticConstructor({
    required value,
    apiId = 205,
    unit = 'g',
  }) =>
      Carbohydrate(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Carbohydrate &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() =>
      'Carbohydrate(value: $value, apiId: $apiId, unit: $unit)';

  Carbohydrate copyWithCarbohydrate(num? value, int? apiId, String? unit) =>
      Carbohydrate(
          value: value ?? this.value,
          apiId: apiId ?? this.apiId,
          unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'Carbohydrate', ...nestedJsonMap(attributes__)};

  factory Carbohydrate.fromJson(String json) =>
      Carbohydrate.fromMap(jsonDecode(json));

  factory Carbohydrate.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return Carbohydrate(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class Cholesterol implements Nutrient {
  num value;
  int apiId = 601;
  String unit = 'mg';

  // <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  Cholesterol({
    required this.value,
    this.apiId = 601,
    this.unit = 'mg',
  });

  factory Cholesterol.staticConstructor({
    required value,
    apiId = 601,
    unit = 'mg',
  }) =>
      Cholesterol(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Cholesterol &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() => 'Cholesterol(value: $value, apiId: $apiId, unit: $unit)';

  Cholesterol copyWithCholesterol(num? value, int? apiId, String? unit) =>
      Cholesterol(
          value: value ?? this.value,
          apiId: apiId ?? this.apiId,
          unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'Cholesterol', ...nestedJsonMap(attributes__)};

  factory Cholesterol.fromJson(String json) =>
      Cholesterol.fromMap(jsonDecode(json));

  factory Cholesterol.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return Cholesterol(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class Energy implements Nutrient {
  num value;
  int apiId = 208;
  String unit = 'kcal';

  // <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  Energy({
    required this.value,
    this.apiId = 208,
    this.unit = 'kcal',
  });

  factory Energy.staticConstructor({
    required value,
    apiId = 208,
    unit = 'kcal',
  }) =>
      Energy(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Energy &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() => 'Energy(value: $value, apiId: $apiId, unit: $unit)';

  Energy copyWithEnergy(num? value, int? apiId, String? unit) => Energy(
      value: value ?? this.value,
      apiId: apiId ?? this.apiId,
      unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'Energy', ...nestedJsonMap(attributes__)};

  factory Energy.fromJson(String json) => Energy.fromMap(jsonDecode(json));

  factory Energy.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return Energy(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class SaturatedFat implements Nutrient {
  num value;
  int apiId = 606;
  String unit = 'g';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  SaturatedFat({
    required this.value,
    this.apiId = 606,
    this.unit = 'g',
  });

  factory SaturatedFat.staticConstructor({
    required value,
    apiId = 606,
    unit = 'g',
  }) =>
      SaturatedFat(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SaturatedFat &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() =>
      'SaturatedFat(value: $value, apiId: $apiId, unit: $unit)';

  SaturatedFat copyWithSaturatedFat(num? value, int? apiId, String? unit) =>
      SaturatedFat(
          value: value ?? this.value,
          apiId: apiId ?? this.apiId,
          unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'SaturatedFat', ...nestedJsonMap(attributes__)};

  factory SaturatedFat.fromJson(String json) =>
      SaturatedFat.fromMap(jsonDecode(json));

  factory SaturatedFat.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return SaturatedFat(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class TotalFat implements Nutrient {
  num value;
  int apiId = 204;
  String unit = 'g';

  // <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  TotalFat({
    required this.value,
    this.apiId = 204,
    this.unit = 'g',
  });

  factory TotalFat.staticConstructor({
    required value,
    apiId = 204,
    unit = 'g',
  }) =>
      TotalFat(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TotalFat &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() => 'TotalFat(value: $value, apiId: $apiId, unit: $unit)';

  TotalFat copyWithTotalFat(num? value, int? apiId, String? unit) => TotalFat(
      value: value ?? this.value,
      apiId: apiId ?? this.apiId,
      unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'TotalFat', ...nestedJsonMap(attributes__)};

  factory TotalFat.fromJson(String json) => TotalFat.fromMap(jsonDecode(json));

  factory TotalFat.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return TotalFat(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class TransFat implements Nutrient {
  num value;
  int apiId = 605;
  String unit = 'g';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  TransFat({
    required this.value,
    this.apiId = 605,
    this.unit = 'g',
  });

  factory TransFat.staticConstructor({
    required value,
    apiId = 605,
    unit = 'g',
  }) =>
      TransFat(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TransFat &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() => 'TransFat(value: $value, apiId: $apiId, unit: $unit)';

  TransFat copyWithTransFat(num? value, int? apiId, String? unit) => TransFat(
      value: value ?? this.value,
      apiId: apiId ?? this.apiId,
      unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'TransFat', ...nestedJsonMap(attributes__)};

  factory TransFat.fromJson(String json) => TransFat.fromMap(jsonDecode(json));

  factory TransFat.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return TransFat(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class Iron implements Nutrient {
  num value;
  int apiId = 303;
  String unit = 'mg';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  Iron({
    required this.value,
    this.apiId = 303,
    this.unit = 'mg',
  });

  factory Iron.staticConstructor({
    required value,
    apiId = 303,
    unit = 'mg',
  }) =>
      Iron(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Iron &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() => 'Iron(value: $value, apiId: $apiId, unit: $unit)';

  Iron copyWithIron(num? value, int? apiId, String? unit) => Iron(
      value: value ?? this.value,
      apiId: apiId ?? this.apiId,
      unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'Iron', ...nestedJsonMap(attributes__)};

  factory Iron.fromJson(String json) => Iron.fromMap(jsonDecode(json));

  factory Iron.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return Iron(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class Fiber implements Nutrient {
  num value;
  int apiId = 291;
  String unit = 'g';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  Fiber({
    required this.value,
    this.apiId = 291,
    this.unit = 'g',
  });

  factory Fiber.staticConstructor({
    required value,
    apiId = 291,
    unit = 'g',
  }) =>
      Fiber(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Fiber &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() => 'Fiber(value: $value, apiId: $apiId, unit: $unit)';

  Fiber copyWithFiber(num? value, int? apiId, String? unit) => Fiber(
      value: value ?? this.value,
      apiId: apiId ?? this.apiId,
      unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'Fiber', ...nestedJsonMap(attributes__)};

  factory Fiber.fromJson(String json) => Fiber.fromMap(jsonDecode(json));

  factory Fiber.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return Fiber(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class Potassium implements Nutrient {
  num value;
  int apiId = 306;
  String unit = 'mg';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  Potassium({
    required this.value,
    this.apiId = 306,
    this.unit = 'mg',
  });

  factory Potassium.staticConstructor({
    required value,
    apiId = 306,
    unit = 'mg',
  }) =>
      Potassium(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Potassium &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() => 'Potassium(value: $value, apiId: $apiId, unit: $unit)';

  Potassium copyWithPotassium(num? value, int? apiId, String? unit) =>
      Potassium(
          value: value ?? this.value,
          apiId: apiId ?? this.apiId,
          unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'Potassium', ...nestedJsonMap(attributes__)};

  factory Potassium.fromJson(String json) =>
      Potassium.fromMap(jsonDecode(json));

  factory Potassium.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return Potassium(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class Sodium implements Nutrient {
  num value;
  int apiId = 307;
  String unit = 'mg';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  Sodium({
    required this.value,
    this.apiId = 307,
    this.unit = 'mg',
  });

  factory Sodium.staticConstructor({
    required value,
    apiId = 307,
    unit = 'mg',
  }) =>
      Sodium(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Sodium &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() => 'Sodium(value: $value, apiId: $apiId, unit: $unit)';

  Sodium copyWithSodium(num? value, int? apiId, String? unit) => Sodium(
      value: value ?? this.value,
      apiId: apiId ?? this.apiId,
      unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'Sodium', ...nestedJsonMap(attributes__)};

  factory Sodium.fromJson(String json) => Sodium.fromMap(jsonDecode(json));

  factory Sodium.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return Sodium(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class Protein implements Nutrient {
  num value;
  int apiId = 203;
  String unit = 'g';

  // <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  Protein({
    required this.value,
    this.apiId = 203,
    this.unit = 'g',
  });

  factory Protein.staticConstructor({
    required value,
    apiId = 203,
    unit = 'g',
  }) =>
      Protein(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Protein &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() => 'Protein(value: $value, apiId: $apiId, unit: $unit)';

  Protein copyWithProtein(num? value, int? apiId, String? unit) => Protein(
      value: value ?? this.value,
      apiId: apiId ?? this.apiId,
      unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'Protein', ...nestedJsonMap(attributes__)};

  factory Protein.fromJson(String json) => Protein.fromMap(jsonDecode(json));

  factory Protein.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return Protein(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class Sugars implements Nutrient {
  num value;
  int apiId = 269;
  String unit = 'g';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  Sugars({
    required this.value,
    this.apiId = 269,
    this.unit = 'g',
  });

  factory Sugars.staticConstructor({
    required value,
    apiId = 269,
    unit = 'g',
  }) =>
      Sugars(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Sugars &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() => 'Sugars(value: $value, apiId: $apiId, unit: $unit)';

  Sugars copyWithSugars(num? value, int? apiId, String? unit) => Sugars(
      value: value ?? this.value,
      apiId: apiId ?? this.apiId,
      unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'Sugars', ...nestedJsonMap(attributes__)};

  factory Sugars.fromJson(String json) => Sugars.fromMap(jsonDecode(json));

  factory Sugars.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return Sugars(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class SugarsAdded implements Nutrient {
  num value;
  int apiId = 539;
  String unit = 'g';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  SugarsAdded({
    required this.value,
    this.apiId = 539,
    this.unit = 'g',
  });

  factory SugarsAdded.staticConstructor({
    required value,
    apiId = 539,
    unit = 'g',
  }) =>
      SugarsAdded(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SugarsAdded &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() => 'SugarsAdded(value: $value, apiId: $apiId, unit: $unit)';

  SugarsAdded copyWithSugarsAdded(num? value, int? apiId, String? unit) =>
      SugarsAdded(
          value: value ?? this.value,
          apiId: apiId ?? this.apiId,
          unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'SugarsAdded', ...nestedJsonMap(attributes__)};

  factory SugarsAdded.fromJson(String json) =>
      SugarsAdded.fromMap(jsonDecode(json));

  factory SugarsAdded.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return SugarsAdded(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class VitaminD2 implements Nutrient {
  num value;
  int apiId = 324;
  String unit = 'IU';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  VitaminD2({
    required this.value,
    this.apiId = 324,
    this.unit = 'IU',
  });

  factory VitaminD2.staticConstructor({
    required value,
    apiId = 324,
    unit = 'IU',
  }) =>
      VitaminD2(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is VitaminD2 &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() => 'VitaminD2(value: $value, apiId: $apiId, unit: $unit)';

  VitaminD2 copyWithVitaminD2(num? value, int? apiId, String? unit) =>
      VitaminD2(
          value: value ?? this.value,
          apiId: apiId ?? this.apiId,
          unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'VitaminD2', ...nestedJsonMap(attributes__)};

  factory VitaminD2.fromJson(String json) =>
      VitaminD2.fromMap(jsonDecode(json));

  factory VitaminD2.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return VitaminD2(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class Alanine implements Nutrient {
  num value;
  int apiId = 513;
  String unit = 'g';

  // <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  Alanine({
    required this.value,
    this.apiId = 513,
    this.unit = 'g',
  });

  factory Alanine.staticConstructor({
    required value,
    apiId = 513,
    unit = 'g',
  }) =>
      Alanine(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Alanine &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() => 'Alanine(value: $value, apiId: $apiId, unit: $unit)';

  Alanine copyWithAlanine(num? value, int? apiId, String? unit) => Alanine(
      value: value ?? this.value,
      apiId: apiId ?? this.apiId,
      unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'Alanine', ...nestedJsonMap(attributes__)};

  factory Alanine.fromJson(String json) => Alanine.fromMap(jsonDecode(json));

  factory Alanine.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return Alanine(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class Alcohol implements Nutrient {
  num value;
  int apiId = 221;
  String unit = 'g';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  Alcohol({
    required this.value,
    this.apiId = 221,
    this.unit = 'g',
  });

  factory Alcohol.staticConstructor({
    required value,
    apiId = 221,
    unit = 'g',
  }) =>
      Alcohol(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Alcohol &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() => 'Alcohol(value: $value, apiId: $apiId, unit: $unit)';

  Alcohol copyWithAlcohol(num? value, int? apiId, String? unit) => Alcohol(
      value: value ?? this.value,
      apiId: apiId ?? this.apiId,
      unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'Alcohol', ...nestedJsonMap(attributes__)};

  factory Alcohol.fromJson(String json) => Alcohol.fromMap(jsonDecode(json));

  factory Alcohol.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return Alcohol(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class Arginine implements Nutrient {
  num value;
  int apiId = 511;
  String unit = 'g';

  // <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  Arginine({
    required this.value,
    this.apiId = 511,
    this.unit = 'g',
  });

  factory Arginine.staticConstructor({
    required value,
    apiId = 511,
    unit = 'g',
  }) =>
      Arginine(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Arginine &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() => 'Arginine(value: $value, apiId: $apiId, unit: $unit)';

  Arginine copyWithArginine(num? value, int? apiId, String? unit) => Arginine(
      value: value ?? this.value,
      apiId: apiId ?? this.apiId,
      unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'Arginine', ...nestedJsonMap(attributes__)};

  factory Arginine.fromJson(String json) => Arginine.fromMap(jsonDecode(json));

  factory Arginine.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return Arginine(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class Ash implements Nutrient {
  num value;
  int apiId = 207;
  String unit = 'g';

  // <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  Ash({
    required this.value,
    this.apiId = 207,
    this.unit = 'g',
  });

  factory Ash.staticConstructor({
    required value,
    apiId = 207,
    unit = 'g',
  }) =>
      Ash(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Ash &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() => 'Ash(value: $value, apiId: $apiId, unit: $unit)';

  Ash copyWithAsh(num? value, int? apiId, String? unit) => Ash(
      value: value ?? this.value,
      apiId: apiId ?? this.apiId,
      unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'Ash', ...nestedJsonMap(attributes__)};

  factory Ash.fromJson(String json) => Ash.fromMap(jsonDecode(json));

  factory Ash.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return Ash(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class AsparticAcid implements Nutrient {
  num value;
  int apiId = 514;
  String unit = 'g';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  AsparticAcid({
    required this.value,
    this.apiId = 514,
    this.unit = 'g',
  });

  factory AsparticAcid.staticConstructor({
    required value,
    apiId = 514,
    unit = 'g',
  }) =>
      AsparticAcid(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AsparticAcid &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() =>
      'AsparticAcid(value: $value, apiId: $apiId, unit: $unit)';

  AsparticAcid copyWithAsparticAcid(num? value, int? apiId, String? unit) =>
      AsparticAcid(
          value: value ?? this.value,
          apiId: apiId ?? this.apiId,
          unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'AsparticAcid', ...nestedJsonMap(attributes__)};

  factory AsparticAcid.fromJson(String json) =>
      AsparticAcid.fromMap(jsonDecode(json));

  factory AsparticAcid.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return AsparticAcid(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class Betaine implements Nutrient {
  num value;
  int apiId = 454;
  String unit = 'mg';

  // <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  Betaine({
    required this.value,
    this.apiId = 454,
    this.unit = 'mg',
  });

  factory Betaine.staticConstructor({
    required value,
    apiId = 454,
    unit = 'mg',
  }) =>
      Betaine(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Betaine &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() => 'Betaine(value: $value, apiId: $apiId, unit: $unit)';

  Betaine copyWithBetaine(num? value, int? apiId, String? unit) => Betaine(
      value: value ?? this.value,
      apiId: apiId ?? this.apiId,
      unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'Betaine', ...nestedJsonMap(attributes__)};

  factory Betaine.fromJson(String json) => Betaine.fromMap(jsonDecode(json));

  factory Betaine.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return Betaine(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class Caffeine implements Nutrient {
  num value;
  int apiId = 262;
  String unit = 'mg';

  // <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  Caffeine({
    required this.value,
    this.apiId = 262,
    this.unit = 'mg',
  });

  factory Caffeine.staticConstructor({
    required value,
    apiId = 262,
    unit = 'mg',
  }) =>
      Caffeine(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Caffeine &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() => 'Caffeine(value: $value, apiId: $apiId, unit: $unit)';

  Caffeine copyWithCaffeine(num? value, int? apiId, String? unit) => Caffeine(
      value: value ?? this.value,
      apiId: apiId ?? this.apiId,
      unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'Caffeine', ...nestedJsonMap(attributes__)};

  factory Caffeine.fromJson(String json) => Caffeine.fromMap(jsonDecode(json));

  factory Caffeine.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return Caffeine(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class Campesterol implements Nutrient {
  num value;
  int apiId = 639;
  String unit = 'mg';

  // <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  Campesterol({
    required this.value,
    this.apiId = 639,
    this.unit = 'mg',
  });

  factory Campesterol.staticConstructor({
    required value,
    apiId = 639,
    unit = 'mg',
  }) =>
      Campesterol(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Campesterol &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() => 'Campesterol(value: $value, apiId: $apiId, unit: $unit)';

  Campesterol copyWithCampesterol(num? value, int? apiId, String? unit) =>
      Campesterol(
          value: value ?? this.value,
          apiId: apiId ?? this.apiId,
          unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'Campesterol', ...nestedJsonMap(attributes__)};

  factory Campesterol.fromJson(String json) =>
      Campesterol.fromMap(jsonDecode(json));

  factory Campesterol.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return Campesterol(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class CaroteneAlpha implements Nutrient {
  num value;
  int apiId = 322;
  String unit = 'µg';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  CaroteneAlpha({
    required this.value,
    this.apiId = 322,
    this.unit = 'µg',
  });

  factory CaroteneAlpha.staticConstructor({
    required value,
    apiId = 322,
    unit = 'µg',
  }) =>
      CaroteneAlpha(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CaroteneAlpha &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() =>
      'CaroteneAlpha(value: $value, apiId: $apiId, unit: $unit)';

  CaroteneAlpha copyWithCaroteneAlpha(num? value, int? apiId, String? unit) =>
      CaroteneAlpha(
          value: value ?? this.value,
          apiId: apiId ?? this.apiId,
          unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'CaroteneAlpha', ...nestedJsonMap(attributes__)};

  factory CaroteneAlpha.fromJson(String json) =>
      CaroteneAlpha.fromMap(jsonDecode(json));

  factory CaroteneAlpha.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return CaroteneAlpha(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class CaroteneBeta implements Nutrient {
  num value;
  int apiId = 321;
  String unit = 'µg';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  CaroteneBeta({
    required this.value,
    this.apiId = 321,
    this.unit = 'µg',
  });

  factory CaroteneBeta.staticConstructor({
    required value,
    apiId = 321,
    unit = 'µg',
  }) =>
      CaroteneBeta(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CaroteneBeta &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() =>
      'CaroteneBeta(value: $value, apiId: $apiId, unit: $unit)';

  CaroteneBeta copyWithCaroteneBeta(num? value, int? apiId, String? unit) =>
      CaroteneBeta(
          value: value ?? this.value,
          apiId: apiId ?? this.apiId,
          unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'CaroteneBeta', ...nestedJsonMap(attributes__)};

  factory CaroteneBeta.fromJson(String json) =>
      CaroteneBeta.fromMap(jsonDecode(json));

  factory CaroteneBeta.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return CaroteneBeta(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class VitaminD3 implements Nutrient {
  num value;
  int apiId = 326;
  String unit = 'µg';

  // <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  VitaminD3({
    required this.value,
    this.apiId = 326,
    this.unit = 'µg',
  });

  factory VitaminD3.staticConstructor({
    required value,
    apiId = 326,
    unit = 'µg',
  }) =>
      VitaminD3(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is VitaminD3 &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() => 'VitaminD3(value: $value, apiId: $apiId, unit: $unit)';

  VitaminD3 copyWithVitaminD3(num? value, int? apiId, String? unit) =>
      VitaminD3(
          value: value ?? this.value,
          apiId: apiId ?? this.apiId,
          unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'VitaminD3', ...nestedJsonMap(attributes__)};

  factory VitaminD3.fromJson(String json) =>
      VitaminD3.fromMap(jsonDecode(json));

  factory VitaminD3.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return VitaminD3(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class Choline implements Nutrient {
  num value;
  int apiId = 421;
  String unit = 'mg';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  Choline({
    required this.value,
    this.apiId = 421,
    this.unit = 'mg',
  });

  factory Choline.staticConstructor({
    required value,
    apiId = 421,
    unit = 'mg',
  }) =>
      Choline(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Choline &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() => 'Choline(value: $value, apiId: $apiId, unit: $unit)';

  Choline copyWithCholine(num? value, int? apiId, String? unit) => Choline(
      value: value ?? this.value,
      apiId: apiId ?? this.apiId,
      unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'Choline', ...nestedJsonMap(attributes__)};

  factory Choline.fromJson(String json) => Choline.fromMap(jsonDecode(json));

  factory Choline.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return Choline(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class CryptoxanthinBeta implements Nutrient {
  num value;
  int apiId = 334;
  String unit = 'µg';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  CryptoxanthinBeta({
    required this.value,
    this.apiId = 334,
    this.unit = 'µg',
  });

  factory CryptoxanthinBeta.staticConstructor({
    required value,
    apiId = 334,
    unit = 'µg',
  }) =>
      CryptoxanthinBeta(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CryptoxanthinBeta &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() =>
      'CryptoxanthinBeta(value: $value, apiId: $apiId, unit: $unit)';

  CryptoxanthinBeta copyWithCryptoxanthinBeta(
          num? value, int? apiId, String? unit) =>
      CryptoxanthinBeta(
          value: value ?? this.value,
          apiId: apiId ?? this.apiId,
          unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'CryptoxanthinBeta', ...nestedJsonMap(attributes__)};

  factory CryptoxanthinBeta.fromJson(String json) =>
      CryptoxanthinBeta.fromMap(jsonDecode(json));

  factory CryptoxanthinBeta.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return CryptoxanthinBeta(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class CopperCu implements Nutrient {
  num value;
  int apiId = 312;
  String unit = 'mg';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  CopperCu({
    required this.value,
    this.apiId = 312,
    this.unit = 'mg',
  });

  factory CopperCu.staticConstructor({
    required value,
    apiId = 312,
    unit = 'mg',
  }) =>
      CopperCu(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CopperCu &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() => 'CopperCu(value: $value, apiId: $apiId, unit: $unit)';

  CopperCu copyWithCopperCu(num? value, int? apiId, String? unit) => CopperCu(
      value: value ?? this.value,
      apiId: apiId ?? this.apiId,
      unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'CopperCu', ...nestedJsonMap(attributes__)};

  factory CopperCu.fromJson(String json) => CopperCu.fromMap(jsonDecode(json));

  factory CopperCu.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return CopperCu(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class Cystine implements Nutrient {
  num value;
  int apiId = 507;
  String unit = 'g';

  // <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  Cystine({
    required this.value,
    this.apiId = 507,
    this.unit = 'g',
  });

  factory Cystine.staticConstructor({
    required value,
    apiId = 507,
    unit = 'g',
  }) =>
      Cystine(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Cystine &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() => 'Cystine(value: $value, apiId: $apiId, unit: $unit)';

  Cystine copyWithCystine(num? value, int? apiId, String? unit) => Cystine(
      value: value ?? this.value,
      apiId: apiId ?? this.apiId,
      unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'Cystine', ...nestedJsonMap(attributes__)};

  factory Cystine.fromJson(String json) => Cystine.fromMap(jsonDecode(json));

  factory Cystine.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return Cystine(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class EnergyJoules implements Nutrient {
  num value;
  int apiId = 268;
  String unit = 'kJ';

  // <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  EnergyJoules({
    required this.value,
    this.apiId = 268,
    this.unit = 'kJ',
  });

  factory EnergyJoules.staticConstructor({
    required value,
    apiId = 268,
    unit = 'kJ',
  }) =>
      EnergyJoules(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EnergyJoules &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() =>
      'EnergyJoules(value: $value, apiId: $apiId, unit: $unit)';

  EnergyJoules copyWithEnergyJoules(num? value, int? apiId, String? unit) =>
      EnergyJoules(
          value: value ?? this.value,
          apiId: apiId ?? this.apiId,
          unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'EnergyJoules', ...nestedJsonMap(attributes__)};

  factory EnergyJoules.fromJson(String json) =>
      EnergyJoules.fromMap(jsonDecode(json));

  factory EnergyJoules.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return EnergyJoules(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class VitaminDRAE implements Nutrient {
  num value;
  int apiId = 325;
  String unit = 'µg';

  // <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  VitaminDRAE({
    required this.value,
    this.apiId = 325,
    this.unit = 'µg',
  });

  factory VitaminDRAE.staticConstructor({
    required value,
    apiId = 325,
    unit = 'µg',
  }) =>
      VitaminDRAE(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is VitaminDRAE &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() => 'VitaminDRAE(value: $value, apiId: $apiId, unit: $unit)';

  VitaminDRAE copyWithVitaminDRAE(num? value, int? apiId, String? unit) =>
      VitaminDRAE(
          value: value ?? this.value,
          apiId: apiId ?? this.apiId,
          unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'VitaminDRAE', ...nestedJsonMap(attributes__)};

  factory VitaminDRAE.fromJson(String json) =>
      VitaminDRAE.fromMap(jsonDecode(json));

  factory VitaminDRAE.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return VitaminDRAE(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class F10D00 implements Nutrient {
  num value;
  int apiId = 610;
  String unit = 'g';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  F10D00({
    required this.value,
    this.apiId = 610,
    this.unit = 'g',
  });

  factory F10D00.staticConstructor({
    required value,
    apiId = 610,
    unit = 'g',
  }) =>
      F10D00(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is F10D00 &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() => 'F10D00(value: $value, apiId: $apiId, unit: $unit)';

  F10D00 copyWithF10D00(num? value, int? apiId, String? unit) => F10D00(
      value: value ?? this.value,
      apiId: apiId ?? this.apiId,
      unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'F10D00', ...nestedJsonMap(attributes__)};

  factory F10D00.fromJson(String json) => F10D00.fromMap(jsonDecode(json));

  factory F10D00.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return F10D00(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class F12D00 implements Nutrient {
  num value;
  int apiId = 611;
  String unit = 'g';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  F12D00({
    required this.value,
    this.apiId = 611,
    this.unit = 'g',
  });

  factory F12D00.staticConstructor({
    required value,
    apiId = 611,
    unit = 'g',
  }) =>
      F12D00(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is F12D00 &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() => 'F12D00(value: $value, apiId: $apiId, unit: $unit)';

  F12D00 copyWithF12D00(num? value, int? apiId, String? unit) => F12D00(
      value: value ?? this.value,
      apiId: apiId ?? this.apiId,
      unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'F12D00', ...nestedJsonMap(attributes__)};

  factory F12D00.fromJson(String json) => F12D00.fromMap(jsonDecode(json));

  factory F12D00.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return F12D00(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class F13D00 implements Nutrient {
  num value;
  int apiId = 696;
  String unit = 'g';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  F13D00({
    required this.value,
    this.apiId = 696,
    this.unit = 'g',
  });

  factory F13D00.staticConstructor({
    required value,
    apiId = 696,
    unit = 'g',
  }) =>
      F13D00(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is F13D00 &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() => 'F13D00(value: $value, apiId: $apiId, unit: $unit)';

  F13D00 copyWithF13D00(num? value, int? apiId, String? unit) => F13D00(
      value: value ?? this.value,
      apiId: apiId ?? this.apiId,
      unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'F13D00', ...nestedJsonMap(attributes__)};

  factory F13D00.fromJson(String json) => F13D00.fromMap(jsonDecode(json));

  factory F13D00.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return F13D00(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class F14D00 implements Nutrient {
  num value;
  int apiId = 612;
  String unit = 'g';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  F14D00({
    required this.value,
    this.apiId = 612,
    this.unit = 'g',
  });

  factory F14D00.staticConstructor({
    required value,
    apiId = 612,
    unit = 'g',
  }) =>
      F14D00(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is F14D00 &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() => 'F14D00(value: $value, apiId: $apiId, unit: $unit)';

  F14D00 copyWithF14D00(num? value, int? apiId, String? unit) => F14D00(
      value: value ?? this.value,
      apiId: apiId ?? this.apiId,
      unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'F14D00', ...nestedJsonMap(attributes__)};

  factory F14D00.fromJson(String json) => F14D00.fromMap(jsonDecode(json));

  factory F14D00.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return F14D00(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class F14D01 implements Nutrient {
  num value;
  int apiId = 625;
  String unit = 'g';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  F14D01({
    required this.value,
    this.apiId = 625,
    this.unit = 'g',
  });

  factory F14D01.staticConstructor({
    required value,
    apiId = 625,
    unit = 'g',
  }) =>
      F14D01(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is F14D01 &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() => 'F14D01(value: $value, apiId: $apiId, unit: $unit)';

  F14D01 copyWithF14D01(num? value, int? apiId, String? unit) => F14D01(
      value: value ?? this.value,
      apiId: apiId ?? this.apiId,
      unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'F14D01', ...nestedJsonMap(attributes__)};

  factory F14D01.fromJson(String json) => F14D01.fromMap(jsonDecode(json));

  factory F14D01.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return F14D01(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class F15D00 implements Nutrient {
  num value;
  int apiId = 652;
  String unit = 'g';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  F15D00({
    required this.value,
    this.apiId = 652,
    this.unit = 'g',
  });

  factory F15D00.staticConstructor({
    required value,
    apiId = 652,
    unit = 'g',
  }) =>
      F15D00(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is F15D00 &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() => 'F15D00(value: $value, apiId: $apiId, unit: $unit)';

  F15D00 copyWithF15D00(num? value, int? apiId, String? unit) => F15D00(
      value: value ?? this.value,
      apiId: apiId ?? this.apiId,
      unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'F15D00', ...nestedJsonMap(attributes__)};

  factory F15D00.fromJson(String json) => F15D00.fromMap(jsonDecode(json));

  factory F15D00.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return F15D00(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class F15D01 implements Nutrient {
  num value;
  int apiId = 697;
  String unit = 'g';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  F15D01({
    required this.value,
    this.apiId = 697,
    this.unit = 'g',
  });

  factory F15D01.staticConstructor({
    required value,
    apiId = 697,
    unit = 'g',
  }) =>
      F15D01(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is F15D01 &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() => 'F15D01(value: $value, apiId: $apiId, unit: $unit)';

  F15D01 copyWithF15D01(num? value, int? apiId, String? unit) => F15D01(
      value: value ?? this.value,
      apiId: apiId ?? this.apiId,
      unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'F15D01', ...nestedJsonMap(attributes__)};

  factory F15D01.fromJson(String json) => F15D01.fromMap(jsonDecode(json));

  factory F15D01.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return F15D01(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class F16D00 implements Nutrient {
  num value;
  int apiId = 613;
  String unit = 'g';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  F16D00({
    required this.value,
    this.apiId = 613,
    this.unit = 'g',
  });

  factory F16D00.staticConstructor({
    required value,
    apiId = 613,
    unit = 'g',
  }) =>
      F16D00(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is F16D00 &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() => 'F16D00(value: $value, apiId: $apiId, unit: $unit)';

  F16D00 copyWithF16D00(num? value, int? apiId, String? unit) => F16D00(
      value: value ?? this.value,
      apiId: apiId ?? this.apiId,
      unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'F16D00', ...nestedJsonMap(attributes__)};

  factory F16D00.fromJson(String json) => F16D00.fromMap(jsonDecode(json));

  factory F16D00.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return F16D00(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class F16D1U implements Nutrient {
  num value;
  int apiId = 626;
  String unit = 'g';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  F16D1U({
    required this.value,
    this.apiId = 626,
    this.unit = 'g',
  });

  factory F16D1U.staticConstructor({
    required value,
    apiId = 626,
    unit = 'g',
  }) =>
      F16D1U(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is F16D1U &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() => 'F16D1U(value: $value, apiId: $apiId, unit: $unit)';

  F16D1U copyWithF16D1U(num? value, int? apiId, String? unit) => F16D1U(
      value: value ?? this.value,
      apiId: apiId ?? this.apiId,
      unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'F16D1U', ...nestedJsonMap(attributes__)};

  factory F16D1U.fromJson(String json) => F16D1U.fromMap(jsonDecode(json));

  factory F16D1U.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return F16D1U(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class F16D1C implements Nutrient {
  num value;
  int apiId = 673;
  String unit = 'g';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  F16D1C({
    required this.value,
    this.apiId = 673,
    this.unit = 'g',
  });

  factory F16D1C.staticConstructor({
    required value,
    apiId = 673,
    unit = 'g',
  }) =>
      F16D1C(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is F16D1C &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() => 'F16D1C(value: $value, apiId: $apiId, unit: $unit)';

  F16D1C copyWithF16D1C(num? value, int? apiId, String? unit) => F16D1C(
      value: value ?? this.value,
      apiId: apiId ?? this.apiId,
      unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'F16D1C', ...nestedJsonMap(attributes__)};

  factory F16D1C.fromJson(String json) => F16D1C.fromMap(jsonDecode(json));

  factory F16D1C.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return F16D1C(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class F16D1T implements Nutrient {
  num value;
  int apiId = 662;
  String unit = 'g';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  F16D1T({
    required this.value,
    this.apiId = 662,
    this.unit = 'g',
  });

  factory F16D1T.staticConstructor({
    required value,
    apiId = 662,
    unit = 'g',
  }) =>
      F16D1T(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is F16D1T &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() => 'F16D1T(value: $value, apiId: $apiId, unit: $unit)';

  F16D1T copyWithF16D1T(num? value, int? apiId, String? unit) => F16D1T(
      value: value ?? this.value,
      apiId: apiId ?? this.apiId,
      unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'F16D1T', ...nestedJsonMap(attributes__)};

  factory F16D1T.fromJson(String json) => F16D1T.fromMap(jsonDecode(json));

  factory F16D1T.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return F16D1T(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class F17D00 implements Nutrient {
  num value;
  int apiId = 653;
  String unit = 'g';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  F17D00({
    required this.value,
    this.apiId = 653,
    this.unit = 'g',
  });

  factory F17D00.staticConstructor({
    required value,
    apiId = 653,
    unit = 'g',
  }) =>
      F17D00(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is F17D00 &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() => 'F17D00(value: $value, apiId: $apiId, unit: $unit)';

  F17D00 copyWithF17D00(num? value, int? apiId, String? unit) => F17D00(
      value: value ?? this.value,
      apiId: apiId ?? this.apiId,
      unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'F17D00', ...nestedJsonMap(attributes__)};

  factory F17D00.fromJson(String json) => F17D00.fromMap(jsonDecode(json));

  factory F17D00.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return F17D00(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class F17D01 implements Nutrient {
  num value;
  int apiId = 687;
  String unit = 'g';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  F17D01({
    required this.value,
    this.apiId = 687,
    this.unit = 'g',
  });

  factory F17D01.staticConstructor({
    required value,
    apiId = 687,
    unit = 'g',
  }) =>
      F17D01(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is F17D01 &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() => 'F17D01(value: $value, apiId: $apiId, unit: $unit)';

  F17D01 copyWithF17D01(num? value, int? apiId, String? unit) => F17D01(
      value: value ?? this.value,
      apiId: apiId ?? this.apiId,
      unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'F17D01', ...nestedJsonMap(attributes__)};

  factory F17D01.fromJson(String json) => F17D01.fromMap(jsonDecode(json));

  factory F17D01.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return F17D01(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class F18D00 implements Nutrient {
  num value;
  int apiId = 614;
  String unit = 'g';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  F18D00({
    required this.value,
    this.apiId = 614,
    this.unit = 'g',
  });

  factory F18D00.staticConstructor({
    required value,
    apiId = 614,
    unit = 'g',
  }) =>
      F18D00(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is F18D00 &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() => 'F18D00(value: $value, apiId: $apiId, unit: $unit)';

  F18D00 copyWithF18D00(num? value, int? apiId, String? unit) => F18D00(
      value: value ?? this.value,
      apiId: apiId ?? this.apiId,
      unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'F18D00', ...nestedJsonMap(attributes__)};

  factory F18D00.fromJson(String json) => F18D00.fromMap(jsonDecode(json));

  factory F18D00.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return F18D00(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class F18D1U implements Nutrient {
  num value;
  int apiId = 617;
  String unit = 'g';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  F18D1U({
    required this.value,
    this.apiId = 617,
    this.unit = 'g',
  });

  factory F18D1U.staticConstructor({
    required value,
    apiId = 617,
    unit = 'g',
  }) =>
      F18D1U(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is F18D1U &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() => 'F18D1U(value: $value, apiId: $apiId, unit: $unit)';

  F18D1U copyWithF18D1U(num? value, int? apiId, String? unit) => F18D1U(
      value: value ?? this.value,
      apiId: apiId ?? this.apiId,
      unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'F18D1U', ...nestedJsonMap(attributes__)};

  factory F18D1U.fromJson(String json) => F18D1U.fromMap(jsonDecode(json));

  factory F18D1U.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return F18D1U(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class F18D1C implements Nutrient {
  num value;
  int apiId = 674;
  String unit = 'g';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  F18D1C({
    required this.value,
    this.apiId = 674,
    this.unit = 'g',
  });

  factory F18D1C.staticConstructor({
    required value,
    apiId = 674,
    unit = 'g',
  }) =>
      F18D1C(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is F18D1C &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() => 'F18D1C(value: $value, apiId: $apiId, unit: $unit)';

  F18D1C copyWithF18D1C(num? value, int? apiId, String? unit) => F18D1C(
      value: value ?? this.value,
      apiId: apiId ?? this.apiId,
      unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'F18D1C', ...nestedJsonMap(attributes__)};

  factory F18D1C.fromJson(String json) => F18D1C.fromMap(jsonDecode(json));

  factory F18D1C.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return F18D1C(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class F18D1T implements Nutrient {
  num value;
  int apiId = 663;
  String unit = 'g';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  F18D1T({
    required this.value,
    this.apiId = 663,
    this.unit = 'g',
  });

  factory F18D1T.staticConstructor({
    required value,
    apiId = 663,
    unit = 'g',
  }) =>
      F18D1T(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is F18D1T &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() => 'F18D1T(value: $value, apiId: $apiId, unit: $unit)';

  F18D1T copyWithF18D1T(num? value, int? apiId, String? unit) => F18D1T(
      value: value ?? this.value,
      apiId: apiId ?? this.apiId,
      unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'F18D1T', ...nestedJsonMap(attributes__)};

  factory F18D1T.fromJson(String json) => F18D1T.fromMap(jsonDecode(json));

  factory F18D1T.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return F18D1T(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class F18D111T implements Nutrient {
  num value;
  int apiId = 859;
  String unit = 'g';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  F18D111T({
    required this.value,
    this.apiId = 859,
    this.unit = 'g',
  });

  factory F18D111T.staticConstructor({
    required value,
    apiId = 859,
    unit = 'g',
  }) =>
      F18D111T(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is F18D111T &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() => 'F18D111T(value: $value, apiId: $apiId, unit: $unit)';

  F18D111T copyWithF18D111T(num? value, int? apiId, String? unit) => F18D111T(
      value: value ?? this.value,
      apiId: apiId ?? this.apiId,
      unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'F18D111T', ...nestedJsonMap(attributes__)};

  factory F18D111T.fromJson(String json) => F18D111T.fromMap(jsonDecode(json));

  factory F18D111T.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return F18D111T(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class F18D2U implements Nutrient {
  num value;
  int apiId = 618;
  String unit = 'g';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  F18D2U({
    required this.value,
    this.apiId = 618,
    this.unit = 'g',
  });

  factory F18D2U.staticConstructor({
    required value,
    apiId = 618,
    unit = 'g',
  }) =>
      F18D2U(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is F18D2U &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() => 'F18D2U(value: $value, apiId: $apiId, unit: $unit)';

  F18D2U copyWithF18D2U(num? value, int? apiId, String? unit) => F18D2U(
      value: value ?? this.value,
      apiId: apiId ?? this.apiId,
      unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'F18D2U', ...nestedJsonMap(attributes__)};

  factory F18D2U.fromJson(String json) => F18D2U.fromMap(jsonDecode(json));

  factory F18D2U.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return F18D2U(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class F18D2CLAs implements Nutrient {
  num value;
  int apiId = 670;
  String unit = 'g';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  F18D2CLAs({
    required this.value,
    this.apiId = 670,
    this.unit = 'g',
  });

  factory F18D2CLAs.staticConstructor({
    required value,
    apiId = 670,
    unit = 'g',
  }) =>
      F18D2CLAs(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is F18D2CLAs &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() => 'F18D2CLAs(value: $value, apiId: $apiId, unit: $unit)';

  F18D2CLAs copyWithF18D2CLAs(num? value, int? apiId, String? unit) =>
      F18D2CLAs(
          value: value ?? this.value,
          apiId: apiId ?? this.apiId,
          unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'F18D2CLAs', ...nestedJsonMap(attributes__)};

  factory F18D2CLAs.fromJson(String json) =>
      F18D2CLAs.fromMap(jsonDecode(json));

  factory F18D2CLAs.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return F18D2CLAs(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class F18D2N6C implements Nutrient {
  num value;
  int apiId = 675;
  String unit = 'g';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  F18D2N6C({
    required this.value,
    this.apiId = 675,
    this.unit = 'g',
  });

  factory F18D2N6C.staticConstructor({
    required value,
    apiId = 675,
    unit = 'g',
  }) =>
      F18D2N6C(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is F18D2N6C &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() => 'F18D2N6C(value: $value, apiId: $apiId, unit: $unit)';

  F18D2N6C copyWithF18D2N6C(num? value, int? apiId, String? unit) => F18D2N6C(
      value: value ?? this.value,
      apiId: apiId ?? this.apiId,
      unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'F18D2N6C', ...nestedJsonMap(attributes__)};

  factory F18D2N6C.fromJson(String json) => F18D2N6C.fromMap(jsonDecode(json));

  factory F18D2N6C.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return F18D2N6C(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class F18D2T implements Nutrient {
  num value;
  int apiId = 669;
  String unit = 'g';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  F18D2T({
    required this.value,
    this.apiId = 669,
    this.unit = 'g',
  });

  factory F18D2T.staticConstructor({
    required value,
    apiId = 669,
    unit = 'g',
  }) =>
      F18D2T(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is F18D2T &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() => 'F18D2T(value: $value, apiId: $apiId, unit: $unit)';

  F18D2T copyWithF18D2T(num? value, int? apiId, String? unit) => F18D2T(
      value: value ?? this.value,
      apiId: apiId ?? this.apiId,
      unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'F18D2T', ...nestedJsonMap(attributes__)};

  factory F18D2T.fromJson(String json) => F18D2T.fromMap(jsonDecode(json));

  factory F18D2T.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return F18D2T(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class F18D3U implements Nutrient {
  num value;
  int apiId = 619;
  String unit = 'g';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  F18D3U({
    required this.value,
    this.apiId = 619,
    this.unit = 'g',
  });

  factory F18D3U.staticConstructor({
    required value,
    apiId = 619,
    unit = 'g',
  }) =>
      F18D3U(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is F18D3U &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() => 'F18D3U(value: $value, apiId: $apiId, unit: $unit)';

  F18D3U copyWithF18D3U(num? value, int? apiId, String? unit) => F18D3U(
      value: value ?? this.value,
      apiId: apiId ?? this.apiId,
      unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'F18D3U', ...nestedJsonMap(attributes__)};

  factory F18D3U.fromJson(String json) => F18D3U.fromMap(jsonDecode(json));

  factory F18D3U.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return F18D3U(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class F18D3N3C implements Nutrient {
  num value;
  int apiId = 851;
  String unit = 'g';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  F18D3N3C({
    required this.value,
    this.apiId = 851,
    this.unit = 'g',
  });

  factory F18D3N3C.staticConstructor({
    required value,
    apiId = 851,
    unit = 'g',
  }) =>
      F18D3N3C(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is F18D3N3C &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() => 'F18D3N3C(value: $value, apiId: $apiId, unit: $unit)';

  F18D3N3C copyWithF18D3N3C(num? value, int? apiId, String? unit) => F18D3N3C(
      value: value ?? this.value,
      apiId: apiId ?? this.apiId,
      unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'F18D3N3C', ...nestedJsonMap(attributes__)};

  factory F18D3N3C.fromJson(String json) => F18D3N3C.fromMap(jsonDecode(json));

  factory F18D3N3C.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return F18D3N3C(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class F18D3N6C implements Nutrient {
  num value;
  int apiId = 685;
  String unit = 'g';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  F18D3N6C({
    required this.value,
    this.apiId = 685,
    this.unit = 'g',
  });

  factory F18D3N6C.staticConstructor({
    required value,
    apiId = 685,
    unit = 'g',
  }) =>
      F18D3N6C(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is F18D3N6C &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() => 'F18D3N6C(value: $value, apiId: $apiId, unit: $unit)';

  F18D3N6C copyWithF18D3N6C(num? value, int? apiId, String? unit) => F18D3N6C(
      value: value ?? this.value,
      apiId: apiId ?? this.apiId,
      unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'F18D3N6C', ...nestedJsonMap(attributes__)};

  factory F18D3N6C.fromJson(String json) => F18D3N6C.fromMap(jsonDecode(json));

  factory F18D3N6C.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return F18D3N6C(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class F18D04 implements Nutrient {
  num value;
  int apiId = 627;
  String unit = 'g';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  F18D04({
    required this.value,
    this.apiId = 627,
    this.unit = 'g',
  });

  factory F18D04.staticConstructor({
    required value,
    apiId = 627,
    unit = 'g',
  }) =>
      F18D04(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is F18D04 &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() => 'F18D04(value: $value, apiId: $apiId, unit: $unit)';

  F18D04 copyWithF18D04(num? value, int? apiId, String? unit) => F18D04(
      value: value ?? this.value,
      apiId: apiId ?? this.apiId,
      unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'F18D04', ...nestedJsonMap(attributes__)};

  factory F18D04.fromJson(String json) => F18D04.fromMap(jsonDecode(json));

  factory F18D04.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return F18D04(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class F20D00 implements Nutrient {
  num value;
  int apiId = 615;
  String unit = 'g';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  F20D00({
    required this.value,
    this.apiId = 615,
    this.unit = 'g',
  });

  factory F20D00.staticConstructor({
    required value,
    apiId = 615,
    unit = 'g',
  }) =>
      F20D00(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is F20D00 &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() => 'F20D00(value: $value, apiId: $apiId, unit: $unit)';

  F20D00 copyWithF20D00(num? value, int? apiId, String? unit) => F20D00(
      value: value ?? this.value,
      apiId: apiId ?? this.apiId,
      unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'F20D00', ...nestedJsonMap(attributes__)};

  factory F20D00.fromJson(String json) => F20D00.fromMap(jsonDecode(json));

  factory F20D00.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return F20D00(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class F20D01 implements Nutrient {
  num value;
  int apiId = 628;
  String unit = 'g';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  F20D01({
    required this.value,
    this.apiId = 628,
    this.unit = 'g',
  });

  factory F20D01.staticConstructor({
    required value,
    apiId = 628,
    unit = 'g',
  }) =>
      F20D01(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is F20D01 &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() => 'F20D01(value: $value, apiId: $apiId, unit: $unit)';

  F20D01 copyWithF20D01(num? value, int? apiId, String? unit) => F20D01(
      value: value ?? this.value,
      apiId: apiId ?? this.apiId,
      unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'F20D01', ...nestedJsonMap(attributes__)};

  factory F20D01.fromJson(String json) => F20D01.fromMap(jsonDecode(json));

  factory F20D01.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return F20D01(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class F20D2N6C implements Nutrient {
  num value;
  int apiId = 672;
  String unit = 'g';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  F20D2N6C({
    required this.value,
    this.apiId = 672,
    this.unit = 'g',
  });

  factory F20D2N6C.staticConstructor({
    required value,
    apiId = 672,
    unit = 'g',
  }) =>
      F20D2N6C(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is F20D2N6C &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() => 'F20D2N6C(value: $value, apiId: $apiId, unit: $unit)';

  F20D2N6C copyWithF20D2N6C(num? value, int? apiId, String? unit) => F20D2N6C(
      value: value ?? this.value,
      apiId: apiId ?? this.apiId,
      unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'F20D2N6C', ...nestedJsonMap(attributes__)};

  factory F20D2N6C.fromJson(String json) => F20D2N6C.fromMap(jsonDecode(json));

  factory F20D2N6C.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return F20D2N6C(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class F20D3U implements Nutrient {
  num value;
  int apiId = 689;
  String unit = 'g';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  F20D3U({
    required this.value,
    this.apiId = 689,
    this.unit = 'g',
  });

  factory F20D3U.staticConstructor({
    required value,
    apiId = 689,
    unit = 'g',
  }) =>
      F20D3U(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is F20D3U &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() => 'F20D3U(value: $value, apiId: $apiId, unit: $unit)';

  F20D3U copyWithF20D3U(num? value, int? apiId, String? unit) => F20D3U(
      value: value ?? this.value,
      apiId: apiId ?? this.apiId,
      unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'F20D3U', ...nestedJsonMap(attributes__)};

  factory F20D3U.fromJson(String json) => F20D3U.fromMap(jsonDecode(json));

  factory F20D3U.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return F20D3U(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class F20D3N3 implements Nutrient {
  num value;
  int apiId = 852;
  String unit = 'g';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  F20D3N3({
    required this.value,
    this.apiId = 852,
    this.unit = 'g',
  });

  factory F20D3N3.staticConstructor({
    required value,
    apiId = 852,
    unit = 'g',
  }) =>
      F20D3N3(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is F20D3N3 &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() => 'F20D3N3(value: $value, apiId: $apiId, unit: $unit)';

  F20D3N3 copyWithF20D3N3(num? value, int? apiId, String? unit) => F20D3N3(
      value: value ?? this.value,
      apiId: apiId ?? this.apiId,
      unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'F20D3N3', ...nestedJsonMap(attributes__)};

  factory F20D3N3.fromJson(String json) => F20D3N3.fromMap(jsonDecode(json));

  factory F20D3N3.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return F20D3N3(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class F20D3N6 implements Nutrient {
  num value;
  int apiId = 853;
  String unit = 'g';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  F20D3N6({
    required this.value,
    this.apiId = 853,
    this.unit = 'g',
  });

  factory F20D3N6.staticConstructor({
    required value,
    apiId = 853,
    unit = 'g',
  }) =>
      F20D3N6(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is F20D3N6 &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() => 'F20D3N6(value: $value, apiId: $apiId, unit: $unit)';

  F20D3N6 copyWithF20D3N6(num? value, int? apiId, String? unit) => F20D3N6(
      value: value ?? this.value,
      apiId: apiId ?? this.apiId,
      unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'F20D3N6', ...nestedJsonMap(attributes__)};

  factory F20D3N6.fromJson(String json) => F20D3N6.fromMap(jsonDecode(json));

  factory F20D3N6.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return F20D3N6(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class F20D4U implements Nutrient {
  num value;
  int apiId = 620;
  String unit = 'g';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  F20D4U({
    required this.value,
    this.apiId = 620,
    this.unit = 'g',
  });

  factory F20D4U.staticConstructor({
    required value,
    apiId = 620,
    unit = 'g',
  }) =>
      F20D4U(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is F20D4U &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() => 'F20D4U(value: $value, apiId: $apiId, unit: $unit)';

  F20D4U copyWithF20D4U(num? value, int? apiId, String? unit) => F20D4U(
      value: value ?? this.value,
      apiId: apiId ?? this.apiId,
      unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'F20D4U', ...nestedJsonMap(attributes__)};

  factory F20D4U.fromJson(String json) => F20D4U.fromMap(jsonDecode(json));

  factory F20D4U.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return F20D4U(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class F20D4N6 implements Nutrient {
  num value;
  int apiId = 855;
  String unit = 'g';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  F20D4N6({
    required this.value,
    this.apiId = 855,
    this.unit = 'g',
  });

  factory F20D4N6.staticConstructor({
    required value,
    apiId = 855,
    unit = 'g',
  }) =>
      F20D4N6(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is F20D4N6 &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() => 'F20D4N6(value: $value, apiId: $apiId, unit: $unit)';

  F20D4N6 copyWithF20D4N6(num? value, int? apiId, String? unit) => F20D4N6(
      value: value ?? this.value,
      apiId: apiId ?? this.apiId,
      unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'F20D4N6', ...nestedJsonMap(attributes__)};

  factory F20D4N6.fromJson(String json) => F20D4N6.fromMap(jsonDecode(json));

  factory F20D4N6.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return F20D4N6(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class F20D5N3 implements Nutrient {
  num value;
  int apiId = 629;
  String unit = 'g';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  F20D5N3({
    required this.value,
    this.apiId = 629,
    this.unit = 'g',
  });

  factory F20D5N3.staticConstructor({
    required value,
    apiId = 629,
    unit = 'g',
  }) =>
      F20D5N3(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is F20D5N3 &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() => 'F20D5N3(value: $value, apiId: $apiId, unit: $unit)';

  F20D5N3 copyWithF20D5N3(num? value, int? apiId, String? unit) => F20D5N3(
      value: value ?? this.value,
      apiId: apiId ?? this.apiId,
      unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'F20D5N3', ...nestedJsonMap(attributes__)};

  factory F20D5N3.fromJson(String json) => F20D5N3.fromMap(jsonDecode(json));

  factory F20D5N3.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return F20D5N3(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class F21D05 implements Nutrient {
  num value;
  int apiId = 857;
  String unit = 'g';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  F21D05({
    required this.value,
    this.apiId = 857,
    this.unit = 'g',
  });

  factory F21D05.staticConstructor({
    required value,
    apiId = 857,
    unit = 'g',
  }) =>
      F21D05(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is F21D05 &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() => 'F21D05(value: $value, apiId: $apiId, unit: $unit)';

  F21D05 copyWithF21D05(num? value, int? apiId, String? unit) => F21D05(
      value: value ?? this.value,
      apiId: apiId ?? this.apiId,
      unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'F21D05', ...nestedJsonMap(attributes__)};

  factory F21D05.fromJson(String json) => F21D05.fromMap(jsonDecode(json));

  factory F21D05.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return F21D05(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class F22D00 implements Nutrient {
  num value;
  int apiId = 624;
  String unit = 'g';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  F22D00({
    required this.value,
    this.apiId = 624,
    this.unit = 'g',
  });

  factory F22D00.staticConstructor({
    required value,
    apiId = 624,
    unit = 'g',
  }) =>
      F22D00(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is F22D00 &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() => 'F22D00(value: $value, apiId: $apiId, unit: $unit)';

  F22D00 copyWithF22D00(num? value, int? apiId, String? unit) => F22D00(
      value: value ?? this.value,
      apiId: apiId ?? this.apiId,
      unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'F22D00', ...nestedJsonMap(attributes__)};

  factory F22D00.fromJson(String json) => F22D00.fromMap(jsonDecode(json));

  factory F22D00.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return F22D00(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class F22D1U implements Nutrient {
  num value;
  int apiId = 630;
  String unit = 'g';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  F22D1U({
    required this.value,
    this.apiId = 630,
    this.unit = 'g',
  });

  factory F22D1U.staticConstructor({
    required value,
    apiId = 630,
    unit = 'g',
  }) =>
      F22D1U(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is F22D1U &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() => 'F22D1U(value: $value, apiId: $apiId, unit: $unit)';

  F22D1U copyWithF22D1U(num? value, int? apiId, String? unit) => F22D1U(
      value: value ?? this.value,
      apiId: apiId ?? this.apiId,
      unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'F22D1U', ...nestedJsonMap(attributes__)};

  factory F22D1U.fromJson(String json) => F22D1U.fromMap(jsonDecode(json));

  factory F22D1U.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return F22D1U(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class F22D04 implements Nutrient {
  num value;
  int apiId = 858;
  String unit = 'g';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  F22D04({
    required this.value,
    this.apiId = 858,
    this.unit = 'g',
  });

  factory F22D04.staticConstructor({
    required value,
    apiId = 858,
    unit = 'g',
  }) =>
      F22D04(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is F22D04 &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() => 'F22D04(value: $value, apiId: $apiId, unit: $unit)';

  F22D04 copyWithF22D04(num? value, int? apiId, String? unit) => F22D04(
      value: value ?? this.value,
      apiId: apiId ?? this.apiId,
      unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'F22D04', ...nestedJsonMap(attributes__)};

  factory F22D04.fromJson(String json) => F22D04.fromMap(jsonDecode(json));

  factory F22D04.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return F22D04(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class F22D5N3 implements Nutrient {
  num value;
  int apiId = 631;
  String unit = 'g';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  F22D5N3({
    required this.value,
    this.apiId = 631,
    this.unit = 'g',
  });

  factory F22D5N3.staticConstructor({
    required value,
    apiId = 631,
    unit = 'g',
  }) =>
      F22D5N3(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is F22D5N3 &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() => 'F22D5N3(value: $value, apiId: $apiId, unit: $unit)';

  F22D5N3 copyWithF22D5N3(num? value, int? apiId, String? unit) => F22D5N3(
      value: value ?? this.value,
      apiId: apiId ?? this.apiId,
      unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'F22D5N3', ...nestedJsonMap(attributes__)};

  factory F22D5N3.fromJson(String json) => F22D5N3.fromMap(jsonDecode(json));

  factory F22D5N3.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return F22D5N3(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class F22D6N3 implements Nutrient {
  num value;
  int apiId = 621;
  String unit = 'g';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  F22D6N3({
    required this.value,
    this.apiId = 621,
    this.unit = 'g',
  });

  factory F22D6N3.staticConstructor({
    required value,
    apiId = 621,
    unit = 'g',
  }) =>
      F22D6N3(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is F22D6N3 &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() => 'F22D6N3(value: $value, apiId: $apiId, unit: $unit)';

  F22D6N3 copyWithF22D6N3(num? value, int? apiId, String? unit) => F22D6N3(
      value: value ?? this.value,
      apiId: apiId ?? this.apiId,
      unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'F22D6N3', ...nestedJsonMap(attributes__)};

  factory F22D6N3.fromJson(String json) => F22D6N3.fromMap(jsonDecode(json));

  factory F22D6N3.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return F22D6N3(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class F24D0000 implements Nutrient {
  num value;
  int apiId = 654;
  String unit = 'g';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  F24D0000({
    required this.value,
    this.apiId = 654,
    this.unit = 'g',
  });

  factory F24D0000.staticConstructor({
    required value,
    apiId = 654,
    unit = 'g',
  }) =>
      F24D0000(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is F24D0000 &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() => 'F24D0000(value: $value, apiId: $apiId, unit: $unit)';

  F24D0000 copyWithF24D0000(num? value, int? apiId, String? unit) => F24D0000(
      value: value ?? this.value,
      apiId: apiId ?? this.apiId,
      unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'F24D0000', ...nestedJsonMap(attributes__)};

  factory F24D0000.fromJson(String json) => F24D0000.fromMap(jsonDecode(json));

  factory F24D0000.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return F24D0000(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class F24D1C implements Nutrient {
  num value;
  int apiId = 671;
  String unit = 'g';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  F24D1C({
    required this.value,
    this.apiId = 671,
    this.unit = 'g',
  });

  factory F24D1C.staticConstructor({
    required value,
    apiId = 671,
    unit = 'g',
  }) =>
      F24D1C(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is F24D1C &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() => 'F24D1C(value: $value, apiId: $apiId, unit: $unit)';

  F24D1C copyWithF24D1C(num? value, int? apiId, String? unit) => F24D1C(
      value: value ?? this.value,
      apiId: apiId ?? this.apiId,
      unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'F24D1C', ...nestedJsonMap(attributes__)};

  factory F24D1C.fromJson(String json) => F24D1C.fromMap(jsonDecode(json));

  factory F24D1C.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return F24D1C(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class F4D00 implements Nutrient {
  num value;
  int apiId = 607;
  String unit = 'g';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  F4D00({
    required this.value,
    this.apiId = 607,
    this.unit = 'g',
  });

  factory F4D00.staticConstructor({
    required value,
    apiId = 607,
    unit = 'g',
  }) =>
      F4D00(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is F4D00 &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() => 'F4D00(value: $value, apiId: $apiId, unit: $unit)';

  F4D00 copyWithF4D00(num? value, int? apiId, String? unit) => F4D00(
      value: value ?? this.value,
      apiId: apiId ?? this.apiId,
      unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'F4D00', ...nestedJsonMap(attributes__)};

  factory F4D00.fromJson(String json) => F4D00.fromMap(jsonDecode(json));

  factory F4D00.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return F4D00(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class F6D00 implements Nutrient {
  num value;
  int apiId = 608;
  String unit = 'g';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  F6D00({
    required this.value,
    this.apiId = 608,
    this.unit = 'g',
  });

  factory F6D00.staticConstructor({
    required value,
    apiId = 608,
    unit = 'g',
  }) =>
      F6D00(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is F6D00 &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() => 'F6D00(value: $value, apiId: $apiId, unit: $unit)';

  F6D00 copyWithF6D00(num? value, int? apiId, String? unit) => F6D00(
      value: value ?? this.value,
      apiId: apiId ?? this.apiId,
      unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'F6D00', ...nestedJsonMap(attributes__)};

  factory F6D00.fromJson(String json) => F6D00.fromMap(jsonDecode(json));

  factory F6D00.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return F6D00(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class F8D00 implements Nutrient {
  num value;
  int apiId = 609;
  String unit = 'g';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  F8D00({
    required this.value,
    this.apiId = 609,
    this.unit = 'g',
  });

  factory F8D00.staticConstructor({
    required value,
    apiId = 609,
    unit = 'g',
  }) =>
      F8D00(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is F8D00 &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() => 'F8D00(value: $value, apiId: $apiId, unit: $unit)';

  F8D00 copyWithF8D00(num? value, int? apiId, String? unit) => F8D00(
      value: value ?? this.value,
      apiId: apiId ?? this.apiId,
      unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'F8D00', ...nestedJsonMap(attributes__)};

  factory F8D00.fromJson(String json) => F8D00.fromMap(jsonDecode(json));

  factory F8D00.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return F8D00(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class UnsaturatedFat implements Nutrient {
  num value;
  int apiId = 645;
  String unit = 'g';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  UnsaturatedFat({
    required this.value,
    this.apiId = 645,
    this.unit = 'g',
  });

  factory UnsaturatedFat.staticConstructor({
    required value,
    apiId = 645,
    unit = 'g',
  }) =>
      UnsaturatedFat(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UnsaturatedFat &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() =>
      'UnsaturatedFat(value: $value, apiId: $apiId, unit: $unit)';

  UnsaturatedFat copyWithUnsaturatedFat(num? value, int? apiId, String? unit) =>
      UnsaturatedFat(
          value: value ?? this.value,
          apiId: apiId ?? this.apiId,
          unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'UnsaturatedFat', ...nestedJsonMap(attributes__)};

  factory UnsaturatedFat.fromJson(String json) =>
      UnsaturatedFat.fromMap(jsonDecode(json));

  factory UnsaturatedFat.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return UnsaturatedFat(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class PolyunsaturatedFat implements Nutrient {
  num value;
  int apiId = 646;
  String unit = 'g';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  PolyunsaturatedFat({
    required this.value,
    this.apiId = 646,
    this.unit = 'g',
  });

  factory PolyunsaturatedFat.staticConstructor({
    required value,
    apiId = 646,
    unit = 'g',
  }) =>
      PolyunsaturatedFat(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PolyunsaturatedFat &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() =>
      'PolyunsaturatedFat(value: $value, apiId: $apiId, unit: $unit)';

  PolyunsaturatedFat copyWithPolyunsaturatedFat(
          num? value, int? apiId, String? unit) =>
      PolyunsaturatedFat(
          value: value ?? this.value,
          apiId: apiId ?? this.apiId,
          unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'PolyunsaturatedFat', ...nestedJsonMap(attributes__)};

  factory PolyunsaturatedFat.fromJson(String json) =>
      PolyunsaturatedFat.fromMap(jsonDecode(json));

  factory PolyunsaturatedFat.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return PolyunsaturatedFat(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class TransMonoFat implements Nutrient {
  num value;
  int apiId = 693;
  String unit = 'g';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  TransMonoFat({
    required this.value,
    this.apiId = 693,
    this.unit = 'g',
  });

  factory TransMonoFat.staticConstructor({
    required value,
    apiId = 693,
    unit = 'g',
  }) =>
      TransMonoFat(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TransMonoFat &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() =>
      'TransMonoFat(value: $value, apiId: $apiId, unit: $unit)';

  TransMonoFat copyWithTransMonoFat(num? value, int? apiId, String? unit) =>
      TransMonoFat(
          value: value ?? this.value,
          apiId: apiId ?? this.apiId,
          unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'TransMonoFat', ...nestedJsonMap(attributes__)};

  factory TransMonoFat.fromJson(String json) =>
      TransMonoFat.fromMap(jsonDecode(json));

  factory TransMonoFat.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return TransMonoFat(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class TransPolyeonicFat implements Nutrient {
  num value;
  int apiId = 695;
  String unit = 'g';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  TransPolyeonicFat({
    required this.value,
    this.apiId = 695,
    this.unit = 'g',
  });

  factory TransPolyeonicFat.staticConstructor({
    required value,
    apiId = 695,
    unit = 'g',
  }) =>
      TransPolyeonicFat(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TransPolyeonicFat &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() =>
      'TransPolyeonicFat(value: $value, apiId: $apiId, unit: $unit)';

  TransPolyeonicFat copyWithTransPolyeonicFat(
          num? value, int? apiId, String? unit) =>
      TransPolyeonicFat(
          value: value ?? this.value,
          apiId: apiId ?? this.apiId,
          unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'TransPolyeonicFat', ...nestedJsonMap(attributes__)};

  factory TransPolyeonicFat.fromJson(String json) =>
      TransPolyeonicFat.fromMap(jsonDecode(json));

  factory TransPolyeonicFat.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return TransPolyeonicFat(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class Fluoride implements Nutrient {
  num value;
  int apiId = 313;
  String unit = 'µg';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  Fluoride({
    required this.value,
    this.apiId = 313,
    this.unit = 'µg',
  });

  factory Fluoride.staticConstructor({
    required value,
    apiId = 313,
    unit = 'µg',
  }) =>
      Fluoride(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Fluoride &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() => 'Fluoride(value: $value, apiId: $apiId, unit: $unit)';

  Fluoride copyWithFluoride(num? value, int? apiId, String? unit) => Fluoride(
      value: value ?? this.value,
      apiId: apiId ?? this.apiId,
      unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'Fluoride', ...nestedJsonMap(attributes__)};

  factory Fluoride.fromJson(String json) => Fluoride.fromMap(jsonDecode(json));

  factory Fluoride.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return Fluoride(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class FolateTotal implements Nutrient {
  num value;
  int apiId = 417;
  String unit = 'µg';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  FolateTotal({
    required this.value,
    this.apiId = 417,
    this.unit = 'µg',
  });

  factory FolateTotal.staticConstructor({
    required value,
    apiId = 417,
    unit = 'µg',
  }) =>
      FolateTotal(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FolateTotal &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() => 'FolateTotal(value: $value, apiId: $apiId, unit: $unit)';

  FolateTotal copyWithFolateTotal(num? value, int? apiId, String? unit) =>
      FolateTotal(
          value: value ?? this.value,
          apiId: apiId ?? this.apiId,
          unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'FolateTotal', ...nestedJsonMap(attributes__)};

  factory FolateTotal.fromJson(String json) =>
      FolateTotal.fromMap(jsonDecode(json));

  factory FolateTotal.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return FolateTotal(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class FolicAcid implements Nutrient {
  num value;
  int apiId = 431;
  String unit = 'µg';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  FolicAcid({
    required this.value,
    this.apiId = 431,
    this.unit = 'µg',
  });

  factory FolicAcid.staticConstructor({
    required value,
    apiId = 431,
    unit = 'µg',
  }) =>
      FolicAcid(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FolicAcid &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() => 'FolicAcid(value: $value, apiId: $apiId, unit: $unit)';

  FolicAcid copyWithFolicAcid(num? value, int? apiId, String? unit) =>
      FolicAcid(
          value: value ?? this.value,
          apiId: apiId ?? this.apiId,
          unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'FolicAcid', ...nestedJsonMap(attributes__)};

  factory FolicAcid.fromJson(String json) =>
      FolicAcid.fromMap(jsonDecode(json));

  factory FolicAcid.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return FolicAcid(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class FolateDFE implements Nutrient {
  num value;
  int apiId = 435;
  String unit = 'µg';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  FolateDFE({
    required this.value,
    this.apiId = 435,
    this.unit = 'µg',
  });

  factory FolateDFE.staticConstructor({
    required value,
    apiId = 435,
    unit = 'µg',
  }) =>
      FolateDFE(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FolateDFE &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() => 'FolateDFE(value: $value, apiId: $apiId, unit: $unit)';

  FolateDFE copyWithFolateDFE(num? value, int? apiId, String? unit) =>
      FolateDFE(
          value: value ?? this.value,
          apiId: apiId ?? this.apiId,
          unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'FolateDFE', ...nestedJsonMap(attributes__)};

  factory FolateDFE.fromJson(String json) =>
      FolateDFE.fromMap(jsonDecode(json));

  factory FolateDFE.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return FolateDFE(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class FolateFood implements Nutrient {
  num value;
  int apiId = 432;
  String unit = 'µg';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  FolateFood({
    required this.value,
    this.apiId = 432,
    this.unit = 'µg',
  });

  factory FolateFood.staticConstructor({
    required value,
    apiId = 432,
    unit = 'µg',
  }) =>
      FolateFood(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FolateFood &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() => 'FolateFood(value: $value, apiId: $apiId, unit: $unit)';

  FolateFood copyWithFolateFood(num? value, int? apiId, String? unit) =>
      FolateFood(
          value: value ?? this.value,
          apiId: apiId ?? this.apiId,
          unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'FolateFood', ...nestedJsonMap(attributes__)};

  factory FolateFood.fromJson(String json) =>
      FolateFood.fromMap(jsonDecode(json));

  factory FolateFood.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return FolateFood(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class Fructose implements Nutrient {
  num value;
  int apiId = 212;
  String unit = 'g';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  Fructose({
    required this.value,
    this.apiId = 212,
    this.unit = 'g',
  });

  factory Fructose.staticConstructor({
    required value,
    apiId = 212,
    unit = 'g',
  }) =>
      Fructose(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Fructose &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() => 'Fructose(value: $value, apiId: $apiId, unit: $unit)';

  Fructose copyWithFructose(num? value, int? apiId, String? unit) => Fructose(
      value: value ?? this.value,
      apiId: apiId ?? this.apiId,
      unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'Fructose', ...nestedJsonMap(attributes__)};

  factory Fructose.fromJson(String json) => Fructose.fromMap(jsonDecode(json));

  factory Fructose.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return Fructose(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class Galactose implements Nutrient {
  num value;
  int apiId = 287;
  String unit = 'g';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  Galactose({
    required this.value,
    this.apiId = 287,
    this.unit = 'g',
  });

  factory Galactose.staticConstructor({
    required value,
    apiId = 287,
    unit = 'g',
  }) =>
      Galactose(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Galactose &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() => 'Galactose(value: $value, apiId: $apiId, unit: $unit)';

  Galactose copyWithGalactose(num? value, int? apiId, String? unit) =>
      Galactose(
          value: value ?? this.value,
          apiId: apiId ?? this.apiId,
          unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'Galactose', ...nestedJsonMap(attributes__)};

  factory Galactose.fromJson(String json) =>
      Galactose.fromMap(jsonDecode(json));

  factory Galactose.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return Galactose(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class GlutamicAcid implements Nutrient {
  num value;
  int apiId = 515;
  String unit = 'g';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  GlutamicAcid({
    required this.value,
    this.apiId = 515,
    this.unit = 'g',
  });

  factory GlutamicAcid.staticConstructor({
    required value,
    apiId = 515,
    unit = 'g',
  }) =>
      GlutamicAcid(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GlutamicAcid &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() =>
      'GlutamicAcid(value: $value, apiId: $apiId, unit: $unit)';

  GlutamicAcid copyWithGlutamicAcid(num? value, int? apiId, String? unit) =>
      GlutamicAcid(
          value: value ?? this.value,
          apiId: apiId ?? this.apiId,
          unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'GlutamicAcid', ...nestedJsonMap(attributes__)};

  factory GlutamicAcid.fromJson(String json) =>
      GlutamicAcid.fromMap(jsonDecode(json));

  factory GlutamicAcid.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return GlutamicAcid(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class Glucose implements Nutrient {
  num value;
  int apiId = 211;
  String unit = 'g';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  Glucose({
    required this.value,
    this.apiId = 211,
    this.unit = 'g',
  });

  factory Glucose.staticConstructor({
    required value,
    apiId = 211,
    unit = 'g',
  }) =>
      Glucose(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Glucose &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() => 'Glucose(value: $value, apiId: $apiId, unit: $unit)';

  Glucose copyWithGlucose(num? value, int? apiId, String? unit) => Glucose(
      value: value ?? this.value,
      apiId: apiId ?? this.apiId,
      unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'Glucose', ...nestedJsonMap(attributes__)};

  factory Glucose.fromJson(String json) => Glucose.fromMap(jsonDecode(json));

  factory Glucose.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return Glucose(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class Glycine implements Nutrient {
  num value;
  int apiId = 516;
  String unit = 'g';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  Glycine({
    required this.value,
    this.apiId = 516,
    this.unit = 'g',
  });

  factory Glycine.staticConstructor({
    required value,
    apiId = 516,
    unit = 'g',
  }) =>
      Glycine(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Glycine &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() => 'Glycine(value: $value, apiId: $apiId, unit: $unit)';

  Glycine copyWithGlycine(num? value, int? apiId, String? unit) => Glycine(
      value: value ?? this.value,
      apiId: apiId ?? this.apiId,
      unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'Glycine', ...nestedJsonMap(attributes__)};

  factory Glycine.fromJson(String json) => Glycine.fromMap(jsonDecode(json));

  factory Glycine.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return Glycine(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class Histidine implements Nutrient {
  num value;
  int apiId = 512;
  String unit = 'g';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  Histidine({
    required this.value,
    this.apiId = 512,
    this.unit = 'g',
  });

  factory Histidine.staticConstructor({
    required value,
    apiId = 512,
    unit = 'g',
  }) =>
      Histidine(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Histidine &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() => 'Histidine(value: $value, apiId: $apiId, unit: $unit)';

  Histidine copyWithHistidine(num? value, int? apiId, String? unit) =>
      Histidine(
          value: value ?? this.value,
          apiId: apiId ?? this.apiId,
          unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'Histidine', ...nestedJsonMap(attributes__)};

  factory Histidine.fromJson(String json) =>
      Histidine.fromMap(jsonDecode(json));

  factory Histidine.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return Histidine(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class Hydroxyproline implements Nutrient {
  num value;
  int apiId = 521;
  String unit = 'g';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  Hydroxyproline({
    required this.value,
    this.apiId = 521,
    this.unit = 'g',
  });

  factory Hydroxyproline.staticConstructor({
    required value,
    apiId = 521,
    unit = 'g',
  }) =>
      Hydroxyproline(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Hydroxyproline &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() =>
      'Hydroxyproline(value: $value, apiId: $apiId, unit: $unit)';

  Hydroxyproline copyWithHydroxyproline(num? value, int? apiId, String? unit) =>
      Hydroxyproline(
          value: value ?? this.value,
          apiId: apiId ?? this.apiId,
          unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'Hydroxyproline', ...nestedJsonMap(attributes__)};

  factory Hydroxyproline.fromJson(String json) =>
      Hydroxyproline.fromMap(jsonDecode(json));

  factory Hydroxyproline.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return Hydroxyproline(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class Isoleucine implements Nutrient {
  num value;
  int apiId = 503;
  String unit = 'g';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  Isoleucine({
    required this.value,
    this.apiId = 503,
    this.unit = 'g',
  });

  factory Isoleucine.staticConstructor({
    required value,
    apiId = 503,
    unit = 'g',
  }) =>
      Isoleucine(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Isoleucine &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() => 'Isoleucine(value: $value, apiId: $apiId, unit: $unit)';

  Isoleucine copyWithIsoleucine(num? value, int? apiId, String? unit) =>
      Isoleucine(
          value: value ?? this.value,
          apiId: apiId ?? this.apiId,
          unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'Isoleucine', ...nestedJsonMap(attributes__)};

  factory Isoleucine.fromJson(String json) =>
      Isoleucine.fromMap(jsonDecode(json));

  factory Isoleucine.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return Isoleucine(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class Lactose implements Nutrient {
  num value;
  int apiId = 213;
  String unit = 'g';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  Lactose({
    required this.value,
    this.apiId = 213,
    this.unit = 'g',
  });

  factory Lactose.staticConstructor({
    required value,
    apiId = 213,
    unit = 'g',
  }) =>
      Lactose(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Lactose &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() => 'Lactose(value: $value, apiId: $apiId, unit: $unit)';

  Lactose copyWithLactose(num? value, int? apiId, String? unit) => Lactose(
      value: value ?? this.value,
      apiId: apiId ?? this.apiId,
      unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'Lactose', ...nestedJsonMap(attributes__)};

  factory Lactose.fromJson(String json) => Lactose.fromMap(jsonDecode(json));

  factory Lactose.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return Lactose(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class Leucine implements Nutrient {
  num value;
  int apiId = 504;
  String unit = 'g';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  Leucine({
    required this.value,
    this.apiId = 504,
    this.unit = 'g',
  });

  factory Leucine.staticConstructor({
    required value,
    apiId = 504,
    unit = 'g',
  }) =>
      Leucine(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Leucine &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() => 'Leucine(value: $value, apiId: $apiId, unit: $unit)';

  Leucine copyWithLeucine(num? value, int? apiId, String? unit) => Leucine(
      value: value ?? this.value,
      apiId: apiId ?? this.apiId,
      unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'Leucine', ...nestedJsonMap(attributes__)};

  factory Leucine.fromJson(String json) => Leucine.fromMap(jsonDecode(json));

  factory Leucine.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return Leucine(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class LuteinZeaxanthin implements Nutrient {
  num value;
  int apiId = 338;
  String unit = 'µg';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  LuteinZeaxanthin({
    required this.value,
    this.apiId = 338,
    this.unit = 'µg',
  });

  factory LuteinZeaxanthin.staticConstructor({
    required value,
    apiId = 338,
    unit = 'µg',
  }) =>
      LuteinZeaxanthin(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LuteinZeaxanthin &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() =>
      'LuteinZeaxanthin(value: $value, apiId: $apiId, unit: $unit)';

  LuteinZeaxanthin copyWithLuteinZeaxanthin(
          num? value, int? apiId, String? unit) =>
      LuteinZeaxanthin(
          value: value ?? this.value,
          apiId: apiId ?? this.apiId,
          unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'LuteinZeaxanthin', ...nestedJsonMap(attributes__)};

  factory LuteinZeaxanthin.fromJson(String json) =>
      LuteinZeaxanthin.fromMap(jsonDecode(json));

  factory LuteinZeaxanthin.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return LuteinZeaxanthin(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class Lycopene implements Nutrient {
  num value;
  int apiId = 337;
  String unit = 'µg';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  Lycopene({
    required this.value,
    this.apiId = 337,
    this.unit = 'µg',
  });

  factory Lycopene.staticConstructor({
    required value,
    apiId = 337,
    unit = 'µg',
  }) =>
      Lycopene(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Lycopene &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() => 'Lycopene(value: $value, apiId: $apiId, unit: $unit)';

  Lycopene copyWithLycopene(num? value, int? apiId, String? unit) => Lycopene(
      value: value ?? this.value,
      apiId: apiId ?? this.apiId,
      unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'Lycopene', ...nestedJsonMap(attributes__)};

  factory Lycopene.fromJson(String json) => Lycopene.fromMap(jsonDecode(json));

  factory Lycopene.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return Lycopene(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class Lysine implements Nutrient {
  num value;
  int apiId = 505;
  String unit = 'g';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  Lysine({
    required this.value,
    this.apiId = 505,
    this.unit = 'g',
  });

  factory Lysine.staticConstructor({
    required value,
    apiId = 505,
    unit = 'g',
  }) =>
      Lysine(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Lysine &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() => 'Lysine(value: $value, apiId: $apiId, unit: $unit)';

  Lysine copyWithLysine(num? value, int? apiId, String? unit) => Lysine(
      value: value ?? this.value,
      apiId: apiId ?? this.apiId,
      unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'Lysine', ...nestedJsonMap(attributes__)};

  factory Lysine.fromJson(String json) => Lysine.fromMap(jsonDecode(json));

  factory Lysine.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return Lysine(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class Maltose implements Nutrient {
  num value;
  int apiId = 214;
  String unit = 'g';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  Maltose({
    required this.value,
    this.apiId = 214,
    this.unit = 'g',
  });

  factory Maltose.staticConstructor({
    required value,
    apiId = 214,
    unit = 'g',
  }) =>
      Maltose(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Maltose &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() => 'Maltose(value: $value, apiId: $apiId, unit: $unit)';

  Maltose copyWithMaltose(num? value, int? apiId, String? unit) => Maltose(
      value: value ?? this.value,
      apiId: apiId ?? this.apiId,
      unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'Maltose', ...nestedJsonMap(attributes__)};

  factory Maltose.fromJson(String json) => Maltose.fromMap(jsonDecode(json));

  factory Maltose.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return Maltose(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class Methionine implements Nutrient {
  num value;
  int apiId = 506;
  String unit = 'g';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  Methionine({
    required this.value,
    this.apiId = 506,
    this.unit = 'g',
  });

  factory Methionine.staticConstructor({
    required value,
    apiId = 506,
    unit = 'g',
  }) =>
      Methionine(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Methionine &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() => 'Methionine(value: $value, apiId: $apiId, unit: $unit)';

  Methionine copyWithMethionine(num? value, int? apiId, String? unit) =>
      Methionine(
          value: value ?? this.value,
          apiId: apiId ?? this.apiId,
          unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'Methionine', ...nestedJsonMap(attributes__)};

  factory Methionine.fromJson(String json) =>
      Methionine.fromMap(jsonDecode(json));

  factory Methionine.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return Methionine(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class MagnesiumMg implements Nutrient {
  num value;
  int apiId = 304;
  String unit = 'mg';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  MagnesiumMg({
    required this.value,
    this.apiId = 304,
    this.unit = 'mg',
  });

  factory MagnesiumMg.staticConstructor({
    required value,
    apiId = 304,
    unit = 'mg',
  }) =>
      MagnesiumMg(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MagnesiumMg &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() => 'MagnesiumMg(value: $value, apiId: $apiId, unit: $unit)';

  MagnesiumMg copyWithMagnesiumMg(num? value, int? apiId, String? unit) =>
      MagnesiumMg(
          value: value ?? this.value,
          apiId: apiId ?? this.apiId,
          unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'MagnesiumMg', ...nestedJsonMap(attributes__)};

  factory MagnesiumMg.fromJson(String json) =>
      MagnesiumMg.fromMap(jsonDecode(json));

  factory MagnesiumMg.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return MagnesiumMg(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class Menaquinone4 implements Nutrient {
  num value;
  int apiId = 428;
  String unit = 'µg';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  Menaquinone4({
    required this.value,
    this.apiId = 428,
    this.unit = 'µg',
  });

  factory Menaquinone4.staticConstructor({
    required value,
    apiId = 428,
    unit = 'µg',
  }) =>
      Menaquinone4(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Menaquinone4 &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() =>
      'Menaquinone4(value: $value, apiId: $apiId, unit: $unit)';

  Menaquinone4 copyWithMenaquinone4(num? value, int? apiId, String? unit) =>
      Menaquinone4(
          value: value ?? this.value,
          apiId: apiId ?? this.apiId,
          unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'Menaquinone4', ...nestedJsonMap(attributes__)};

  factory Menaquinone4.fromJson(String json) =>
      Menaquinone4.fromMap(jsonDecode(json));

  factory Menaquinone4.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return Menaquinone4(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class ManganeseMn implements Nutrient {
  num value;
  int apiId = 315;
  String unit = 'mg';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  ManganeseMn({
    required this.value,
    this.apiId = 315,
    this.unit = 'mg',
  });

  factory ManganeseMn.staticConstructor({
    required value,
    apiId = 315,
    unit = 'mg',
  }) =>
      ManganeseMn(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ManganeseMn &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() => 'ManganeseMn(value: $value, apiId: $apiId, unit: $unit)';

  ManganeseMn copyWithManganeseMn(num? value, int? apiId, String? unit) =>
      ManganeseMn(
          value: value ?? this.value,
          apiId: apiId ?? this.apiId,
          unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'ManganeseMn', ...nestedJsonMap(attributes__)};

  factory ManganeseMn.fromJson(String json) =>
      ManganeseMn.fromMap(jsonDecode(json));

  factory ManganeseMn.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return ManganeseMn(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class Niacin implements Nutrient {
  num value;
  int apiId = 406;
  String unit = 'mg';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  Niacin({
    required this.value,
    this.apiId = 406,
    this.unit = 'mg',
  });

  factory Niacin.staticConstructor({
    required value,
    apiId = 406,
    unit = 'mg',
  }) =>
      Niacin(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Niacin &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() => 'Niacin(value: $value, apiId: $apiId, unit: $unit)';

  Niacin copyWithNiacin(num? value, int? apiId, String? unit) => Niacin(
      value: value ?? this.value,
      apiId: apiId ?? this.apiId,
      unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'Niacin', ...nestedJsonMap(attributes__)};

  factory Niacin.fromJson(String json) => Niacin.fromMap(jsonDecode(json));

  factory Niacin.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return Niacin(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class VitaminEadded implements Nutrient {
  num value;
  int apiId = 573;
  String unit = 'mg';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  VitaminEadded({
    required this.value,
    this.apiId = 573,
    this.unit = 'mg',
  });

  factory VitaminEadded.staticConstructor({
    required value,
    apiId = 573,
    unit = 'mg',
  }) =>
      VitaminEadded(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is VitaminEadded &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() =>
      'VitaminEadded(value: $value, apiId: $apiId, unit: $unit)';

  VitaminEadded copyWithVitaminEadded(num? value, int? apiId, String? unit) =>
      VitaminEadded(
          value: value ?? this.value,
          apiId: apiId ?? this.apiId,
          unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'VitaminEadded', ...nestedJsonMap(attributes__)};

  factory VitaminEadded.fromJson(String json) =>
      VitaminEadded.fromMap(jsonDecode(json));

  factory VitaminEadded.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return VitaminEadded(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class VitaminB12added implements Nutrient {
  num value;
  int apiId = 578;
  String unit = 'µg';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  VitaminB12added({
    required this.value,
    this.apiId = 578,
    this.unit = 'µg',
  });

  factory VitaminB12added.staticConstructor({
    required value,
    apiId = 578,
    unit = 'µg',
  }) =>
      VitaminB12added(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is VitaminB12added &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() =>
      'VitaminB12added(value: $value, apiId: $apiId, unit: $unit)';

  VitaminB12added copyWithVitaminB12added(
          num? value, int? apiId, String? unit) =>
      VitaminB12added(
          value: value ?? this.value,
          apiId: apiId ?? this.apiId,
          unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'VitaminB12added', ...nestedJsonMap(attributes__)};

  factory VitaminB12added.fromJson(String json) =>
      VitaminB12added.fromMap(jsonDecode(json));

  factory VitaminB12added.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return VitaminB12added(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class AdjustedProtein implements Nutrient {
  num value;
  int apiId = 257;
  String unit = 'g';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  AdjustedProtein({
    required this.value,
    this.apiId = 257,
    this.unit = 'g',
  });

  factory AdjustedProtein.staticConstructor({
    required value,
    apiId = 257,
    unit = 'g',
  }) =>
      AdjustedProtein(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AdjustedProtein &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() =>
      'AdjustedProtein(value: $value, apiId: $apiId, unit: $unit)';

  AdjustedProtein copyWithAdjustedProtein(
          num? value, int? apiId, String? unit) =>
      AdjustedProtein(
          value: value ?? this.value,
          apiId: apiId ?? this.apiId,
          unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'AdjustedProtein', ...nestedJsonMap(attributes__)};

  factory AdjustedProtein.fromJson(String json) =>
      AdjustedProtein.fromMap(jsonDecode(json));

  factory AdjustedProtein.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return AdjustedProtein(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class F22D1T implements Nutrient {
  num value;
  int apiId = 664;
  String unit = 'g';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  F22D1T({
    required this.value,
    this.apiId = 664,
    this.unit = 'g',
  });

  factory F22D1T.staticConstructor({
    required value,
    apiId = 664,
    unit = 'g',
  }) =>
      F22D1T(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is F22D1T &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() => 'F22D1T(value: $value, apiId: $apiId, unit: $unit)';

  F22D1T copyWithF22D1T(num? value, int? apiId, String? unit) => F22D1T(
      value: value ?? this.value,
      apiId: apiId ?? this.apiId,
      unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'F22D1T', ...nestedJsonMap(attributes__)};

  factory F22D1T.fromJson(String json) => F22D1T.fromMap(jsonDecode(json));

  factory F22D1T.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return F22D1T(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class F22D1C implements Nutrient {
  num value;
  int apiId = 676;
  String unit = 'g';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  F22D1C({
    required this.value,
    this.apiId = 676,
    this.unit = 'g',
  });

  factory F22D1C.staticConstructor({
    required value,
    apiId = 676,
    unit = 'g',
  }) =>
      F22D1C(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is F22D1C &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() => 'F22D1C(value: $value, apiId: $apiId, unit: $unit)';

  F22D1C copyWithF22D1C(num? value, int? apiId, String? unit) => F22D1C(
      value: value ?? this.value,
      apiId: apiId ?? this.apiId,
      unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'F22D1C', ...nestedJsonMap(attributes__)};

  factory F22D1C.fromJson(String json) => F22D1C.fromMap(jsonDecode(json));

  factory F22D1C.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return F22D1C(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class F18D3i implements Nutrient {
  num value;
  int apiId = 856;
  String unit = 'g';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  F18D3i({
    required this.value,
    this.apiId = 856,
    this.unit = 'g',
  });

  factory F18D3i.staticConstructor({
    required value,
    apiId = 856,
    unit = 'g',
  }) =>
      F18D3i(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is F18D3i &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() => 'F18D3i(value: $value, apiId: $apiId, unit: $unit)';

  F18D3i copyWithF18D3i(num? value, int? apiId, String? unit) => F18D3i(
      value: value ?? this.value,
      apiId: apiId ?? this.apiId,
      unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'F18D3i', ...nestedJsonMap(attributes__)};

  factory F18D3i.fromJson(String json) => F18D3i.fromMap(jsonDecode(json));

  factory F18D3i.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return F18D3i(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class F18D2TNot implements Nutrient {
  num value;
  int apiId = 665;
  String unit = 'g';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  F18D2TNot({
    required this.value,
    this.apiId = 665,
    this.unit = 'g',
  });

  factory F18D2TNot.staticConstructor({
    required value,
    apiId = 665,
    unit = 'g',
  }) =>
      F18D2TNot(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is F18D2TNot &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() => 'F18D2TNot(value: $value, apiId: $apiId, unit: $unit)';

  F18D2TNot copyWithF18D2TNot(num? value, int? apiId, String? unit) =>
      F18D2TNot(
          value: value ?? this.value,
          apiId: apiId ?? this.apiId,
          unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'F18D2TNot', ...nestedJsonMap(attributes__)};

  factory F18D2TNot.fromJson(String json) =>
      F18D2TNot.fromMap(jsonDecode(json));

  factory F18D2TNot.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return F18D2TNot(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class F18D2I implements Nutrient {
  num value;
  int apiId = 666;
  String unit = 'g';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  F18D2I({
    required this.value,
    this.apiId = 666,
    this.unit = 'g',
  });

  factory F18D2I.staticConstructor({
    required value,
    apiId = 666,
    unit = 'g',
  }) =>
      F18D2I(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is F18D2I &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() => 'F18D2I(value: $value, apiId: $apiId, unit: $unit)';

  F18D2I copyWithF18D2I(num? value, int? apiId, String? unit) => F18D2I(
      value: value ?? this.value,
      apiId: apiId ?? this.apiId,
      unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'F18D2I', ...nestedJsonMap(attributes__)};

  factory F18D2I.fromJson(String json) => F18D2I.fromMap(jsonDecode(json));

  factory F18D2I.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return F18D2I(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class PhosphorusP implements Nutrient {
  num value;
  int apiId = 305;
  String unit = 'mg';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  PhosphorusP({
    required this.value,
    this.apiId = 305,
    this.unit = 'mg',
  });

  factory PhosphorusP.staticConstructor({
    required value,
    apiId = 305,
    unit = 'mg',
  }) =>
      PhosphorusP(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PhosphorusP &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() => 'PhosphorusP(value: $value, apiId: $apiId, unit: $unit)';

  PhosphorusP copyWithPhosphorusP(num? value, int? apiId, String? unit) =>
      PhosphorusP(
          value: value ?? this.value,
          apiId: apiId ?? this.apiId,
          unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'PhosphorusP', ...nestedJsonMap(attributes__)};

  factory PhosphorusP.fromJson(String json) =>
      PhosphorusP.fromMap(jsonDecode(json));

  factory PhosphorusP.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return PhosphorusP(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class PantothenicAcid implements Nutrient {
  num value;
  int apiId = 410;
  String unit = 'mg';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  PantothenicAcid({
    required this.value,
    this.apiId = 410,
    this.unit = 'mg',
  });

  factory PantothenicAcid.staticConstructor({
    required value,
    apiId = 410,
    unit = 'mg',
  }) =>
      PantothenicAcid(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PantothenicAcid &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() =>
      'PantothenicAcid(value: $value, apiId: $apiId, unit: $unit)';

  PantothenicAcid copyWithPantothenicAcid(
          num? value, int? apiId, String? unit) =>
      PantothenicAcid(
          value: value ?? this.value,
          apiId: apiId ?? this.apiId,
          unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'PantothenicAcid', ...nestedJsonMap(attributes__)};

  factory PantothenicAcid.fromJson(String json) =>
      PantothenicAcid.fromMap(jsonDecode(json));

  factory PantothenicAcid.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return PantothenicAcid(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class Phenylalanine implements Nutrient {
  num value;
  int apiId = 508;
  String unit = 'g';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  Phenylalanine({
    required this.value,
    this.apiId = 508,
    this.unit = 'g',
  });

  factory Phenylalanine.staticConstructor({
    required value,
    apiId = 508,
    unit = 'g',
  }) =>
      Phenylalanine(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Phenylalanine &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() =>
      'Phenylalanine(value: $value, apiId: $apiId, unit: $unit)';

  Phenylalanine copyWithPhenylalanine(num? value, int? apiId, String? unit) =>
      Phenylalanine(
          value: value ?? this.value,
          apiId: apiId ?? this.apiId,
          unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'Phenylalanine', ...nestedJsonMap(attributes__)};

  factory Phenylalanine.fromJson(String json) =>
      Phenylalanine.fromMap(jsonDecode(json));

  factory Phenylalanine.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return Phenylalanine(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class Phytosterols implements Nutrient {
  num value;
  int apiId = 636;
  String unit = 'mg';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  Phytosterols({
    required this.value,
    this.apiId = 636,
    this.unit = 'mg',
  });

  factory Phytosterols.staticConstructor({
    required value,
    apiId = 636,
    unit = 'mg',
  }) =>
      Phytosterols(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Phytosterols &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() =>
      'Phytosterols(value: $value, apiId: $apiId, unit: $unit)';

  Phytosterols copyWithPhytosterols(num? value, int? apiId, String? unit) =>
      Phytosterols(
          value: value ?? this.value,
          apiId: apiId ?? this.apiId,
          unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'Phytosterols', ...nestedJsonMap(attributes__)};

  factory Phytosterols.fromJson(String json) =>
      Phytosterols.fromMap(jsonDecode(json));

  factory Phytosterols.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return Phytosterols(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class Proline implements Nutrient {
  num value;
  int apiId = 517;
  String unit = 'g';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  Proline({
    required this.value,
    this.apiId = 517,
    this.unit = 'g',
  });

  factory Proline.staticConstructor({
    required value,
    apiId = 517,
    unit = 'g',
  }) =>
      Proline(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Proline &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() => 'Proline(value: $value, apiId: $apiId, unit: $unit)';

  Proline copyWithProline(num? value, int? apiId, String? unit) => Proline(
      value: value ?? this.value,
      apiId: apiId ?? this.apiId,
      unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'Proline', ...nestedJsonMap(attributes__)};

  factory Proline.fromJson(String json) => Proline.fromMap(jsonDecode(json));

  factory Proline.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return Proline(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class Retinol implements Nutrient {
  num value;
  int apiId = 319;
  String unit = 'µg';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  Retinol({
    required this.value,
    this.apiId = 319,
    this.unit = 'µg',
  });

  factory Retinol.staticConstructor({
    required value,
    apiId = 319,
    unit = 'µg',
  }) =>
      Retinol(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Retinol &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() => 'Retinol(value: $value, apiId: $apiId, unit: $unit)';

  Retinol copyWithRetinol(num? value, int? apiId, String? unit) => Retinol(
      value: value ?? this.value,
      apiId: apiId ?? this.apiId,
      unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'Retinol', ...nestedJsonMap(attributes__)};

  factory Retinol.fromJson(String json) => Retinol.fromMap(jsonDecode(json));

  factory Retinol.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return Retinol(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class Riboflavin implements Nutrient {
  num value;
  int apiId = 405;
  String unit = 'mg';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  Riboflavin({
    required this.value,
    this.apiId = 405,
    this.unit = 'mg',
  });

  factory Riboflavin.staticConstructor({
    required value,
    apiId = 405,
    unit = 'mg',
  }) =>
      Riboflavin(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Riboflavin &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() => 'Riboflavin(value: $value, apiId: $apiId, unit: $unit)';

  Riboflavin copyWithRiboflavin(num? value, int? apiId, String? unit) =>
      Riboflavin(
          value: value ?? this.value,
          apiId: apiId ?? this.apiId,
          unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'Riboflavin', ...nestedJsonMap(attributes__)};

  factory Riboflavin.fromJson(String json) =>
      Riboflavin.fromMap(jsonDecode(json));

  factory Riboflavin.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return Riboflavin(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class Selenium implements Nutrient {
  num value;
  int apiId = 317;
  String unit = 'µg';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  Selenium({
    required this.value,
    this.apiId = 317,
    this.unit = 'µg',
  });

  factory Selenium.staticConstructor({
    required value,
    apiId = 317,
    unit = 'µg',
  }) =>
      Selenium(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Selenium &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() => 'Selenium(value: $value, apiId: $apiId, unit: $unit)';

  Selenium copyWithSelenium(num? value, int? apiId, String? unit) => Selenium(
      value: value ?? this.value,
      apiId: apiId ?? this.apiId,
      unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'Selenium', ...nestedJsonMap(attributes__)};

  factory Selenium.fromJson(String json) => Selenium.fromMap(jsonDecode(json));

  factory Selenium.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return Selenium(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class Serine implements Nutrient {
  num value;
  int apiId = 518;
  String unit = 'g';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  Serine({
    required this.value,
    this.apiId = 518,
    this.unit = 'g',
  });

  factory Serine.staticConstructor({
    required value,
    apiId = 518,
    unit = 'g',
  }) =>
      Serine(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Serine &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() => 'Serine(value: $value, apiId: $apiId, unit: $unit)';

  Serine copyWithSerine(num? value, int? apiId, String? unit) => Serine(
      value: value ?? this.value,
      apiId: apiId ?? this.apiId,
      unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'Serine', ...nestedJsonMap(attributes__)};

  factory Serine.fromJson(String json) => Serine.fromMap(jsonDecode(json));

  factory Serine.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return Serine(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class Betasitosterol implements Nutrient {
  num value;
  int apiId = 641;
  String unit = 'mg';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  Betasitosterol({
    required this.value,
    this.apiId = 641,
    this.unit = 'mg',
  });

  factory Betasitosterol.staticConstructor({
    required value,
    apiId = 641,
    unit = 'mg',
  }) =>
      Betasitosterol(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Betasitosterol &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() =>
      'Betasitosterol(value: $value, apiId: $apiId, unit: $unit)';

  Betasitosterol copyWithBetasitosterol(num? value, int? apiId, String? unit) =>
      Betasitosterol(
          value: value ?? this.value,
          apiId: apiId ?? this.apiId,
          unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'Betasitosterol', ...nestedJsonMap(attributes__)};

  factory Betasitosterol.fromJson(String json) =>
      Betasitosterol.fromMap(jsonDecode(json));

  factory Betasitosterol.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return Betasitosterol(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class Starch implements Nutrient {
  num value;
  int apiId = 209;
  String unit = 'g';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  Starch({
    required this.value,
    this.apiId = 209,
    this.unit = 'g',
  });

  factory Starch.staticConstructor({
    required value,
    apiId = 209,
    unit = 'g',
  }) =>
      Starch(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Starch &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() => 'Starch(value: $value, apiId: $apiId, unit: $unit)';

  Starch copyWithStarch(num? value, int? apiId, String? unit) => Starch(
      value: value ?? this.value,
      apiId: apiId ?? this.apiId,
      unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'Starch', ...nestedJsonMap(attributes__)};

  factory Starch.fromJson(String json) => Starch.fromMap(jsonDecode(json));

  factory Starch.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return Starch(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class Stigmasterol implements Nutrient {
  num value;
  int apiId = 638;
  String unit = 'mg';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  Stigmasterol({
    required this.value,
    this.apiId = 638,
    this.unit = 'mg',
  });

  factory Stigmasterol.staticConstructor({
    required value,
    apiId = 638,
    unit = 'mg',
  }) =>
      Stigmasterol(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Stigmasterol &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() =>
      'Stigmasterol(value: $value, apiId: $apiId, unit: $unit)';

  Stigmasterol copyWithStigmasterol(num? value, int? apiId, String? unit) =>
      Stigmasterol(
          value: value ?? this.value,
          apiId: apiId ?? this.apiId,
          unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'Stigmasterol', ...nestedJsonMap(attributes__)};

  factory Stigmasterol.fromJson(String json) =>
      Stigmasterol.fromMap(jsonDecode(json));

  factory Stigmasterol.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return Stigmasterol(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class Sucrose implements Nutrient {
  num value;
  int apiId = 210;
  String unit = 'g';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  Sucrose({
    required this.value,
    this.apiId = 210,
    this.unit = 'g',
  });

  factory Sucrose.staticConstructor({
    required value,
    apiId = 210,
    unit = 'g',
  }) =>
      Sucrose(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Sucrose &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() => 'Sucrose(value: $value, apiId: $apiId, unit: $unit)';

  Sucrose copyWithSucrose(num? value, int? apiId, String? unit) => Sucrose(
      value: value ?? this.value,
      apiId: apiId ?? this.apiId,
      unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'Sucrose', ...nestedJsonMap(attributes__)};

  factory Sucrose.fromJson(String json) => Sucrose.fromMap(jsonDecode(json));

  factory Sucrose.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return Sucrose(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class Theobromine implements Nutrient {
  num value;
  int apiId = 263;
  String unit = 'mg';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  Theobromine({
    required this.value,
    this.apiId = 263,
    this.unit = 'mg',
  });

  factory Theobromine.staticConstructor({
    required value,
    apiId = 263,
    unit = 'mg',
  }) =>
      Theobromine(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Theobromine &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() => 'Theobromine(value: $value, apiId: $apiId, unit: $unit)';

  Theobromine copyWithTheobromine(num? value, int? apiId, String? unit) =>
      Theobromine(
          value: value ?? this.value,
          apiId: apiId ?? this.apiId,
          unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'Theobromine', ...nestedJsonMap(attributes__)};

  factory Theobromine.fromJson(String json) =>
      Theobromine.fromMap(jsonDecode(json));

  factory Theobromine.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return Theobromine(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class Thiamin implements Nutrient {
  num value;
  int apiId = 404;
  String unit = 'mg';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  Thiamin({
    required this.value,
    this.apiId = 404,
    this.unit = 'mg',
  });

  factory Thiamin.staticConstructor({
    required value,
    apiId = 404,
    unit = 'mg',
  }) =>
      Thiamin(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Thiamin &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() => 'Thiamin(value: $value, apiId: $apiId, unit: $unit)';

  Thiamin copyWithThiamin(num? value, int? apiId, String? unit) => Thiamin(
      value: value ?? this.value,
      apiId: apiId ?? this.apiId,
      unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'Thiamin', ...nestedJsonMap(attributes__)};

  factory Thiamin.fromJson(String json) => Thiamin.fromMap(jsonDecode(json));

  factory Thiamin.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return Thiamin(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class Threonine implements Nutrient {
  num value;
  int apiId = 502;
  String unit = 'g';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  Threonine({
    required this.value,
    this.apiId = 502,
    this.unit = 'g',
  });

  factory Threonine.staticConstructor({
    required value,
    apiId = 502,
    unit = 'g',
  }) =>
      Threonine(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Threonine &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() => 'Threonine(value: $value, apiId: $apiId, unit: $unit)';

  Threonine copyWithThreonine(num? value, int? apiId, String? unit) =>
      Threonine(
          value: value ?? this.value,
          apiId: apiId ?? this.apiId,
          unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'Threonine', ...nestedJsonMap(attributes__)};

  factory Threonine.fromJson(String json) =>
      Threonine.fromMap(jsonDecode(json));

  factory Threonine.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return Threonine(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class VitaminE implements Nutrient {
  num value;
  int apiId = 323;
  String unit = 'mg';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  VitaminE({
    required this.value,
    this.apiId = 323,
    this.unit = 'mg',
  });

  factory VitaminE.staticConstructor({
    required value,
    apiId = 323,
    unit = 'mg',
  }) =>
      VitaminE(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is VitaminE &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() => 'VitaminE(value: $value, apiId: $apiId, unit: $unit)';

  VitaminE copyWithVitaminE(num? value, int? apiId, String? unit) => VitaminE(
      value: value ?? this.value,
      apiId: apiId ?? this.apiId,
      unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'VitaminE', ...nestedJsonMap(attributes__)};

  factory VitaminE.fromJson(String json) => VitaminE.fromMap(jsonDecode(json));

  factory VitaminE.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return VitaminE(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class Tocopherolbeta implements Nutrient {
  num value;
  int apiId = 341;
  String unit = 'mg';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  Tocopherolbeta({
    required this.value,
    this.apiId = 341,
    this.unit = 'mg',
  });

  factory Tocopherolbeta.staticConstructor({
    required value,
    apiId = 341,
    unit = 'mg',
  }) =>
      Tocopherolbeta(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Tocopherolbeta &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() =>
      'Tocopherolbeta(value: $value, apiId: $apiId, unit: $unit)';

  Tocopherolbeta copyWithTocopherolbeta(num? value, int? apiId, String? unit) =>
      Tocopherolbeta(
          value: value ?? this.value,
          apiId: apiId ?? this.apiId,
          unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'Tocopherolbeta', ...nestedJsonMap(attributes__)};

  factory Tocopherolbeta.fromJson(String json) =>
      Tocopherolbeta.fromMap(jsonDecode(json));

  factory Tocopherolbeta.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return Tocopherolbeta(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class Tocopheroldelta implements Nutrient {
  num value;
  int apiId = 343;
  String unit = 'mg';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  Tocopheroldelta({
    required this.value,
    this.apiId = 343,
    this.unit = 'mg',
  });

  factory Tocopheroldelta.staticConstructor({
    required value,
    apiId = 343,
    unit = 'mg',
  }) =>
      Tocopheroldelta(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Tocopheroldelta &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() =>
      'Tocopheroldelta(value: $value, apiId: $apiId, unit: $unit)';

  Tocopheroldelta copyWithTocopheroldelta(
          num? value, int? apiId, String? unit) =>
      Tocopheroldelta(
          value: value ?? this.value,
          apiId: apiId ?? this.apiId,
          unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'Tocopheroldelta', ...nestedJsonMap(attributes__)};

  factory Tocopheroldelta.fromJson(String json) =>
      Tocopheroldelta.fromMap(jsonDecode(json));

  factory Tocopheroldelta.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return Tocopheroldelta(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class Tocopherolgamma implements Nutrient {
  num value;
  int apiId = 342;
  String unit = 'mg';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  Tocopherolgamma({
    required this.value,
    this.apiId = 342,
    this.unit = 'mg',
  });

  factory Tocopherolgamma.staticConstructor({
    required value,
    apiId = 342,
    unit = 'mg',
  }) =>
      Tocopherolgamma(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Tocopherolgamma &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() =>
      'Tocopherolgamma(value: $value, apiId: $apiId, unit: $unit)';

  Tocopherolgamma copyWithTocopherolgamma(
          num? value, int? apiId, String? unit) =>
      Tocopherolgamma(
          value: value ?? this.value,
          apiId: apiId ?? this.apiId,
          unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'Tocopherolgamma', ...nestedJsonMap(attributes__)};

  factory Tocopherolgamma.fromJson(String json) =>
      Tocopherolgamma.fromMap(jsonDecode(json));

  factory Tocopherolgamma.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return Tocopherolgamma(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class Tryptophan implements Nutrient {
  num value;
  int apiId = 501;
  String unit = 'g';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  Tryptophan({
    required this.value,
    this.apiId = 501,
    this.unit = 'g',
  });

  factory Tryptophan.staticConstructor({
    required value,
    apiId = 501,
    unit = 'g',
  }) =>
      Tryptophan(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Tryptophan &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() => 'Tryptophan(value: $value, apiId: $apiId, unit: $unit)';

  Tryptophan copyWithTryptophan(num? value, int? apiId, String? unit) =>
      Tryptophan(
          value: value ?? this.value,
          apiId: apiId ?? this.apiId,
          unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'Tryptophan', ...nestedJsonMap(attributes__)};

  factory Tryptophan.fromJson(String json) =>
      Tryptophan.fromMap(jsonDecode(json));

  factory Tryptophan.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return Tryptophan(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class Tyrosine implements Nutrient {
  num value;
  int apiId = 509;
  String unit = 'g';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  Tyrosine({
    required this.value,
    this.apiId = 509,
    this.unit = 'g',
  });

  factory Tyrosine.staticConstructor({
    required value,
    apiId = 509,
    unit = 'g',
  }) =>
      Tyrosine(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Tyrosine &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() => 'Tyrosine(value: $value, apiId: $apiId, unit: $unit)';

  Tyrosine copyWithTyrosine(num? value, int? apiId, String? unit) => Tyrosine(
      value: value ?? this.value,
      apiId: apiId ?? this.apiId,
      unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'Tyrosine', ...nestedJsonMap(attributes__)};

  factory Tyrosine.fromJson(String json) => Tyrosine.fromMap(jsonDecode(json));

  factory Tyrosine.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return Tyrosine(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class Valine implements Nutrient {
  num value;
  int apiId = 510;
  String unit = 'g';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  Valine({
    required this.value,
    this.apiId = 510,
    this.unit = 'g',
  });

  factory Valine.staticConstructor({
    required value,
    apiId = 510,
    unit = 'g',
  }) =>
      Valine(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Valine &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() => 'Valine(value: $value, apiId: $apiId, unit: $unit)';

  Valine copyWithValine(num? value, int? apiId, String? unit) => Valine(
      value: value ?? this.value,
      apiId: apiId ?? this.apiId,
      unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'Valine', ...nestedJsonMap(attributes__)};

  factory Valine.fromJson(String json) => Valine.fromMap(jsonDecode(json));

  factory Valine.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return Valine(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class VitaminA implements Nutrient {
  num value;
  int apiId = 318;
  String unit = 'IU';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  VitaminA({
    required this.value,
    this.apiId = 318,
    this.unit = 'IU',
  });

  factory VitaminA.staticConstructor({
    required value,
    apiId = 318,
    unit = 'IU',
  }) =>
      VitaminA(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is VitaminA &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() => 'VitaminA(value: $value, apiId: $apiId, unit: $unit)';

  VitaminA copyWithVitaminA(num? value, int? apiId, String? unit) => VitaminA(
      value: value ?? this.value,
      apiId: apiId ?? this.apiId,
      unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'VitaminA', ...nestedJsonMap(attributes__)};

  factory VitaminA.fromJson(String json) => VitaminA.fromMap(jsonDecode(json));

  factory VitaminA.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return VitaminA(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class VitaminARAE implements Nutrient {
  num value;
  int apiId = 320;
  String unit = 'µg';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  VitaminARAE({
    required this.value,
    this.apiId = 320,
    this.unit = 'µg',
  });

  factory VitaminARAE.staticConstructor({
    required value,
    apiId = 320,
    unit = 'µg',
  }) =>
      VitaminARAE(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is VitaminARAE &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() => 'VitaminARAE(value: $value, apiId: $apiId, unit: $unit)';

  VitaminARAE copyWithVitaminARAE(num? value, int? apiId, String? unit) =>
      VitaminARAE(
          value: value ?? this.value,
          apiId: apiId ?? this.apiId,
          unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'VitaminARAE', ...nestedJsonMap(attributes__)};

  factory VitaminARAE.fromJson(String json) =>
      VitaminARAE.fromMap(jsonDecode(json));

  factory VitaminARAE.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return VitaminARAE(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class VitaminB12 implements Nutrient {
  num value;
  int apiId = 418;
  String unit = 'µg';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  VitaminB12({
    required this.value,
    this.apiId = 418,
    this.unit = 'µg',
  });

  factory VitaminB12.staticConstructor({
    required value,
    apiId = 418,
    unit = 'µg',
  }) =>
      VitaminB12(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is VitaminB12 &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() => 'VitaminB12(value: $value, apiId: $apiId, unit: $unit)';

  VitaminB12 copyWithVitaminB12(num? value, int? apiId, String? unit) =>
      VitaminB12(
          value: value ?? this.value,
          apiId: apiId ?? this.apiId,
          unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'VitaminB12', ...nestedJsonMap(attributes__)};

  factory VitaminB12.fromJson(String json) =>
      VitaminB12.fromMap(jsonDecode(json));

  factory VitaminB12.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return VitaminB12(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class VitaminB6 implements Nutrient {
  num value;
  int apiId = 415;
  String unit = 'mg';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  VitaminB6({
    required this.value,
    this.apiId = 415,
    this.unit = 'mg',
  });

  factory VitaminB6.staticConstructor({
    required value,
    apiId = 415,
    unit = 'mg',
  }) =>
      VitaminB6(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is VitaminB6 &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() => 'VitaminB6(value: $value, apiId: $apiId, unit: $unit)';

  VitaminB6 copyWithVitaminB6(num? value, int? apiId, String? unit) =>
      VitaminB6(
          value: value ?? this.value,
          apiId: apiId ?? this.apiId,
          unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'VitaminB6', ...nestedJsonMap(attributes__)};

  factory VitaminB6.fromJson(String json) =>
      VitaminB6.fromMap(jsonDecode(json));

  factory VitaminB6.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return VitaminB6(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class VitaminC implements Nutrient {
  num value;
  int apiId = 401;
  String unit = 'mg';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  VitaminC({
    required this.value,
    this.apiId = 401,
    this.unit = 'mg',
  });

  factory VitaminC.staticConstructor({
    required value,
    apiId = 401,
    unit = 'mg',
  }) =>
      VitaminC(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is VitaminC &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() => 'VitaminC(value: $value, apiId: $apiId, unit: $unit)';

  VitaminC copyWithVitaminC(num? value, int? apiId, String? unit) => VitaminC(
      value: value ?? this.value,
      apiId: apiId ?? this.apiId,
      unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'VitaminC', ...nestedJsonMap(attributes__)};

  factory VitaminC.fromJson(String json) => VitaminC.fromMap(jsonDecode(json));

  factory VitaminC.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return VitaminC(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class VitaminD implements Nutrient {
  num value;
  int apiId = 328;
  String unit = 'µg';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  VitaminD({
    required this.value,
    this.apiId = 328,
    this.unit = 'µg',
  });

  factory VitaminD.staticConstructor({
    required value,
    apiId = 328,
    unit = 'µg',
  }) =>
      VitaminD(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is VitaminD &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() => 'VitaminD(value: $value, apiId: $apiId, unit: $unit)';

  VitaminD copyWithVitaminD(num? value, int? apiId, String? unit) => VitaminD(
      value: value ?? this.value,
      apiId: apiId ?? this.apiId,
      unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'VitaminD', ...nestedJsonMap(attributes__)};

  factory VitaminD.fromJson(String json) => VitaminD.fromMap(jsonDecode(json));

  factory VitaminD.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return VitaminD(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class VitaminK implements Nutrient {
  num value;
  int apiId = 430;
  String unit = 'µg';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  VitaminK({
    required this.value,
    this.apiId = 430,
    this.unit = 'µg',
  });

  factory VitaminK.staticConstructor({
    required value,
    apiId = 430,
    unit = 'µg',
  }) =>
      VitaminK(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is VitaminK &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() => 'VitaminK(value: $value, apiId: $apiId, unit: $unit)';

  VitaminK copyWithVitaminK(num? value, int? apiId, String? unit) => VitaminK(
      value: value ?? this.value,
      apiId: apiId ?? this.apiId,
      unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'VitaminK', ...nestedJsonMap(attributes__)};

  factory VitaminK.fromJson(String json) => VitaminK.fromMap(jsonDecode(json));

  factory VitaminK.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return VitaminK(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class Dihydrophylloquinone implements Nutrient {
  num value;
  int apiId = 429;
  String unit = 'µg';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  Dihydrophylloquinone({
    required this.value,
    this.apiId = 429,
    this.unit = 'µg',
  });

  factory Dihydrophylloquinone.staticConstructor({
    required value,
    apiId = 429,
    unit = 'µg',
  }) =>
      Dihydrophylloquinone(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Dihydrophylloquinone &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() =>
      'Dihydrophylloquinone(value: $value, apiId: $apiId, unit: $unit)';

  Dihydrophylloquinone copyWithDihydrophylloquinone(
          num? value, int? apiId, String? unit) =>
      Dihydrophylloquinone(
          value: value ?? this.value,
          apiId: apiId ?? this.apiId,
          unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'Dihydrophylloquinone', ...nestedJsonMap(attributes__)};

  factory Dihydrophylloquinone.fromJson(String json) =>
      Dihydrophylloquinone.fromMap(jsonDecode(json));

  factory Dihydrophylloquinone.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return Dihydrophylloquinone(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class Water implements Nutrient {
  num value;
  int apiId = 255;
  String unit = 'g';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  Water({
    required this.value,
    this.apiId = 255,
    this.unit = 'g',
  });

  factory Water.staticConstructor({
    required value,
    apiId = 255,
    unit = 'g',
  }) =>
      Water(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Water &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() => 'Water(value: $value, apiId: $apiId, unit: $unit)';

  Water copyWithWater(num? value, int? apiId, String? unit) => Water(
      value: value ?? this.value,
      apiId: apiId ?? this.apiId,
      unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'Water', ...nestedJsonMap(attributes__)};

  factory Water.fromJson(String json) => Water.fromMap(jsonDecode(json));

  factory Water.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return Water(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class Zinc implements Nutrient {
  num value;
  int apiId = 309;
  String unit = 'mg';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  Zinc({
    required this.value,
    this.apiId = 309,
    this.unit = 'mg',
  });

  factory Zinc.staticConstructor({
    required value,
    apiId = 309,
    unit = 'mg',
  }) =>
      Zinc(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Zinc &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() => 'Zinc(value: $value, apiId: $apiId, unit: $unit)';

  Zinc copyWithZinc(num? value, int? apiId, String? unit) => Zinc(
      value: value ?? this.value,
      apiId: apiId ?? this.apiId,
      unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'Zinc', ...nestedJsonMap(attributes__)};

  factory Zinc.fromJson(String json) => Zinc.fromMap(jsonDecode(json));

  factory Zinc.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return Zinc(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class Tocotrienolalpha implements Nutrient {
  num value;
  int apiId = 344;
  String unit = 'mg';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  Tocotrienolalpha({
    required this.value,
    this.apiId = 344,
    this.unit = 'mg',
  });

  factory Tocotrienolalpha.staticConstructor({
    required value,
    apiId = 344,
    unit = 'mg',
  }) =>
      Tocotrienolalpha(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Tocotrienolalpha &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() =>
      'Tocotrienolalpha(value: $value, apiId: $apiId, unit: $unit)';

  Tocotrienolalpha copyWithTocotrienolalpha(
          num? value, int? apiId, String? unit) =>
      Tocotrienolalpha(
          value: value ?? this.value,
          apiId: apiId ?? this.apiId,
          unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'Tocotrienolalpha', ...nestedJsonMap(attributes__)};

  factory Tocotrienolalpha.fromJson(String json) =>
      Tocotrienolalpha.fromMap(jsonDecode(json));

  factory Tocotrienolalpha.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return Tocotrienolalpha(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class Tocotrienolbeta implements Nutrient {
  num value;
  int apiId = 345;
  String unit = 'mg';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  Tocotrienolbeta({
    required this.value,
    this.apiId = 345,
    this.unit = 'mg',
  });

  factory Tocotrienolbeta.staticConstructor({
    required value,
    apiId = 345,
    unit = 'mg',
  }) =>
      Tocotrienolbeta(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Tocotrienolbeta &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() =>
      'Tocotrienolbeta(value: $value, apiId: $apiId, unit: $unit)';

  Tocotrienolbeta copyWithTocotrienolbeta(
          num? value, int? apiId, String? unit) =>
      Tocotrienolbeta(
          value: value ?? this.value,
          apiId: apiId ?? this.apiId,
          unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'Tocotrienolbeta', ...nestedJsonMap(attributes__)};

  factory Tocotrienolbeta.fromJson(String json) =>
      Tocotrienolbeta.fromMap(jsonDecode(json));

  factory Tocotrienolbeta.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return Tocotrienolbeta(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class Tocotrienolgamma implements Nutrient {
  num value;
  int apiId = 346;
  String unit = 'mg';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  Tocotrienolgamma({
    required this.value,
    this.apiId = 346,
    this.unit = 'mg',
  });

  factory Tocotrienolgamma.staticConstructor({
    required value,
    apiId = 346,
    unit = 'mg',
  }) =>
      Tocotrienolgamma(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Tocotrienolgamma &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() =>
      'Tocotrienolgamma(value: $value, apiId: $apiId, unit: $unit)';

  Tocotrienolgamma copyWithTocotrienolgamma(
          num? value, int? apiId, String? unit) =>
      Tocotrienolgamma(
          value: value ?? this.value,
          apiId: apiId ?? this.apiId,
          unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'Tocotrienolgamma', ...nestedJsonMap(attributes__)};

  factory Tocotrienolgamma.fromJson(String json) =>
      Tocotrienolgamma.fromMap(jsonDecode(json));

  factory Tocotrienolgamma.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return Tocotrienolgamma(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}

@Dataclass()
class TocotrienolDelta implements Nutrient {
  num value;
  int apiId = 347;
  String unit = 'mg';

// <editor-fold desc="Dataclass Section">
  @Generate()
  // <Dataclass>

  // WARNING! Any code written in this section is subject to be overwritten!
  // Please move any code you wish to save outside of this section.
  // Or else the next time the code generation runs your code will be overwritten!
  // If you wish to keep the capabilities of your class as a Dataclass, and
  // disable the code generation, delete the @Generate decorator.

  TocotrienolDelta({
    required this.value,
    this.apiId = 347,
    this.unit = 'mg',
  });

  factory TocotrienolDelta.staticConstructor({
    required value,
    apiId = 347,
    unit = 'mg',
  }) =>
      TocotrienolDelta(value: value, apiId: apiId, unit: unit);

  Map<String, dynamic> get attributes__ =>
      {"value": value, "apiId": apiId, "unit": unit};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TocotrienolDelta &&
          runtimeType == other.runtimeType &&
          equals(value, other.value) &&
          equals(apiId, other.apiId) &&
          equals(unit, other.unit));

  @override
  int get hashCode => value.hashCode ^ apiId.hashCode ^ unit.hashCode;

  @override
  String toString() =>
      'TocotrienolDelta(value: $value, apiId: $apiId, unit: $unit)';

  TocotrienolDelta copyWithTocotrienolDelta(
          num? value, int? apiId, String? unit) =>
      TocotrienolDelta(
          value: value ?? this.value,
          apiId: apiId ?? this.apiId,
          unit: unit ?? this.unit);

  String toJson() => jsonEncode(toMap());
  Map<String, dynamic> toMap() =>
      {'__type': 'TocotrienolDelta', ...nestedJsonMap(attributes__)};

  factory TocotrienolDelta.fromJson(String json) =>
      TocotrienolDelta.fromMap(jsonDecode(json));

  factory TocotrienolDelta.fromMap(Map map) {
    num value = map['value'];
    int apiId = map['apiId'];
    String unit = map['unit'];

    // No casting

    return TocotrienolDelta(value: value, apiId: apiId, unit: unit);
  }
  // </Dataclass>

  // </editor-fold>
}
