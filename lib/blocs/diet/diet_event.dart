part of 'diet_bloc.dart';

@immutable
abstract class DietEvent {}

class RefreshDietEvent extends DietEvent{}
void refreshDiet(BuildContext context){context.read<DietBloc>().add(RefreshDietEvent());}
class AddDay extends DietEvent{}
// class AddMealToDay extends DietEvent{}
// class MealUpdateGrams extends DietEvent{}
// class DeleteMealFromDay extends DietEvent{}
// class AddMealToDay extends DietEvent{}
// class ReorderMealInDay extends DietEvent{} //
// class ReOrderDay extends DietEvent{}
// class DuplicateDay extends DietEvent{}
// class DeleteDay extends DietEvent{}
// class dx extends DietEvent{}
