import 'package:ari_utils/ari_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrition_app/domain.dart';
import 'package:nutrition_app/utils.dart';
part 'diet_event.dart';
part 'diet_state.dart';
class DietBloc extends Bloc<DietEvent, DietState> {
  DietBloc(Diet diet) : super(DietState(diet)) {
    on<DietEvent>((event, emit) {});
    on<AddDay>((event, emit) {
      state.diet.createDay();
      emit(AddDayState(state.diet));
    });
    on<AddMealToDay>((event, emit){
      event.day.addDayMeal(event.meal);
      // EventLog.dayLog(name: 'addDayMeal', args: [event.meal], diet: state.diet, day: event.day).save();
      emit(AddMealToDayState(state.diet, event.day));
    });
    on<EditMealInDay>((event, emit){
      if (event.factory is Meal){
        event.app.updateMeal(event.mc.reference as Meal, event.factory as Meal);
      }
      else if (event.factory is Ingredient){
        event.app.updateBaseIngredient(event.mc.reference as Ingredient, event.factory as Ingredient);
      }
      final newMc = event.factory.toMealComponent('grams', event.mc.grams, event.factory);
      event.day.replaceMealInDay(event.index, newMc);
      // EventLog.dayLog(name: 'replaceMealInDay', diet: state.diet, day: event.day, args: [event.index, newMc]);
      emit(AddMealToDayState(state.diet, event.day));
    });
    on<AddIngredientToDay>((event, emit){
      event.day.addDayMealFromIng(event.ingredient);
      // EventLog.dayLog(name: 'addDayMealFromIng', args: [event.ingredient], diet: state.diet, day: event.day).save();
      emit(AddMealToDayState(state.diet, event.day));
    });
    
    on<MealUpdateGrams>((event, emit){
      event.day.updateMealServingSize(event.index, event.serving, event.value);
      // EventLog.dayLog(name: 'updateMealServingSize', diet: state.diet, day: event.day, args: [event.index, event.serving, event.value]).save();
      emit(MealUpdateGramsState(state.diet, event.day));
    });
    
    on<DeleteMealFromDay>((event, emit){
      event.day.deleteDayMeal(event.index);
      // EventLog.dayLog(name: 'deleteDayMeal', args: [event.index], diet: state.diet, day: event.day).save();
      emit(DeleteMealFromDayState(state.diet, event.day));

    });
    
    on<ReorderMealInDay>((event, emit){
      event.day.reorderMeal(event.old, event.new_);
      // EventLog.dayLog(name: 'reorderMeal', args: [event.old, event.new_], diet: state.diet, day: event.day).save();
      emit(ReorderMealInDayState(state.diet, event.day));
    });
    
    on<ReorderDay>((event, emit){
      state.diet.reorderDay(event.old, event.new_);
      emit(ReorderDayState(state.diet));
    });
    
    on<DuplicateDay>((event, emit){
      state.diet.duplicateDay(event.dayIndex);
      emit(DuplicateDayState(state.diet));
    });
    
    on<DeleteDay>((event, emit){
      state.diet.removeDay(event.day);
      if (state.diet.days.isEmpty){
        state.diet.createDay();
      }
      emit(DeleteDayState(state.diet));
    });
    on<DuplicateMealInDay>((event, emit){
      // if (current is Meal) {
      //   event.day.addDayMeal(event.meal as Meal);
      // }
      // else if (current is Ingredient){
      //   event.day.addDayMealFromIng(event.meal as Ingredient);
      // }
      event.day.duplicateDayMeal(event.meal);
      emit(AddMealToDayState(state.diet, event.day));
    });
  }
}
