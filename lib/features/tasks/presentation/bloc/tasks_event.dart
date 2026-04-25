import 'package:kpi_drive_test/features/tasks/data/models/get_mo_indicators_request_dto.dart';

sealed class TasksEvent {
  const TasksEvent();
}

class GetMoIndicatorsRequested extends TasksEvent {
  const GetMoIndicatorsRequested(this.request);

  final GetMoIndicatorsRequestDto request;
}
