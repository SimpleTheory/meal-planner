part of 'init_bloc.dart';

@immutable
abstract class InitEvent {}

class LoadFileInitEvent extends InitEvent {}

class CreatedNewSettings extends InitEvent {
  final Settings settings;
  CreatedNewSettings(this.settings);
}
