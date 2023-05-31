part of 'meal_maker_bloc.dart';

class MealMakerState {
  String servings;
  String name;
  List<MapEntry<String, String>> altMeasures;
  String notes;
  bool subRecipe;
  List<MealComponent> mealComponents;
  Uri? image;
  Meal? refIngredient;
  bool showErrors;

  num get totalGrams => mealComponents.isEmpty
      ? 0
      : mealComponents
          .map((e) => e.grams)
          .toList()
          .reduce((previous, current) => previous + current);

  num get servingGrams =>
      !validServing() ? 0 : totalGrams / int.parse(servings);

  Nutrients get nutrients =>
      Nutrients.sum(mealComponents.map((e) => e.nutrients)) /
      (validServing() ? int.parse(servings) : 1);

  bool validServing() => servings.isNotEmpty && int.parse(servings) > 0;

  // <editor-fold desc="Construction">
  MealMakerState(
      {required this.servings,
      required this.name,
      required this.altMeasures,
      required this.notes,
      required this.subRecipe,
      required this.mealComponents,
      this.image,
      this.refIngredient,
      this.showErrors = false});

  factory MealMakerState.fromNew() {
    return MealMakerState(
        servings: '1',
        name: '',
        altMeasures: {'': ''}.entries.toList(),
        notes: '',
        subRecipe: false,
        mealComponents: <MealComponent>[]);
  }

  factory MealMakerState.fromMeal(Meal ref) {
    return MealMakerState(
        servings: ref.servings.toString(),
        name: ref.name,
        altMeasures: ref.altMeasures2grams
            .map((key, value) => MapEntry(key, value.toString()))
            .entries
            .toList(),
        notes: ref.notes,
        subRecipe: ref.isSubRecipe,
        mealComponents: ref.ingredients,
        refIngredient: ref,
        image: ref.photo);
  }

  MealMakerState copyWith(
      {String? servings,
      String? name,
      List<MapEntry<String, String>>? altMeasures,
      String? notes,
      bool? subRecipe,
      List<MealComponent>? mealComponents,
      Uri? image,
      Meal? refIngredient,
      bool? showErrors}) {
    return MealMakerState(
        servings: servings ?? this.servings,
        name: name ?? this.name,
        altMeasures: altMeasures ?? List.from(this.altMeasures),
        notes: notes ?? this.notes,
        subRecipe: subRecipe ?? this.subRecipe,
        mealComponents: mealComponents ?? List.from(this.mealComponents),
        image: image ?? this.image,
        refIngredient: refIngredient ?? this.refIngredient,
        showErrors: showErrors ?? this.showErrors);
  }

// </editor-fold>
  bool containsSelf() => mealComponents.map((e) => e.reference).contains(refIngredient);
  bool isInvalid() =>
      name.isEmpty ||
      !validServing() ||
      nutrients == zeroNut ||
      containsSelf();

  Future<Meal> toMeal() async {
    final transformedAlts = Map<String, num>.fromEntries(altMeasures
        .where((element) => element.key != '')
        .map((e) => MapEntry<String, num>(e.key, fixDecimal(e.value)!)));
    Uri? finalImage;
    if (image == null){
      // pass (needed to not trigger next else if)
    }
    else if (image!.scheme == 'file') {
      finalImage = await saveImage(image!.path);
    } else {
      finalImage = image;
    }
    return Meal(
        name: name,
        servings: int.parse(servings),
        ingredients: mealComponents,
        isSubRecipe: subRecipe,
        photo: finalImage,
        notes: notes,
        alt2grams: transformedAlts);
  }
}

class MMError extends MealMakerState {
  MMError(
      {required super.servings,
      required super.name,
      required super.altMeasures,
      required super.notes,
      required super.subRecipe,
      required super.mealComponents,
      super.image,
      super.refIngredient,
      super.showErrors = true});

  MMError copyWithMMError(
      {String? servings,
      String? name,
      List<MapEntry<String, String>>? altMeasures,
      String? notes,
      bool? subRecipe,
      List<MealComponent>? mealComponents,
      Uri? image,
      Meal? refIngredient,
      bool? showErrors}) {
    return MMError(
        servings: servings ?? this.servings,
        name: name ?? this.name,
        altMeasures: altMeasures ?? List.from(this.altMeasures),
        notes: notes ?? this.notes,
        subRecipe: subRecipe ?? this.subRecipe,
        mealComponents: mealComponents ?? List.from(this.mealComponents),
        image: image ?? this.image,
        refIngredient: refIngredient ?? this.refIngredient,
        showErrors: showErrors ?? this.showErrors);
  }

  factory MMError.fromState(MealMakerState state) => MMError(
      servings: state.servings,
      name: state.name,
      altMeasures: state.altMeasures,
      notes: state.notes,
      subRecipe: state.subRecipe,
      mealComponents: state.mealComponents,
      showErrors: true,
      refIngredient: state.refIngredient,
      image: state.image);
}

class MMChangeGrams extends MealMakerState {
  MMChangeGrams(
      {required super.servings,
      required super.name,
      required super.altMeasures,
      required super.notes,
      required super.subRecipe,
      required super.mealComponents,
      super.image,
      super.refIngredient,
      super.showErrors = false});

  MMChangeGrams copyWithMMChangeGrams(
      {String? servings,
      String? name,
      List<MapEntry<String, String>>? altMeasures,
      String? notes,
      bool? subRecipe,
      List<MealComponent>? mealComponents,
      Uri? image,
      Meal? refIngredient,
      bool? showErrors}) {
    return MMChangeGrams(
        servings: servings ?? this.servings,
        name: name ?? this.name,
        altMeasures: altMeasures ?? List.from(this.altMeasures),
        notes: notes ?? this.notes,
        subRecipe: subRecipe ?? this.subRecipe,
        mealComponents: mealComponents ?? List.from(this.mealComponents),
        image: image ?? this.image,
        refIngredient: refIngredient ?? this.refIngredient,
        showErrors: showErrors ?? this.showErrors);
  }

  factory MMChangeGrams.fromState(MealMakerState state) => MMChangeGrams(
      servings: state.servings,
      name: state.name,
      altMeasures: state.altMeasures,
      notes: state.notes,
      subRecipe: state.subRecipe,
      mealComponents: state.mealComponents,
      showErrors: state.showErrors,
      refIngredient: state.refIngredient,
      image: state.image);
}

class MMSuccess extends MealMakerState {
  Meal meal;

  MMSuccess(
      {required this.meal,
      required super.servings,
      required super.name,
      required super.altMeasures,
      required super.notes,
      required super.subRecipe,
      required super.mealComponents,
      super.image,
      super.refIngredient,
      super.showErrors = false});

  factory MMSuccess.fromState(MealMakerState state, Meal meal) => MMSuccess(
      meal: meal,
      servings: state.servings,
      name: state.name,
      altMeasures: state.altMeasures,
      notes: state.notes,
      subRecipe: state.subRecipe,
      mealComponents: state.mealComponents,
      refIngredient: state.refIngredient,
      image: state.image);
}

// class MealMakerInitial extends MealMakerState {}
