import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppSettingsStorage {
  static const String _keyIsFirstAppLaunchPerformed = "IS_FIRST_APP_LAUNCH_PERFORMED";

  final SharedPreferences _sharedPreferences;
  late final BehaviorSubject<bool> _isFirstAppLaunchPerformedSubject = BehaviorSubject.seeded(
      getIsFirstAppLaunchPerformed());

  AppSettingsStorage({
    required final SharedPreferences sharedPreferences,
  }) : _sharedPreferences = sharedPreferences;

  //region IsFirstAppLaunchPerformed
  bool getIsFirstAppLaunchPerformed() {
    return _sharedPreferences.getBool(_keyIsFirstAppLaunchPerformed) ?? false;
  }

  Future<void> storeIsFirstAppLaunchPerformed(
      {required final bool value}) async {
    await _sharedPreferences.setBool(_keyIsFirstAppLaunchPerformed, value);
    _isFirstAppLaunchPerformedSubject.add(value);
  }

  Stream<bool> listenIsFirstAppLaunchPerformed() {
    return _isFirstAppLaunchPerformedSubject.stream;
  }
//endregion
}