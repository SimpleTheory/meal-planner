part of 'ingredients_page_bloc.dart';

class IngredientsPageState {
  App app;
  bool includeSubRecipes;
  List<MealComponentFactory> searchResults;
  String currentText = '';
  void Function(BuildContext context, MealComponentFactory ingredient)? onTileTap;

  factory IngredientsPageState.initial(App app, [bool? include, Function(BuildContext context, MealComponentFactory ingredient)? onTileTap]) {
    return IngredientsPageState(
        app: app,
        includeSubRecipes: toBool(include),
        searchResults: toBool(include)
            ? app.ingredients
            : app.baseIngredients.values.toList(),
        onTileTap: onTileTap
    );
  }
  factory IngredientsPageState.fromState(IngredientsPageState state) =>
    IngredientsPageState(app: state.app, includeSubRecipes: state.includeSubRecipes, searchResults: state.searchResults, currentText: state.currentText, onTileTap: state.onTileTap);


  IngredientsPageState({
    required this.app,
    required this.includeSubRecipes,
    required this.searchResults,
    String? currentText,
    this.onTileTap
  }){if (currentText != null){this.currentText = currentText;}}

  IngredientsPageState copyWith({
    App? app_,
    bool? includeSubRecipes_,
    List<MealComponentFactory>? searchResults_,
    String? currentText_,
    Function(BuildContext context, MealComponentFactory ingredient)? onTileTap,


  }) {
    return IngredientsPageState(
        app: app_ ?? app,
        includeSubRecipes: includeSubRecipes_ ?? includeSubRecipes,
        searchResults: searchResults_ ?? List.from(searchResults),
        currentText: currentText_ ?? currentText,
        onTileTap: onTileTap ?? this.onTileTap
    );
  }
}

class IngPageSuccessfulCreation extends IngredientsPageState {
  Ingredient newIngredient;
  IngPageSuccessfulCreation({
    required super.app,
    required super.includeSubRecipes,
    required super.searchResults,
    required this.newIngredient,
    required super.onTileTap
  });

  factory IngPageSuccessfulCreation.fromState(
          IngredientsPageState state, Ingredient newIngredient) =>
      IngPageSuccessfulCreation(
          app: state.app,
          includeSubRecipes: state.includeSubRecipes,
          searchResults: state.searchResults,
          newIngredient: newIngredient,
          onTileTap: state.onTileTap
      );

}

class IngPageApiError extends IngredientsPageState{
  String message;
  IngPageApiError({
    required this.message,
    required super.app,
    required super.includeSubRecipes,
    required super.searchResults,
    required super.currentText,
    required super.onTileTap
  });
  factory IngPageApiError.fromState(IngredientsPageState state, String message) =>
      IngPageApiError(app: state.app, includeSubRecipes: state.includeSubRecipes, searchResults: state.searchResults, message: message, currentText: state.currentText, onTileTap: state.onTileTap);
}

// class IngredientsPageInitial extends IngredientsPageState {}
