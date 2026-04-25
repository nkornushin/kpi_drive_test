import 'package:equatable/equatable.dart';

class TaskEntity extends Equatable {
  const TaskEntity({
    required this.id,
    required this.name,
    required this.parentId,
    required this.order,
  });

  final int id;
  final String name;
  final int parentId;
  final int order;

  @override
  List<Object?> get props => [id, parentId];
}
