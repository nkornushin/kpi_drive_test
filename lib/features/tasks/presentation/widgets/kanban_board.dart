import 'package:drag_and_drop_lists/drag_and_drop_lists.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:kpi_drive_test/features/tasks/domain/entities/kanban_stage_entity.dart';
import 'package:kpi_drive_test/features/tasks/presentation/bloc/tasks_bloc.dart';
import 'package:kpi_drive_test/features/tasks/presentation/bloc/tasks_event.dart';

import 'kanban_column.dart';

class KanbanBoard extends StatefulWidget {
  const KanbanBoard({super.key, required this.stages});

  final List<KanbanStageEntity> stages;

  /// Внешняя ширина слота колонки: [KanbanColumnDragList.contentWidth] + правый отступ.
  static const double _listWidthWithTrailingGap =
      KanbanColumnDragList.contentWidth + 12;

  static const EdgeInsets _listPadding = EdgeInsets.only(right: 12);

  @override
  State<KanbanBoard> createState() => _KanbanBoardState();
}

class _KanbanBoardState extends State<KanbanBoard> {
  final ScrollController _controller = ScrollController();

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
    context.read<TasksBloc>().add(
      TaskMoved(
        oldItemIndex: oldItemIndex,
        oldListIndex: oldListIndex,
        newItemIndex: newItemIndex,
        newListIndex: newListIndex,
      ),
    );
  }

  void _onListReorder(int oldListIndex, int newListIndex) {
    context.read<TasksBloc>().add(
      StageMoved(
        oldListIndex: oldListIndex,
        newListIndex: newListIndex,
      ),
    );
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
                    for (final stage in widget.stages)
                      KanbanColumnDragList.build(stage: stage),
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
