import 'package:flutter/material.dart';

import 'package:kpi_drive_test/features/tasks/presentation/models/kanban_models.dart';

import 'kanban_column.dart';

class KanbanBoard extends StatefulWidget {
  const KanbanBoard({super.key, required this.stages});

  final List<KanbanStage> stages;

  static const double _columnWidth = 288;

  @override
  State<KanbanBoard> createState() => _KanbanBoardState();
}

class _KanbanBoardState extends State<KanbanBoard> {
  final ScrollController _controller = ScrollController();
  late List<KanbanStage> _stages;

  @override
  void initState() {
    super.initState();
    _stages = List<KanbanStage>.from(widget.stages);
  }

  @override
  void didUpdateWidget(covariant KanbanBoard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.stages != widget.stages) {
      _stages = List<KanbanStage>.from(widget.stages);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onReorder(int oldIndex, int newIndex) {
    setState(() {
      if (newIndex > oldIndex) {
        newIndex -= 1;
      }
      final stage = _stages.removeAt(oldIndex);
      _stages.insert(newIndex, stage);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Container(
              width: constraints.maxWidth,
              height: constraints.maxHeight,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),

                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withValues(alpha: 0.5),
                    blurRadius: 10,
                    offset: Offset(0, 10),
                  ),
                ],
              ),
              child: Scrollbar(
                controller: _controller,
                thumbVisibility: true,
                scrollbarOrientation: ScrollbarOrientation.bottom,
                child: ReorderableListView.builder(
                  scrollController: _controller,
                  scrollDirection: Axis.horizontal,
                  onReorder: _onReorder,
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  itemCount: _stages.length,
                  buildDefaultDragHandles: false,
                  proxyDecorator: (child, index, animation) {
                    return Theme(
                      data: Theme.of(context).copyWith(
                        canvasColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                      ),
                      child: Material(
                        shadowColor: Colors.transparent,
                        child: child,
                      ),
                    );
                  },
                  itemBuilder: (context, index) => Padding(
                    key: ValueKey(_stages[index].id),
                    padding: const EdgeInsets.only(right: 12),
                    child: SizedBox(
                      width: KanbanBoard._columnWidth,
                      height: constraints.maxHeight,
                      child: KanbanColumn(
                        stage: _stages[index],
                        index: index,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
