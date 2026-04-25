import 'package:equatable/equatable.dart';
import 'package:kpi_drive_test/features/tasks/domain/entities/task_entity.dart';

class KanbanStageEntity extends Equatable {
  const KanbanStageEntity({
    required this.id,
    required this.name,
    required this.order,
    required this.tasks,
  });

  final int id;
  final String name;
  final int order;
  final List<TaskEntity> tasks;

  @override
  List<Object?> get props => [id];
}
