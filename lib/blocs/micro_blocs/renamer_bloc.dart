import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';




class RenamerBloc extends Bloc<RenamerEvent, RenamerState> {
  RenamerBloc() : super(RenamerInitial()) {
    on<RenamerEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

@immutable
abstract class RenamerEvent {}

@immutable
abstract class RenamerState {}

class RenamerInitial extends RenamerState {}

