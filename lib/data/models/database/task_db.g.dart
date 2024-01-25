// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_db.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class TaskDB extends _TaskDB with RealmEntity, RealmObjectBase, RealmObject {
  TaskDB(
    int id,
    String title,
    String description,
    int category,
  ) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'title', title);
    RealmObjectBase.set(this, 'description', description);
    RealmObjectBase.set(this, 'category', category);
  }

  TaskDB._();

  @override
  int get id => RealmObjectBase.get<int>(this, 'id') as int;
  @override
  set id(int value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get title => RealmObjectBase.get<String>(this, 'title') as String;
  @override
  set title(String value) => RealmObjectBase.set(this, 'title', value);

  @override
  String get description =>
      RealmObjectBase.get<String>(this, 'description') as String;
  @override
  set description(String value) =>
      RealmObjectBase.set(this, 'description', value);

  @override
  int get category => RealmObjectBase.get<int>(this, 'category') as int;
  @override
  set category(int value) => RealmObjectBase.set(this, 'category', value);

  @override
  Stream<RealmObjectChanges<TaskDB>> get changes =>
      RealmObjectBase.getChanges<TaskDB>(this);

  @override
  TaskDB freeze() => RealmObjectBase.freezeObject<TaskDB>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(TaskDB._);
    return const SchemaObject(ObjectType.realmObject, TaskDB, 'TaskDB', [
      SchemaProperty('id', RealmPropertyType.int, primaryKey: true),
      SchemaProperty('title', RealmPropertyType.string),
      SchemaProperty('description', RealmPropertyType.string),
      SchemaProperty('category', RealmPropertyType.int),
    ]);
  }
}
