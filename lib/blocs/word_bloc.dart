import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:quictionary/models/word_model.dart';
import '../data/word_repository.dart';
import '../locator.dart';

part 'word_event.dart';

part 'word_state.dart';

class WordBloc extends Bloc<WordEvent, WordState> {
  final WordRepo wordRepo = locator<WordRepo>();

  WordBloc() : super(const WordInitial()) {
    on<WordSearchEvent>((event, emit) async {
      emit(const WordLoadingState());
      WordModel? wordModel = await wordRepo.getWordModel(event.word);
      if (wordModel != null) {
        emit(WordLoadedState(word: wordModel));
      } else {
        emit(const WordInitial());
      }
    });
    on<WordSaveEvent>((event, emit) async {});
    on<WordDismissEvent>((event, emit) async {
      emit(const WordInitial());
    });
  }
}
