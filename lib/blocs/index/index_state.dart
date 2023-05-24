part of 'index_bloc.dart';

@immutable
class IndexState {
  final App app;

  const IndexState(this.app);

  IndexState copyWith({
    App? app,
  }) {
    return IndexState(app ?? this.app);
  }
}


