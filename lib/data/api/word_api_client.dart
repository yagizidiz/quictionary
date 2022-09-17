import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:quictionary/models/word_model.dart';

class WordApiClient {
  Future<WordModel?> getWord(String word) async {
    var response = await Dio()
        .get("https://api.dictionaryapi.dev/api/v2/entries/en/$word");
    List<dynamic> res = response.data;
    print(res.elementAt(0));
    WordModel wordModel = WordModel.fromJson(res.elementAt(0));
    return wordModel;
  }
}
