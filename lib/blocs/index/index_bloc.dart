import 'dart:async';
import 'package:ari_utils/ari_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrition_app/domain.dart';


part 'index_event.dart';
part 'index_state.dart';

final duplicateRegex = RegExp(r'\((\d+)\)$');

class IndexBloc extends Bloc<IndexEvent, IndexState> {
  IndexBloc(App app) : super(IndexState(app)) {
    on<IndexEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<AddDiet>((event, emit) async {
      state.app.addDiet(await Diet.create(event.name, state.app.settings));
      emit(state.copyWith());
    });
    on<RenameDiet>((event, emit) async {
      event.diet.name = event.newName;
      emit(state.copyWith());
    });
    on<DuplicateDiet>((event, emit) {
      Match? match = duplicateRegex.firstMatch(event.diet.name);
      String duplicateName = '${event.diet.name} (2)';
      if (match != null){
        duplicateName = '${event.diet.name} '
            '(${(int.parse(match.group(1)!) + 1)})';

      }
      state.app.addDiet(event.diet.copyWithDiet(name: duplicateName));
      emit(state.copyWith());
    });

  }
}
