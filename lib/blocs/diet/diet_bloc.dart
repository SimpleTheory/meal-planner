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
      emit(AddMealToDayState(state.diet, event.day));
    });
    
    on<MealUpdateGrams>((event, emit){
      event.day.updateMealServingSize(event.index, event.serving, event.value);
      emit(MealUpdateGramsState(state.diet, event.day));
    });
    
    on<DeleteMealFromDay>((event, emit){
      event.day.deleteDayMeal(event.index);
      emit(DeleteMealFromDayState(state.diet, event.day));
    });
    
    on<ReorderMealInDay>((event, emit){
      event.day.meals.reIndex(event.old, event.new_, inPlace: true);
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
      emit(DeleteDayState(state.diet));
    });
    on<DuplicateMealInDay>((event, emit){
      event.day.meals.add(event.meal);
      emit(AddMealToDayState(state.diet, event.day));
    });
  }
}
