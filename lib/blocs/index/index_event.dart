part of 'index_bloc.dart';

@immutable
abstract class IndexEvent {}

class AddDiet extends IndexEvent {
  final String name;

  AddDiet(this.name);
}

class DuplicateDiet extends IndexEvent {
  final Diet diet;

  DuplicateDiet(this.diet);
}

class RenameDiet extends IndexEvent {
  final Diet diet;
  final String newName;

  RenameDiet({required this.diet, required this.newName});
}
