part of 'custom_ing_bloc.dart';

class CustomIngState {
  String baseGrams;
  String name;
  Map<String, String> altMeasures;
  Map<String, String> nutrientFields;

  factory CustomIngState.initial() => CustomIngState(
      baseGrams: '',
      name: '',
      altMeasures: {'': ''},
      nutrientFields: {for (Nutrient nut in nutList) nut.name: '0'});

  bool isInvalid() {
    if (baseGrams.isEmpty || name.isEmpty || baseGrams == '.') {
      return true;
    }
    for (MapEntry<String, String> alt_measure in altMeasures.entries) {
      if (alt_measure.key == '') {
        continue;
      }
      if (alt_measure.key.isEmpty ||
          alt_measure.value.isEmpty ||
          alt_measure.value == '.') {
        return true;
      }
    }
    for (String nutField in nutrientFields.values) {
      if (nutField.isEmpty || nutField == '.') {
        return true;
      }
    }
    return false;
  }

  Ingredient toIngredient() {
    // Todo: Save image more as file and use that as Image
    final transformedAlts =
        altMeasures.map((key, value) => MapEntry(key, fixDecimal(value)!));
    transformedAlts.remove('');
    Ingredient result = Ingredient(
        name: name,
        baseNutrient: BaseNutrients(
            grams: fixDecimal(baseGrams)!,
            nutrients: Nutrients.fromValues(
                calcium: fixDecimal(nutrientFields['calcium']!)!,
                carbohydrate: fixDecimal(nutrientFields['carbohydrate']!)!,
                cholesterol: fixDecimal(nutrientFields['cholesterol']!)!,
                calories: fixDecimal(nutrientFields['calories']!)!,
                saturatedFat: fixDecimal(nutrientFields['saturatedFat']!)!,
                totalFat: fixDecimal(nutrientFields['totalFat']!)!,
                transFat: fixDecimal(nutrientFields['transFat']!)!,
                iron: fixDecimal(nutrientFields['iron']!)!,
                fiber: fixDecimal(nutrientFields['fiber']!)!,
                potassium: fixDecimal(nutrientFields['potassium']!)!,
                sodium: fixDecimal(nutrientFields['sodium']!)!,
                protein: fixDecimal(nutrientFields['protein']!)!,
                sugars: fixDecimal(nutrientFields['sugars']!)!,
                choline: fixDecimal(nutrientFields['choline']!)!,
                copper: fixDecimal(nutrientFields['copper']!)!,
                ala: fixDecimal(nutrientFields['ala']!)!,
                linoleicAcid: fixDecimal(nutrientFields['linoleicAcid']!)!,
                epa: fixDecimal(nutrientFields['epa']!)!,
                dpa: fixDecimal(nutrientFields['dpa']!)!,
                dha: fixDecimal(nutrientFields['dha']!)!,
                folate: fixDecimal(nutrientFields['folate']!)!,
                magnesium: fixDecimal(nutrientFields['magnesium']!)!,
                manganese: fixDecimal(nutrientFields['manganese']!)!,
                niacin: fixDecimal(nutrientFields['niacin']!)!,
                phosphorus: fixDecimal(nutrientFields['phosphorus']!)!,
                pantothenicAcid: fixDecimal(nutrientFields['pantothenicAcid']!)!,
                riboflavin: fixDecimal(nutrientFields['riboflavin']!)!,
                selenium: fixDecimal(nutrientFields['selenium']!)!,
                thiamin: fixDecimal(nutrientFields['thiamin']!)!,
                vitaminE: fixDecimal(nutrientFields['vitaminE']!)!,
                vitaminA: fixDecimal(nutrientFields['vitaminA']!)!,
                vitaminB12: fixDecimal(nutrientFields['vitaminB12']!)!,
                vitaminB6: fixDecimal(nutrientFields['vitaminB6']!)!,
                vitaminC: fixDecimal(nutrientFields['vitaminC']!)!,
                vitaminD: fixDecimal(nutrientFields['vitaminD']!)!,
                vitaminK: fixDecimal(nutrientFields['vitaminK']!)!,
                zinc: fixDecimal(nutrientFields['zinc']!)!)
        ),
        altMeasures2grams: transformedAlts,
        source: IngredientSource.custom,
        photo:
    );
    return result;
  }

  CustomIngState({
    required this.baseGrams,
    required this.name,
    required this.altMeasures,
    required this.nutrientFields,
  });

  CustomIngState copyWith({
    String? baseGrams_,
    String? name_,
    Map<String, String>? altMeasures_,
    Map<String, String>? nutrientFields_,
  }) {
    return CustomIngState(
        baseGrams: baseGrams_ ?? baseGrams,
        name: name_ ?? name,
        altMeasures: altMeasures_ ?? altMeasures,
        nutrientFields: nutrientFields_ ?? nutrientFields);
  }
}

class CustomIngErrors extends CustomIngState {
  factory CustomIngErrors.fromState(CustomIngState state) {
    return CustomIngErrors(
        baseGrams: state.baseGrams,
        name: state.name,
        altMeasures: state.altMeasures,
        nutrientFields: state.nutrientFields);
  }

  CustomIngErrors({
    required super.baseGrams,
    required super.name,
    required super.altMeasures,
    required super.nutrientFields,
  });
}

// class CustomIngInitial extends CustomIngState {}
