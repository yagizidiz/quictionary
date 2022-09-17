import 'package:get_it/get_it.dart';
import 'data/api/word_api_client.dart';
import 'data/word_repository.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => WordApiClient());
  locator.registerLazySingleton(() => WordRepo());
}