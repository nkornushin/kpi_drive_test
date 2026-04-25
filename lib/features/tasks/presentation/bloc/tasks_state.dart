import 'package:kpi_drive_test/features/tasks/domain/entities/kanban_stage_entity.dart';

enum TasksStatus {
  initial,
  loading,
  success,
  error,
}

class TasksState {
  const TasksState({
    this.status = TasksStatus.initial,
    this.stages,
    this.errorMessage,
  });

  final TasksStatus status;
  final List<KanbanStageEntity>? stages;
  final String? errorMessage;

  TasksState copyWith({
    TasksStatus? status,
    List<KanbanStageEntity>? stages,
    Object? errorMessage = _noValue,
  }) {
    return TasksState(
      status: status ?? this.status,
      stages: stages ?? this.stages,
      errorMessage: identical(errorMessage, _noValue) ? this.errorMessage : errorMessage as String?,
    );
  }
}

const Object _noValue = Object();
