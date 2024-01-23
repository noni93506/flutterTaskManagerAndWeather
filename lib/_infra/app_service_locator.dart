import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:task_manager_and_weather/_infra/app_service_locator_blocs.dart';
import 'package:task_manager_and_weather/_infra/app_service_locator_repositories.dart';
import 'package:task_manager_and_weather/_infra/app_service_provider_use_cases.dart';

final getIt = GetIt.instance;

class AppServiceLocator {
  /// Initializes all dependencies declared inside the [AppServiceLocator].
  /// Should only be called before the [runApp] method
  static Future<void> setup() async {

    await AppServiceLocatorRepositories.setup(instance: getIt);
    await AppServiceLocatorUseCases.setup(instance: getIt);
    await AppServiceLocatorBlocs.setup(instance: getIt);
  }

  /// Sets the application general context so instances with context dependency can use it.
  /// Should be called with context under the [MaterialApp] (from the first parent's build method)
  static void registerAppContext(BuildContext context) {
    if (!GetIt.I.isRegistered<BuildContext>()) {
      GetIt.I.registerSingleton<BuildContext>(context);
    }
  }
}