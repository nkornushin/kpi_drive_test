class TaskEntity {
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
}
