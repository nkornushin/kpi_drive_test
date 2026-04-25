import 'package:kpi_drive_test/core/dto/paginated_list_dto.dart';
import 'package:kpi_drive_test/features/tasks/data/models/task_dto.dart';
import 'package:kpi_drive_test/features/tasks/domain/entities/paginated_list_entity.dart';
import 'package:kpi_drive_test/features/tasks/domain/entities/task_entity.dart';

extension TaskDtoMapper on TaskDto {
  TaskEntity toEntity() => TaskEntity(
    id: id,
    name: name,
    parentId: parentId,
    order: order,
  );
}

extension TaskListDtoMapper on PaginatedListDto<TaskDto> {
  PaginatedListEntity<TaskEntity> toEntity() => PaginatedListEntity<TaskEntity>(
    page: page,
    pagesCount: pagesCount,
    rowsCount: rowsCount,
    rowsTotalCount: rowsTotalCount,
    rows: rows.map((task) => task.toEntity()).toList(),
  );
}
