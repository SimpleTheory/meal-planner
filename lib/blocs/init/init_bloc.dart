import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrition_app/domain.dart';
import 'package:path/path.dart';

part 'init_event.dart';
part 'init_state.dart';

class InitBloc extends Bloc<InitEvent, InitState> {
  InitBloc() : super(InitInitial()) {
    on<LoadFileInitEvent>((event, emit) async {
      FilePickerResult? result = await FilePicker.platform.pickFiles();
      if (result != null) {
        File file = File(result.files.single.path!);
        final text = file.readAsStringSync();
        try {
          App app = App.fromJson(text);
          // TODO If successful load app into master bloc
          // TODO If successful save app into hive
          emit(SuccessfulLoad(app));
        } on Exception catch (e) {
          emit(FailedLoad(basename(file.path)));
        }
      }
      else {
        return;
      }
    });
  }
}