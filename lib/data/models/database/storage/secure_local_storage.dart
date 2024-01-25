import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureLocalStorage {

  // ignore: prefer_typing_uninitialized_variables
  late final FlutterSecureStorage _storage;
  late final AndroidOptions _androidOptions;
  late final IOSOptions _iosOptions;

  final _databaseEncryptionKey = "DATABASE_KEY";

  SecureLocalStorage() {
    _initiateStorage();
  }

  _initiateStorage() async {
    const aOptions = AndroidOptions(encryptedSharedPreferences: true);
    const iOptions = IOSOptions(
      accessibility: KeychainAccessibility.first_unlock,
    );
    _androidOptions = aOptions;
    _iosOptions = iOptions;

    _storage = const FlutterSecureStorage(
      aOptions: aOptions,
      iOptions: iOptions,
    );
  }

  Future<void> setupDatabaseKey(List<int> key) async {
    final keyString = key.map((e) => e.toString()).join(',');
    await _storage.write(key: _databaseEncryptionKey, value: keyString, iOptions: _iosOptions, aOptions: _androidOptions);
  }

  Future<List<int>?> getDatabaseKey() async {
    String? keyString = await _storage.read(key: _databaseEncryptionKey, iOptions: _iosOptions, aOptions: _androidOptions);
    print(keyString.hashCode);
    List<int>? keyRestored = keyString?.split(',').map((e) => int.parse(e)).toList();
    return keyRestored;
  }

  Future deleteDatabaseKey() async {
    await _storage.delete(key: _databaseEncryptionKey);
  }
}