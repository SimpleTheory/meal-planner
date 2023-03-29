import 'package:nutrition_app/mydataclasses/metadata.dart';
import 'dart:convert';
import 'package:dataclasses/dataclasses.dart';
import '../domain_2.dart';

@Dataclass()
class MealComponent {
  MealComponentFactory reference;
  int grams;
  Nutrients get nutrients => throw UnimplementedError();
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
