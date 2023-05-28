part of 'custom_ing_bloc.dart';

bool invalidateNum(String s) => s.isEmpty || s == '.';

class CustomIngState {
  String baseGrams;
  String name;
  List<MapEntry<String, String>> altMeasures;
  Map<String, String> nutrientFields;
  Uri? image;
  Ingredient? refIngredient;

  factory CustomIngState.initial() => CustomIngState(
      baseGrams: '',
      name: '',
      altMeasures: [const MapEntry('', '')],
      nutrientFields: {for (Nutrient nut in nutList) nut.name: '0'});

  factory CustomIngState.fromIngredient(Ingredient ref) =>
    CustomIngState(
        baseGrams: ref.baseNutrient.grams.toString(),
        name: ref.name,
        altMeasures: ref.altMeasures2grams.map((key, value) => MapEntry(key, value.toString())).entries.toList(),
        nutrientFields: (ref.baseNutrient.nutrients.attributes__ as Map<String, Nutrient>).map((key, value) => MapEntry(key, value.value.toString())),
        image: ref.photo
    );

  bool isInvalid() {
    if (baseGrams.isEmpty || name.isEmpty || baseGrams == '.') {
      return true;
    }
    for (MapEntry<String, String> alt_measure in altMeasures) {
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


  Future<Ingredient> toIngredient() async {
    // Todo: Save image more as file and use that as Image
    final transformedAlts =
        Map<String, num>.fromEntries(altMeasures.map<MapEntry<String, num>>((e) => MapEntry<String, num>(e.key, fixDecimal(e.value)!)));
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
        photo: image?.path == null ? null : await saveImage(image!.path)
    );
    return result;
  }

  CustomIngState({
    required this.baseGrams,
    required this.name,
    required this.altMeasures,
    required this.nutrientFields,
    this.image,
    this.refIngredient
  });

  CustomIngState copyWith({
    String? baseGrams_,
    String? name_,
    List<MapEntry<String, String>>? altMeasures_,
    Map<String, String>? nutrientFields_,
    Uri? img,
    Ingredient? ref
  }) {
    return CustomIngState(
        baseGrams: baseGrams_ ?? baseGrams,
        name: name_ ?? name,
        altMeasures: altMeasures_ ?? altMeasures,
        nutrientFields: nutrientFields_ ?? nutrientFields,
        refIngredient: ref ?? refIngredient,
        image: img ?? image
    );
  }

  factory CustomIngState.fromState(CustomIngState state) {
    return CustomIngState(
        baseGrams: state.baseGrams,
        name: state.name,
        altMeasures: state.altMeasures,
        nutrientFields: state.nutrientFields,
        refIngredient: state.refIngredient,
        image: state.image
    );
  }
}

class CustomIngErrors extends CustomIngState {
  factory CustomIngErrors.fromState(CustomIngState state) {
    return CustomIngErrors(
        baseGrams: state.baseGrams,
        name: state.name,
        altMeasures: state.altMeasures,
        nutrientFields: state.nutrientFields,
        refIngredient: state.refIngredient,
        image: state.image
    );
  }

  CustomIngErrors({
    required super.baseGrams,
    required super.name,
    required super.altMeasures,
    required super.nutrientFields,
    super.image,
    super.refIngredient
  });
}

class CustomIngAddedPhoto extends CustomIngState {
  factory CustomIngAddedPhoto.fromState(CustomIngState state) {
    return CustomIngAddedPhoto(
        baseGrams: state.baseGrams,
        name: state.name,
        altMeasures: state.altMeasures,
        nutrientFields: state.nutrientFields,
        refIngredient: state.refIngredient,
        image: state.image
    );
  }

  CustomIngAddedPhoto({
    required super.baseGrams,
    required super.name,
    required super.altMeasures,
    required super.nutrientFields,
    super.image,
    super.refIngredient
  });
}

class CustomIngSuccess extends CustomIngState {
  Ingredient ingredient;

  factory CustomIngSuccess.fromState(CustomIngState state, Ingredient ingredient) {
    return CustomIngSuccess(
        baseGrams: state.baseGrams,
        name: state.name,
        altMeasures: state.altMeasures,
        nutrientFields: state.nutrientFields,
        refIngredient: state.refIngredient,
        image: state.image,
        ingredient: ingredient
    );
  }

  CustomIngSuccess({
    required super.baseGrams,
    required super.name,
    required super.altMeasures,
    required super.nutrientFields,
    super.image,
    super.refIngredient,
    required this.ingredient
  });
}

// class CustomIngInitial extends CustomIngState {}
