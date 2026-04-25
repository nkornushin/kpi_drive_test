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
  Future<ApiResponseDto<PaginatedListDto<TaskDto>>> getMoIndicators(
    @PartMap() Map<String, dynamic> request,
  );
}
