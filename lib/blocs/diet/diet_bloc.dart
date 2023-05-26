import 'package:ari_utils/ari_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrition_app/domain.dart';
import 'package:nutrition_app/utils.dart';
part 'diet_event.dart';
part 'diet_state.dart';

class DietBloc extends Bloc<DietEvent, DietState> {
  DietBloc(Diet diet) : super(DietState(diet)) {
    on<DietEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<AddDay>((event, emit) {
      state.diet.createDay();
      emit(state.copyWith());
    });

  }
}
