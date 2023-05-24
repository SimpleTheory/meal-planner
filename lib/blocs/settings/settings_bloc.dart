import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrition_app/domain.dart';


part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc(Settings settings) : super(SettingsState(settings)) {
    // TODO
    on<MeasureUpdate>((event, emit) {
      state.settings.measure = event.measure;
      emit(state);
    });
    on<CmUpdate>((event, emit) {
      if (event.cm.isNotEmpty) {
        state.settings.anthroMetrics.cm = int.parse(event.cm);
        emit(state);
      }
    });
    on<InchesUpdate>((event, emit) {
      if (event.inches.isNotEmpty) {
        state.settings.anthroMetrics.inches = int.parse(event.inches);
        emit(state);
      }
    });
    on<FeetUpdate>((event, emit) {
      if (event.feet.isNotEmpty) {
        state.settings.anthroMetrics.feet = int.parse(event.feet);
        emit(state);
      }
    });
    on<AgeUpdate>((event, emit) {
      if (event.age.isNotEmpty) {
        state.settings.anthroMetrics.age = int.parse(event.age);
        emit(state);
      }
    });
    on<WeightUpdate>((event, emit) {
      if (event.weight.isNotEmpty) {
        state.settings.anthroMetrics.weight = int.parse(event.weight);
        emit(state);
      }
    });
    on<KgUpdate>((event, emit) {
      if (event.kg.isNotEmpty) {
        state.settings.anthroMetrics.kg = int.parse(event.kg);
        emit(state);
      }
    });
    on<ActivityUpdate>((event, emit) {
      state.settings.anthroMetrics.activity = event.activity;
      emit(state);
    });
    on<SexUpdate>((event, emit) {
      state.settings.anthroMetrics.sex = event.sex;
      emit(state);
    });
    on<ApiKeyUpdate>((event, emit) {
      state.settings.apikey = event.apiKey;
      emit(state);
    });
    on<AppIdUpdate>((event, emit) {
      state.settings.appId = event.appId;
      emit(state);
    });
    on<DarkModeUpdate>((event, emit) {
      state.settings.darkMode = event.darkMode;
      emit(SettingsStateDarkModeUpdate(state.settings));
    });
  }
}
