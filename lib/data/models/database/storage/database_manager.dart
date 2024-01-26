import 'dart:math';
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

    final key = await _getEncryptionKey(); // tries to get or generate key
    final encryptedConfig = Configuration.local([
        TaskDB.schema,
      ],
      schemaVersion: 12,
      encryptionKey: key,
    );
    final encryptedRealm = Realm(encryptedConfig);  // config db
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

  closeDatabase() { // close DB
    _realm.close();
  }

  Future<void> saveObjects<T extends RealmObject>(List<T> obj) async { // async writing multiple data to db
    await _realm.writeAsync(() {
      _realm.addAll(obj, update: true);
    });
  }

  Future<void> saveObject<T extends RealmObject>(T obj) async { // async writing single data to db
    await _realm.writeAsync(() {
        _realm.add(obj, update: true);
    });
  }

  T? getObjectById<T extends RealmObject>(Object? id) { // find data in db by @RealmKey value
    if (id != null) {
      return _realm.find<T>(id);
    }
    return null;
  }

  List<T> getAllObjects<T extends RealmObject>() { // all db obj by type
    return _realm.all<T>().toList();
  }


  Future delete<T extends RealmObject>(T object) async { // delete single obj
    await _realm.writeAsync(() {
      _realm.delete(object);
    });
  }

  Future deleteMany<T extends RealmObject>(List<T> objects) async { // delete multiple obj
    await _realm.writeAsync(() {
      _realm.deleteMany(objects);
    });
  }

}