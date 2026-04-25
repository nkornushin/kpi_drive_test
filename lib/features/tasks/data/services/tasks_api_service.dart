import 'package:kpi_drive_test/core/dto/api_response_dto.dart';
import 'package:kpi_drive_test/core/dto/paginated_list_dto.dart';
import 'package:kpi_drive_test/features/tasks/data/models/get_mo_indicators_request_dto.dart';
import 'package:kpi_drive_test/features/tasks/data/models/save_indicator_instance_field_request_dto.dart';
import 'package:kpi_drive_test/features/tasks/data/models/task_dto.dart';
import 'package:kpi_drive_test/features/tasks/data/services/tasks_api_client.dart';

class TasksApiService {
  const TasksApiService(this._client);

  final TasksApiClient _client;

  Future<ApiResponseDto<PaginatedListDto<TaskDto>>> getMoIndicators(
    GetMoIndicatorsRequestDto request,
  ) => _client.getMoIndicators(
    authUserId: request.authUserId,
    behaviourKey: request.behaviourKey,
    periodStart: request.periodStart,
    periodEnd: request.periodEnd,
    periodKey: request.periodKey,
    requestedMoId: request.requestedMoId,
    withResult: request.withResult,
    responseFields: request.responseFields,
  );

  Future<void> saveIndicatorInstanceField(
    SaveIndicatorInstanceFieldRequestDto request,
  ) {
    final fieldNames = request.fields.map((field) => field.name).toList();
    final fieldValues = request.fields.map((field) => field.value).toList();

    return _client.saveIndicatorInstanceField(
      periodStart: request.periodStart,
      periodEnd: request.periodEnd,
      periodKey: request.periodKey,
      indicatorToMoId: request.indicatorToMoId,
      fieldNames: fieldNames,
      fieldValues: fieldValues,
      authUserId: request.authUserId,
    );
  }
}
