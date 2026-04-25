import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kpi_drive_test/core/domain/entities/paginated_list_entity.dart';
import 'package:kpi_drive_test/features/tasks/domain/entities/kanban_stage_entity.dart';
import 'package:kpi_drive_test/features/tasks/domain/entities/task_entity.dart';
import 'package:kpi_drive_test/features/tasks/domain/repositories/tasks_repository.dart';
import 'package:kpi_drive_test/features/tasks/presentation/bloc/tasks_event.dart';
import 'package:kpi_drive_test/features/tasks/presentation/bloc/tasks_state.dart';

class TasksBloc extends Bloc<TasksEvent, TasksState> {
  TasksBloc(this._tasksRepository) : super(const TasksState()) {
    on<GetMoIndicatorsRequested>(_onGetMoIndicatorsRequested);
  }

  final TasksRepository _tasksRepository;

  Future<void> _onGetMoIndicatorsRequested(
    GetMoIndicatorsRequested event,
    Emitter<TasksState> emit,
  ) async {
    emit(state.copyWith(status: TasksStatus.loading, errorMessage: null));
    try {
      final PaginatedListEntity<TaskEntity> data = await _tasksRepository
          .getMoIndicators(event.request);
      final List<int> uniqueParentIds =
          data.rows.map((task) => task.parentId).toSet().toList()..sort();

      final List<KanbanStageEntity> stages = uniqueParentIds
          .asMap()
          .entries
          .map((entry) {
            final int index = entry.key;
            final int parentId = entry.value;
            final List<TaskEntity> stageTasks =
                data.rows.where((task) => task.parentId == parentId).toList()
                  ..sort((a, b) => a.order.compareTo(b.order));

            return KanbanStageEntity(
              id: parentId,
              name: 'Stage $parentId',
              order: index,
              tasks: stageTasks,
            );
          })
          .toList();

      emit(
        state.copyWith(
          status: TasksStatus.success,
          stages: stages,
          errorMessage: null,
        ),
      );
    } catch (error) {
      emit(
        state.copyWith(
          status: TasksStatus.error,
          errorMessage: error.toString(),
        ),
      );
    }
  }
}
