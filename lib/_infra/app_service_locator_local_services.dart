import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_manager_and_weather/data/models/database/storage/database_manager.dart';
import 'package:task_manager_and_weather/data/models/database/storage/secure_local_storage.dart';

// all database dependency init
class AppServiceLocatorLocalServices {
  static Future<void> setup({required GetIt instance}) async {
    instance.registerSingleton(await SharedPreferences.getInstance());
    instance.registerLazySingleton<SecureLocalStorage>(() => SecureLocalStorage());
    instance.registerLazySingleton<DatabaseManager>(
      () => DatabaseManager(
        secureLocalStorage: instance<SecureLocalStorage>(),
      )
    );
  }
}