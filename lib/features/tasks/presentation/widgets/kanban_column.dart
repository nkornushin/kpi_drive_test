import 'package:drag_and_drop_lists/drag_and_drop_lists.dart';
import 'package:flutter/material.dart';

import 'package:kpi_drive_test/features/tasks/presentation/models/kanban_models.dart';
import 'package:kpi_drive_test/features/tasks/presentation/widgets/add_task_widget.dart';
import 'package:kpi_drive_test/features/tasks/presentation/widgets/kanban_column_header.dart';

import 'task_card.dart';

/// Собирает [DragAndDropList] для одной стадии канбана (вертикальный список карточек).
abstract final class KanbanColumnDragList {
  /// Ширина содержимого колонки (без учёта [listPadding] уровня [DragAndDropLists]).
  static const double contentWidth = 288;

  /// Высота зоны захвата для перестановки колонок (совпадает с блоком заголовка).
  static const double listDragHandleHeight = 96;

  static DragAndDropList build({
    required KanbanStage stage,
  }) {
    return DragAndDropList(
      key: ValueKey(stage.id),
      header: KanbanColumnHeader(stage: stage),
      footer: AddTaskWidget(),
      children: [
        for (final task in stage.tasks)
          DragAndDropItem(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: TaskCard(task: task),
            ),
          ),
      ],
    );
  }
}
