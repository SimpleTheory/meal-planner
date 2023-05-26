part of 'diet_bloc.dart';

@immutable
class DietState {
  final Diet diet;
  const DietState(this.diet);

  DietState copyWith({Diet? diet_,}) {
    return DietState(diet_ ?? diet);
  }
}


class RefreshDietState extends DietState {
  const RefreshDietState(super.diet);
}

