import 'package:kpi_drive_test/features/tasks/data/models/get_mo_indicators_request_dto.dart';

sealed class TasksEvent {
  const TasksEvent();
}

class GetMoIndicatorsRequested extends TasksEvent {
  const GetMoIndicatorsRequested(this.request);

  final GetMoIndicatorsRequestDto request;
}

class TaskMoved extends TasksEvent {
  const TaskMoved({
    required this.oldItemIndex,
    required this.oldListIndex,
    required this.newItemIndex,
    required this.newListIndex,
  });

  final int oldItemIndex;
  final int oldListIndex;
  final int newItemIndex;
  final int newListIndex;
}

class StageMoved extends TasksEvent {
  const StageMoved({
    required this.oldListIndex,
    required this.newListIndex,
  });

  final int oldListIndex;
  final int newListIndex;
}
