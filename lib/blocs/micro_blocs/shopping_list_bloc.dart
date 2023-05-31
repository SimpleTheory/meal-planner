import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrition_app/domain.dart';

class ShoppingListBloc extends Bloc<ShoppingListEvent, ShoppingListState> {
  ShoppingListBloc(Diet diet) : super(ShoppingListState.init(diet)) {
    on<ShoppingListEvent>((event, emit) {
      
    });
    on<ReIndexItem>((event, emit){
      final movedItem = state.shoppingList[event.oldListIndex].value.removeAt(event.oldItemIndex);
      state.shoppingList[event.newListIndex].value.insert(event.newItemIndex, movedItem);
      emit(ShoppingListState.onMovement(state.diet, state.shoppingList));
    });
    on<ReIndexList>((event, emit){
      // final copy = List<MapEntry<String, List<MealComponent>>>.from(state.shoppingList);
      final movedList = state.shoppingList.removeAt(event.oldListIndex);
      state.shoppingList.insert(event.newListIndex, movedList);
      emit(ShoppingListState.onMovement(state.diet, state.shoppingList));

    });
  }
}

// @immutable
class ShoppingListEvent {}
class ReIndexItem extends ShoppingListEvent {
  final int oldItemIndex;
  final int oldListIndex;
  final int newItemIndex;
  final int newListIndex;

  ReIndexItem({
    required this.oldItemIndex,
    required this.oldListIndex,
    required this.newItemIndex,
    required this.newListIndex,
  });
}
class ReIndexList extends ShoppingListEvent {
  final int oldListIndex;
  final int newListIndex;

  ReIndexList(this.oldListIndex, this.newListIndex);
}

// @immutable
class ShoppingListState {
  final Diet diet;
  List<MapEntry<String, List<MealComponent>>> shoppingList;
  // 'Good': initShoppingList(),
  // 'Running Low': [],
  // 'Out of Stock': [],
  // 'On the Way': []

  ShoppingListState(this.diet, {required this.shoppingList});

  factory ShoppingListState.init(Diet diet){
    diet.updateShoppingList();
    final shoppingList = diet.shoppingList.entries.toList();
    return ShoppingListState(diet, shoppingList: shoppingList);
  }
  ShoppingListState.onMovement(this.diet, this.shoppingList){
    diet.shoppingList = Map<String, List<MealComponent>>.fromEntries(shoppingList);
    print(diet.shoppingList.keys.toList());
  }
}

// class ShoppingListInitial extends ShoppingListState {}
