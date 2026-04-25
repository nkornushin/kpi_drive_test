import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kpi_drive_test/core/di/dependency_injection.dart';
import 'package:kpi_drive_test/features/tasks/data/models/get_mo_indicators_request_dto.dart';
import 'package:kpi_drive_test/features/tasks/presentation/bloc/tasks_bloc.dart';
import 'package:kpi_drive_test/features/tasks/presentation/bloc/tasks_event.dart';
import 'package:kpi_drive_test/features/tasks/presentation/bloc/tasks_state.dart';

import 'package:kpi_drive_test/features/tasks/presentation/widgets/kanban_board.dart';

class KanbanPage extends StatelessWidget {
  const KanbanPage({super.key});

  static const GetMoIndicatorsRequestDto _request = GetMoIndicatorsRequestDto(
    periodStart: '2026-04-01',
    periodEnd: '2026-04-30',
    periodKey: 'month',
    requestedMoId: '42',
    behaviourKey: 'task,kpi_task',
    withResult: 'false',
    responseFields: 'name,indicator_to_mo_id,parent_id,order',
    authUserId: '40',
  );

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TasksBloc>(
      create: (_) =>
          getIt<TasksBloc>()..add(const GetMoIndicatorsRequested(_request)),
      child: Scaffold(
        backgroundColor: const Color(0xFFF9F8FD),
        body: SafeArea(
          child: BlocBuilder<TasksBloc, TasksState>(
            builder: (context, state) {
              if (state.status == TasksStatus.loading ||
                  state.status == TasksStatus.initial) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state.status == TasksStatus.error) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(state.errorMessage ?? 'Ошибка загрузки задач'),
                  ),
                );
              }

              final stages = state.stages ?? const [];
              return KanbanBoard(stages: stages);
            },
          ),
        ),
      ),
    );
  }
}
