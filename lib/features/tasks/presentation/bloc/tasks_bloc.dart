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
    on<TaskMoved>(_onTaskMoved);
    on<StageMoved>(_onStageMoved);
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

  void _onTaskMoved(
    TaskMoved event,
    Emitter<TasksState> emit,
  ) {
    final currentStages = state.stages;
    if (currentStages == null ||
        event.oldListIndex >= currentStages.length ||
        event.newListIndex >= currentStages.length) {
      return;
    }

    final stages = List<KanbanStageEntity>.from(currentStages);

    final oldTasks = List<TaskEntity>.from(stages[event.oldListIndex].tasks);
    if (event.oldItemIndex >= oldTasks.length) {
      return;
    }

    final movedTask = oldTasks.removeAt(event.oldItemIndex);
    stages[event.oldListIndex] = KanbanStageEntity(
      id: stages[event.oldListIndex].id,
      name: stages[event.oldListIndex].name,
      order: stages[event.oldListIndex].order,
      tasks: oldTasks,
    );

    final newTasks = List<TaskEntity>.from(stages[event.newListIndex].tasks);
    final targetIndex = event.newItemIndex.clamp(0, newTasks.length);
    newTasks.insert(targetIndex, movedTask);
    stages[event.newListIndex] = KanbanStageEntity(
      id: stages[event.newListIndex].id,
      name: stages[event.newListIndex].name,
      order: stages[event.newListIndex].order,
      tasks: newTasks,
    );

    emit(state.copyWith(stages: stages));
  }

  void _onStageMoved(
    StageMoved event,
    Emitter<TasksState> emit,
  ) {
    final currentStages = state.stages;
    if (currentStages == null ||
        event.oldListIndex >= currentStages.length ||
        event.newListIndex >= currentStages.length) {
      return;
    }

    final stages = List<KanbanStageEntity>.from(currentStages);
    final movedStage = stages.removeAt(event.oldListIndex);
    stages.insert(event.newListIndex, movedStage);

    emit(state.copyWith(stages: stages));
  }
}
