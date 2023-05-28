import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrition_app/domain.dart';
import 'package:nutrition_app/utils.dart';

part 'custom_ing_event.dart';
part 'custom_ing_state.dart';

class CustomIngBloc extends Bloc<CustomIngEvent, CustomIngState> {
  CustomIngBloc() : super(CustomIngState.initial()) {
    on<CustomIngEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
