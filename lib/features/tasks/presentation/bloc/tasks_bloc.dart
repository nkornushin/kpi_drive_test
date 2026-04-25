import 'package:flutter_bloc/flutter_bloc.dart';
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
      final data = await _tasksRepository.getMoIndicators(event.request);
      emit(
        state.copyWith(
          status: TasksStatus.success,
          tasks: data,
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
