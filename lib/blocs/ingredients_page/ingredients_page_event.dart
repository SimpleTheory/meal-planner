part of 'ingredients_page_bloc.dart';

abstract class IngredientsPageEvent {}

class OnSubmitSolo extends IngredientsPageEvent {
  Ingredient ingredient;

  OnSubmitSolo(this.ingredient);
}
class OnSubmitWithRef extends IngredientsPageEvent {}
class UpdateSearchIng extends IngredientsPageEvent {
  String searchVal;

  UpdateSearchIng(this.searchVal);
}
class IngPageAPIErrorEvent extends IngredientsPageEvent{
  String message;

  IngPageAPIErrorEvent(this.message);
}