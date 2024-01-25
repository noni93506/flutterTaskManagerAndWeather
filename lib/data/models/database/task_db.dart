import 'package:realm/realm.dart';
import 'package:task_manager_and_weather/data/models/database/task.dart';

part 'task_db.g.dart';

@RealmModel()
class _TaskDB {
  @PrimaryKey() late int id;
  late String title;
  late String description;
  late int category;

  Task get toDomain => Task(
    id: id,
    title: title,
    description: description,
    category : category,
  );
}