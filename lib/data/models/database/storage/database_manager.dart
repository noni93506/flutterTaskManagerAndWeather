import 'dart:math';
import 'package:convert/convert.dart';
import 'package:flutter/foundation.dart';
import 'package:realm/realm.dart';
import 'package:task_manager_and_weather/data/models/database/storage/secure_local_storage.dart';
import 'package:task_manager_and_weather/data/models/database/task_db.dart';

class DatabaseManager {
  final SecureLocalStorage _secureLocalStorage;

  late final Realm _realm;
  late Future _doneFuture;

  DatabaseManager({
    required SecureLocalStorage secureLocalStorage,
  }): _secureLocalStorage = secureLocalStorage {
    _doneFuture = _initiateDatabase();
  }

  Future get initialized => _doneFuture;

  _initiateDatabase() async {  // init function for local DB

    final key = await _getEncryptionKey();
    if (kDebugMode) {
      final keyHash = hex.encode(key ?? []);
      debugPrint('key hash: $keyHash');
    }
    final encryptedConfig = Configuration.local([
        TaskDB.schema,
      ],
      schemaVersion: 12,
      encryptionKey: key,
    );
    final encryptedRealm = Realm(encryptedConfig);
    debugPrint('Realm location: ${encryptedConfig.path}');
    _realm = encryptedRealm;
  }

  List<int> get _generateNewEncryptionKey => List<int>.generate(64, (i) => Random().nextInt(256));
  Future<List<int>?> _getEncryptionKey() async {
    final key = await _secureLocalStorage.getDatabaseKey();
    if (key == null) {
      final newKey = _generateNewEncryptionKey;
      await _secureLocalStorage.setupDatabaseKey(newKey);
      return newKey;
    } else {
      return key;
    }
  }

  closeDatabase() {
    _realm.close();
  }

  Future<void> saveObjects<T extends RealmObject>(List<T> obj) async {
    await _realm.writeAsync(() {
      _realm.addAll(obj, update: true);
    });
  }

  Future<void> saveObject<T extends RealmObject>(T obj) async {
    await _realm.writeAsync(() {
        _realm.add(obj, update: true);
    });
  }

  T? getObjectById<T extends RealmObject>(Object? id) {
    if (id != null) {
      return _realm.find<T>(id);
    }
    return null;
  }

  List<T> getAllObjects<T extends RealmObject>() {
    return _realm.all<T>().toList();
  }

  List<T> getObjectsWithQuery<T extends RealmObject>(String query, [List<Object?> args = const []])  {
    return _realm.query<T>(query, args).toList();
  }

  Future delete<T extends RealmObject>(T object) async {
    await _realm.writeAsync(() {
      _realm.delete(object);
    });
  }

  Future deleteMany<T extends RealmObject>(List<T> objects) async {
    await _realm.writeAsync(() {
      _realm.deleteMany(objects);
    });
  }

}