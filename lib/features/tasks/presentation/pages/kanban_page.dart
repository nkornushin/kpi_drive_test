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
        ),
        KanbanTask(id: '2', title: 'Макет канбана'),
        KanbanTask(id: '3', title: 'Макет канбана 2'),
        KanbanTask(id: '4', title: 'Макет канбана 3'),
        KanbanTask(id: '5', title: 'Макет канбана 5'),
        KanbanTask(id: '6', title: 'Макет канбана 6'),
      ],
    ),
    KanbanStage(
      id: 'in_progress',
      title: 'В работе',
      tasks: [
        KanbanTask(
          id: '3',
          title: 'Виджеты канбан-колонок',
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
