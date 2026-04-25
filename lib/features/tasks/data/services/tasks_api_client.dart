import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'package:kpi_drive_test/core/dto/api_response_dto.dart';
import 'package:kpi_drive_test/core/dto/paginated_list_dto.dart';
import 'package:kpi_drive_test/features/tasks/data/models/task_dto.dart';

part 'tasks_api_client.g.dart';

@RestApi()
abstract class TasksApiClient {
  factory TasksApiClient(Dio dio, {String? baseUrl}) = _TasksApiClient;

  @POST('/indicators/get_mo_indicators')
  @MultiPart()
  Future<ApiResponseDto<PaginatedListDto<TaskDto>>> getMoIndicators({
    @Part(name: 'auth_user_id') required String authUserId,
    @Part(name: 'behaviour_key') required String behaviourKey,
    @Part(name: 'period_start') required String periodStart,
    @Part(name: 'period_end') required String periodEnd,
    @Part(name: 'period_key') required String periodKey,
    @Part(name: 'requested_mo_id') required String requestedMoId,
    @Part(name: 'with_result') required String withResult,
    @Part(name: 'response_fields') required String responseFields,
  });
}
