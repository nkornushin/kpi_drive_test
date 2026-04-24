import 'package:flutter/material.dart';

import 'package:kpi_drive_test/features/tasks/presentation/widgets/kanban_board.dart';
import 'package:kpi_drive_test/features/tasks/presentation/models/kanban_models.dart';

class KanbanPage extends StatefulWidget {
  const KanbanPage({super.key});

  @override
  State<KanbanPage> createState() => _KanbanPageState();
}

class _KanbanPageState extends State<KanbanPage> {
  /// Демо-данные; позже можно заменить на состояние из bloc/repository.
  static const List<KanbanStage> _demoStages = [
    KanbanStage(
      id: 'backlog',
      title: 'Бэклог',
      tasks: [
        KanbanTask(
          id: '1',
          title: 'Описать API задач',
          subtitle: 'Swagger + примеры ответов',
        ),
        KanbanTask(id: '2', title: 'Макет канбана', subtitle: null),
        KanbanTask(id: '3', title: 'Макет канбана 2', subtitle: null),
        KanbanTask(id: '4', title: 'Макет канбана 3', subtitle: null),
        KanbanTask(id: '5', title: 'Макет канбана 4', subtitle: null),
      ],
    ),
    KanbanStage(
      id: 'in_progress',
      title: 'В работе',
      tasks: [
        KanbanTask(
          id: '3',
          title: 'Виджеты канбан-колонок',
          subtitle: 'Горизонтальный скролл, карточки',
        ),
      ],
    ),
    KanbanStage(
      id: 'review',
      title: 'Ревью',
      tasks: [
        KanbanTask(
          id: '4',
          title: 'Проверка на разных ширинах экрана',
        ),
      ],
    ),
    KanbanStage(
      id: 'done',
      title: 'Готово',
      tasks: [
        KanbanTask(id: '5', title: 'Структура clean architecture'),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9F8FD),

      body: SafeArea(
        child: KanbanBoard(stages: _demoStages),
      ),
    );
  }
}
