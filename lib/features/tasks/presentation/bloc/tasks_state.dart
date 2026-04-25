import 'package:kpi_drive_test/features/tasks/domain/entities/kanban_stage_entity.dart';
import 'package:kpi_drive_test/features/tasks/data/models/get_mo_indicators_request_dto.dart';

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
    this.lastRequest,
  });

  final TasksStatus status;
  final List<KanbanStageEntity>? stages;
  final String? errorMessage;
  final GetMoIndicatorsRequestDto? lastRequest;

  TasksState copyWith({
    TasksStatus? status,
    List<KanbanStageEntity>? stages,
    Object? errorMessage = _noValue,
    Object? lastRequest = _noValue,
  }) {
    return TasksState(
      status: status ?? this.status,
      stages: stages ?? this.stages,
      errorMessage: identical(errorMessage, _noValue)
          ? this.errorMessage
          : errorMessage as String?,
      lastRequest: identical(lastRequest, _noValue)
          ? this.lastRequest
          : lastRequest as GetMoIndicatorsRequestDto?,
    );
  }
}

const Object _noValue = Object();
