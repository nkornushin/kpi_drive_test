import 'package:drag_and_drop_lists/drag_and_drop_lists.dart';
import 'package:flutter/material.dart';

import 'package:kpi_drive_test/features/tasks/presentation/models/kanban_models.dart';

import 'kanban_column.dart';

class KanbanBoard extends StatefulWidget {
  const KanbanBoard({super.key, required this.stages});

  final List<KanbanStage> stages;

  /// Внешняя ширина слота колонки: [KanbanColumnDragList.contentWidth] + правый отступ.
  static const double _listWidthWithTrailingGap = KanbanColumnDragList.contentWidth + 12;

  static const EdgeInsets _listPadding = EdgeInsets.only(right: 12);

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

  void _onItemReorder(
    int oldItemIndex,
    int oldListIndex,
    int newItemIndex,
    int newListIndex,
  ) {
    setState(() {
      final oldList = List<KanbanTask>.from(_stages[oldListIndex].tasks);
      final task = oldList.removeAt(oldItemIndex);
      _stages[oldListIndex] = KanbanStage(
        id: _stages[oldListIndex].id,
        title: _stages[oldListIndex].title,
        tasks: oldList,
      );

      final newList = List<KanbanTask>.from(_stages[newListIndex].tasks);
      newList.insert(newItemIndex, task);
      _stages[newListIndex] = KanbanStage(
        id: _stages[newListIndex].id,
        title: _stages[newListIndex].title,
        tasks: newList,
      );
    });
  }

  void _onListReorder(int oldListIndex, int newListIndex) {
    setState(() {
      final stage = _stages.removeAt(oldListIndex);
      _stages.insert(newListIndex, stage);
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
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withValues(alpha: 0.5),
                    blurRadius: 10,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Scrollbar(
                controller: _controller,
                thumbVisibility: true,
                scrollbarOrientation: ScrollbarOrientation.bottom,
                child: DragAndDropLists(
                  scrollController: _controller,
                  removeTopPadding: true,
                  axis: Axis.horizontal,
                  listWidth: KanbanBoard._listWidthWithTrailingGap,
                  listPadding: KanbanBoard._listPadding,
                  listDraggingWidth: KanbanBoard._listWidthWithTrailingGap,
                  itemDraggingWidth: KanbanColumnDragList.contentWidth,
                  lastItemTargetHeight: 40,
                  itemGhostOpacity: 0.25,
                  itemSizeAnimationDurationMilliseconds: 150,
                  itemDragOnLongPress: true,
                  listDragOnLongPress: false,
                  listDragHandle: DragHandle(
                    verticalAlignment: DragHandleVerticalAlignment.top,
                    onLeft: true,
                    child: MouseRegion(
                      cursor: SystemMouseCursors.grab,
                      child: SizedBox(
                        width: KanbanColumnDragList.contentWidth,
                        height: KanbanColumnDragList.listDragHandleHeight,
                        child: const ColoredBox(color: Colors.transparent),
                      ),
                    ),
                  ),
                  itemDecorationWhileDragging: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x33000000),
                        blurRadius: 12,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  children: [
                    for (final stage in _stages) KanbanColumnDragList.build(stage: stage),
                  ],
                  onItemReorder: _onItemReorder,
                  onListReorder: _onListReorder,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
