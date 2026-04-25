import 'package:kpi_drive_test/features/tasks/domain/entities/paginated_list_entity.dart';
import 'package:kpi_drive_test/features/tasks/domain/entities/task_entity.dart';

enum TasksStatus {
  initial,
  loading,
  success,
  error,
}

class TasksState {
  const TasksState({
    this.status = TasksStatus.initial,
    this.tasks,
    this.errorMessage,
  });

  final TasksStatus status;
  final PaginatedListEntity<TaskEntity>? tasks;
  final String? errorMessage;

  TasksState copyWith({
    TasksStatus? status,
    PaginatedListEntity<TaskEntity>? tasks,
    Object? errorMessage = _noValue,
  }) {
    return TasksState(
      status: status ?? this.status,
      tasks: tasks ?? this.tasks,
      errorMessage: identical(errorMessage, _noValue)
          ? this.errorMessage
          : errorMessage as String?,
    );
  }
}

const Object _noValue = Object();
