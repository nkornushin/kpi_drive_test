import 'package:kpi_drive_test/features/tasks/data/models/get_mo_indicators_request_dto.dart';
import 'package:kpi_drive_test/features/tasks/domain/entities/paginated_list_entity.dart';
import 'package:kpi_drive_test/features/tasks/domain/entities/task_entity.dart';

abstract class TasksRepository {
  Future<PaginatedListEntity<TaskEntity>> getMoIndicators(
    GetMoIndicatorsRequestDto request,
  );
}
