part of 'init_bloc.dart';

@immutable
abstract class InitState {}

class InitInitial extends InitState {}

class SuccessfulLoad extends InitState{
  final App app;
  SuccessfulLoad(this.app);
}
class FailedLoad extends InitState{
  final String basename;
  FailedLoad(this.basename);
}