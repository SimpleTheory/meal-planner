import 'package:ari_utils/ari_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrition_app/api/exceptions.dart';
import 'package:nutrition_app/domain.dart';
import 'package:nutrition_app/utils.dart';

part 'ingredients_page_event.dart';

part 'ingredients_page_state.dart';

class IngredientsPageBloc
    extends Bloc<IngredientsPageEvent, IngredientsPageState> {
  IngredientsPageBloc(App app, [bool? include])
      : super(IngredientsPageState.initial(app, toBool(include))) {
    on<IngredientsPageEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<IngPageAPIErrorEvent>((event, emit) {
      emit(IngPageApiError.fromState(state, event.message));
    });
    on<UpdateSearchIng>((event, emit) {
      state.currentText = event.searchVal;
      List<MealComponentFactory> base = state.includeSubRecipes
          ? state.app.ingredients
          : state.app.baseIngredients.values.toList();
      List<MealComponentFactory> result = base
          .where((element) => element.name
              .toLowerCase()
              .startsWith(event.searchVal.toLowerCase()))
          .toList();
      if (result.isNotEmpty) {
        emit(state.copyWith(searchResults_: result));
        return;
      }
      result = base
          .where((element) => element.name
              .toLowerCase()
              .contains(event.searchVal.toLowerCase()))
          .toList();
      emit(state.copyWith(searchResults_: result));
    });
    on<OnSubmitSolo>((event, emit) {
      if (event.ingToReplace != null){
        state.app.updateBaseIngredient(event.ingToReplace!, event.ingredient);
      }
      else{
        state.app.baseIngredients[event.ingredient.name] = event.ingredient;
      }

      emit(IngPageSuccessfulCreation.fromState(
          IngredientsPageState.initial(state.app, state.includeSubRecipes),
          event.ingredient
      ));
      // saveApp(state.app);
    });
    on<IngPageIncludeSubRecipes>((event, emit){
      state.includeSubRecipes = event.toggle;
      add(UpdateSearchIng(state.currentText));
    });
    on<IngDuplicate>((event, emit){
      if (event.ingredient is Ingredient){
        app.addBaseIngredient((event.ingredient as Ingredient).copyWithIngredient(name: '${event.ingredient.name} (duplicate)'));
      }
      else{
        app.addMeal((event.ingredient as Meal).copyWithMeal(name: '${event.ingredient.name} (duplicate)'));
      }
      add(UpdateSearchIng(state.currentText));

    });
    on<IngDelete>((event, emit){
      if (event.ingredient is Ingredient){
        app.deleteBaseIngredient(event.ingredient as Ingredient);
      }
      else{
        app.deleteMeal(event.ingredient as Meal);
      }
      add(UpdateSearchIng(state.currentText));
    });
  }
}
