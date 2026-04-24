import 'package:flutter/material.dart';

import 'package:kpi_drive_test/features/tasks/presentation/models/kanban_models.dart';
import 'package:kpi_drive_test/features/tasks/presentation/widgets/add_task_widget.dart';
import 'package:kpi_drive_test/features/tasks/presentation/widgets/kanban_column_header.dart';

import 'task_card.dart';

class KanbanColumn extends StatefulWidget {
  const KanbanColumn({
    super.key,
    required this.stage,
    required this.index,
  });

  final KanbanStage stage;
  final int index;

  @override
  State<KanbanColumn> createState() => _KanbanColumnState();
}

class _KanbanColumnState extends State<KanbanColumn> {
  late List<KanbanTask> _tasks;

  @override
  void initState() {
    super.initState();
    _tasks = List<KanbanTask>.from(widget.stage.tasks);
  }

  @override
  void didUpdateWidget(covariant KanbanColumn oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.stage != widget.stage) {
      _tasks = List<KanbanTask>.from(widget.stage.tasks);
    }
  }

  void _onReorder(int oldIndex, int newIndex) {
    setState(() {
      if (newIndex > oldIndex) {
        newIndex -= 1;
      }
      final task = _tasks.removeAt(oldIndex);
      _tasks.insert(newIndex, task);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ReorderableDragStartListener(
          index: widget.index,
          child: KanbanColumnHeader(stage: widget.stage),
        ),

        Expanded(
          child: ReorderableListView(
            onReorder: _onReorder,
            buildDefaultDragHandles: false,
            footer: const Padding(
              padding: EdgeInsets.only(top: 8),
              child: AddTaskWidget(),
            ),
            proxyDecorator: (child, index, animation) {
              return Theme(
                data: Theme.of(context).copyWith(
                  canvasColor: Colors.transparent,
                ),
                child: Material(
                  elevation: 6 * animation.value,
                  child: child,
                ),
              );
            },
            children: _tasks
                .asMap()
                .entries
                .map(
                  (entry) => Padding(
                    key: ValueKey(entry.value.id),
                    padding: const EdgeInsets.only(bottom: 8),
                    child: ReorderableDragStartListener(
                      index: entry.key,
                      child: TaskCard(task: entry.value),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}
