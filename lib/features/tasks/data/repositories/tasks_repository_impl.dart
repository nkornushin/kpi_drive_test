import 'package:kpi_drive_test/features/tasks/data/mappers/tasks_mapper.dart';
import 'package:kpi_drive_test/features/tasks/data/models/get_mo_indicators_request_dto.dart';
import 'package:kpi_drive_test/features/tasks/data/services/tasks_api_service.dart';
import 'package:kpi_drive_test/features/tasks/domain/entities/paginated_list_entity.dart';
import 'package:kpi_drive_test/features/tasks/domain/entities/task_entity.dart';
import 'package:kpi_drive_test/features/tasks/domain/repositories/tasks_repository.dart';

class TasksRepositoryImpl implements TasksRepository {
  const TasksRepositoryImpl(this._apiService);

  final TasksApiService _apiService;

  @override
  Future<PaginatedListEntity<TaskEntity>> getMoIndicators(
    GetMoIndicatorsRequestDto request,
  ) async {
    final response = await _apiService.getMoIndicators(request);
    return response.data.toEntity();
  }
}
