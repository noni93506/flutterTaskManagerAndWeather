import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_manager_state.freezed.dart';

@freezed
class TaskManagerState with _$TaskManagerState {
  const TaskManagerState._();

  const factory TaskManagerState({
    required Exception? exception,
    required bool isLoading,
  }) = _TaskManagerState;

  factory TaskManagerState.initial() {
    return const TaskManagerState(
      exception: null,
      isLoading: false,
    );
  }
}
