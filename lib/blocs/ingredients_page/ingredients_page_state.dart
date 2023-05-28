part of 'ingredients_page_bloc.dart';

class IngredientsPageState {
  App app;
  bool includeSubRecipes;
  List<MealComponentFactory> searchResults;

  factory IngredientsPageState.initial(App app, [bool? include]) {
    return IngredientsPageState(
        app: app,
        includeSubRecipes: toBool(include),
        searchResults: toBool(include)
            ? app.ingredients
            : app.baseIngredients.values.toList());
  }
  factory IngredientsPageState.fromState(IngredientsPageState state) =>
    IngredientsPageState(app: state.app, includeSubRecipes: state.includeSubRecipes, searchResults: state.searchResults);


  IngredientsPageState({
    required this.app,
    required this.includeSubRecipes,
    required this.searchResults,
  });

  IngredientsPageState copyWith({
    App? app_,
    bool? includeSubRecipes_,
    List<MealComponentFactory>? searchResults_,
  }) {
    return IngredientsPageState(
        app: app_ ?? app,
        includeSubRecipes: includeSubRecipes_ ?? includeSubRecipes,
        searchResults: searchResults_ ?? List.from(searchResults));
  }
}

class IngPageSuccessfulCreation extends IngredientsPageState {
  Ingredient newIngredient;
  IngPageSuccessfulCreation({
    required super.app,
    required super.includeSubRecipes,
    required super.searchResults,
    required this.newIngredient
  });

  factory IngPageSuccessfulCreation.fromState(
          IngredientsPageState state, Ingredient newIngredient) =>
      IngPageSuccessfulCreation(
          app: state.app,
          includeSubRecipes: state.includeSubRecipes,
          searchResults: state.searchResults,
          newIngredient: newIngredient
      );

}

class IngPageApiError extends IngredientsPageState{
  String message;
  IngPageApiError({
    required this.message,
    required super.app,
    required super.includeSubRecipes,
    required super.searchResults,
  });
  factory IngPageApiError.fromState(IngredientsPageState state, String message) =>
      IngPageApiError(app: state.app, includeSubRecipes: state.includeSubRecipes, searchResults: state.searchResults, message: message);
}

// class IngredientsPageInitial extends IngredientsPageState {}
