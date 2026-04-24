/// DTO для экрана канбана (presentation). Не виджеты — лежат отдельно от `widgets/`.
class KanbanTask {
  const KanbanTask({
    required this.id,
    required this.title,
    this.subtitle,
  });

  final String id;
  final String title;
  final String? subtitle;
}

class KanbanStage {
  const KanbanStage({
    required this.id,
    required this.title,
    required this.tasks,
  });

  final String id;
  final String title;
  final List<KanbanTask> tasks;
}
