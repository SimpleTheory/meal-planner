part of 'ingredients_page_bloc.dart';

class IngredientsPageState {
  App app;
  bool includeSubRecipes;
  List<MealComponentFactory> searchResults;
  String currentText = '';
  bool backReference = false;

  factory IngredientsPageState.initial(App app,
      {bool? include, bool backRef = false}) {
    return IngredientsPageState(
        app: app,
        includeSubRecipes: toBool(include),
        searchResults: toBool(include)
            ? app.ingredients
            : app.baseIngredients.values.toList(),
        backReference: backRef);
  }

  factory IngredientsPageState.fromState(IngredientsPageState state) =>
      IngredientsPageState(
          app: state.app,
          includeSubRecipes: state.includeSubRecipes,
          searchResults: state.searchResults,
          currentText: state.currentText,
          backReference: state.backReference);

  IngredientsPageState(
      {required this.app,
      required this.includeSubRecipes,
      required this.searchResults,
      String? currentText,
      this.backReference = false}) {
    if (currentText != null) {
      this.currentText = currentText;
    }
  }

  IngredientsPageState copyWith({
    App? app_,
    bool? includeSubRecipes_,
    List<MealComponentFactory>? searchResults_,
    String? currentText_,
    bool? backRef,
  }) {
    return IngredientsPageState(
        app: app_ ?? app,
        includeSubRecipes: includeSubRecipes_ ?? includeSubRecipes,
        searchResults: searchResults_ ?? List.from(searchResults),
        currentText: currentText_ ?? currentText,
        backReference: backRef ?? backReference);
  }
}

class IngPageSuccessfulCreation extends IngredientsPageState {
  Ingredient ingredient;

  IngPageSuccessfulCreation(
      {required super.app,
      required super.includeSubRecipes,
      required super.searchResults,
      required this.ingredient,
      required super.backReference});

  factory IngPageSuccessfulCreation.fromState(
          IngredientsPageState state, Ingredient newIngredient) =>
      IngPageSuccessfulCreation(
          app: state.app,
          includeSubRecipes: state.includeSubRecipes,
          searchResults: state.searchResults,
          ingredient: newIngredient,
          backReference: state.backReference);
}

class IngPageApiError extends IngredientsPageState {
  String message;

  IngPageApiError(
      {required this.message,
      required super.app,
      required super.includeSubRecipes,
      required super.searchResults,
      required super.currentText,
      required super.backReference});

  factory IngPageApiError.fromState(
          IngredientsPageState state, String message) =>
      IngPageApiError(
          app: state.app,
          includeSubRecipes: state.includeSubRecipes,
          searchResults: state.searchResults,
          message: message,
          currentText: state.currentText,
          backReference: state.backReference);
}

// class IngredientsPageInitial extends IngredientsPageState {}
