import 'package:quictionary/data/api/word_api_client.dart';
import 'package:quictionary/models/word_model.dart';
import '../locator.dart';

class WordRepo {
  WordApiClient wordApiClient = locator<WordApiClient>();
  Future<WordModel?> getWordModel(String word) async {
    return await wordApiClient.getWord(word);
  }
}
