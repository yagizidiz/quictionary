part of 'word_bloc.dart';

@immutable
abstract class WordState extends Equatable {
  const WordState();

  @override
  List<Object> get props => [];
}

class WordInitial extends WordState {
  const WordInitial();
}

class WordLoadingState extends WordState {
  const WordLoadingState();
}

class WordLoadedState extends WordState {
  final WordModel word;

  const WordLoadedState({required this.word});
}
