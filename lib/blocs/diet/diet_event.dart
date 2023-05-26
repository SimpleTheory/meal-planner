part of 'diet_bloc.dart';

@immutable
abstract class DietEvent {}

class RefreshDietEvent extends DietEvent{}
void refreshDiet(BuildContext context){context.read<DietBloc>().add(RefreshDietEvent());}
class AddDay extends DietEvent{}
// class x extends DietEvent{}
// class x extends DietEvent{}
// class x extends DietEvent{}
// class dx extends DietEvent{}
// class dx extends DietEvent{}
