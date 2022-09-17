part of 'word_bloc.dart';

@immutable
abstract class WordEvent extends Equatable {
  const WordEvent();

  @override
  List<Object> get props => [];
}

class WordSearchEvent extends WordEvent {
  final String word;

  const WordSearchEvent({required this.word});
}

class WordSaveEvent extends WordEvent {
  final String word;
  final WordModel wordModel;

  const WordSaveEvent({required this.wordModel, required this.word});
}

class WordDismissEvent extends WordEvent {}

class WordFetchDetailEvent extends WordEvent {
  final String word;
  final WordModel wordModel;

  const WordFetchDetailEvent({required this.wordModel, required this.word});
}
