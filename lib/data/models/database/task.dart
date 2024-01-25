
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:task_manager_and_weather/data/models/database/task_db.dart';

part 'task.freezed.dart';

@freezed
class Task with _$Task {
  const Task._();

  const factory Task({
    required int id,
    required String title,
    required String description,
    required int category,
  }) = _Task;

  TaskDB get toDBObject => TaskDB(
    id,
    title,
    description,
    category,
  );
}