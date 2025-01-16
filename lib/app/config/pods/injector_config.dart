import 'package:fonta_app/app/utils/shared_pref.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void setup() {
  //COMMON
  sl.registerLazySingleton(() => SharedPrefs());
}
