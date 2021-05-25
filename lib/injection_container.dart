import 'package:get_it/get_it.dart';
import 'package:rma_lv8_universities_app/data/network/apis/university_api.dart';
import 'package:rma_lv8_universities_app/data/network/rest_client.dart';

final locator = GetIt.instance;

void setup() {
  locator.registerLazySingleton(() => RestClient());
  locator.registerLazySingleton(() => UniversityApi(locator()));
}
