import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kpi_drive_test/features/tasks/domain/entities/kanban_stage_entity.dart';

class KanbanColumnHeader extends StatefulWidget {
  const KanbanColumnHeader({super.key, required this.stage});

  final KanbanStageEntity stage;

  @override
  State<KanbanColumnHeader> createState() => _KanbanColumnHeaderState();
}

class _KanbanColumnHeaderState extends State<KanbanColumnHeader> {
  static const Duration _trashAppearDelay = Duration(seconds: 1);
  Timer? _hoverTimer;
  final ValueNotifier<bool> _showTrashNotifier = ValueNotifier<bool>(false);

  @override
  void dispose() {
    _hoverTimer?.cancel();
    _showTrashNotifier.dispose();
    super.dispose();
  }

  void _onEnter(_) {
    _hoverTimer?.cancel();
    _hoverTimer = Timer(_trashAppearDelay, () {
      _showTrashNotifier.value = true;
    });
  }

  void _onExit(_) {
    _hoverTimer?.cancel();
    _showTrashNotifier.value = false;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return MouseRegion(
      onEnter: _onEnter,
      onExit: _onExit,
      cursor: SystemMouseCursors.grab,
      child: Container(
        constraints: const BoxConstraints(minHeight: 80),
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: Color(0xFFDEE7F1),
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: theme.colorScheme.outlineVariant.withValues(alpha: 0.5),
          ),
        ),
        child: Stack(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    widget.stage.name,
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                if (widget.stage.tasks.isNotEmpty) ...[
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(999),
                    ),
                    child: Text(
                      '${widget.stage.tasks.length}',
                      style: theme.textTheme.labelMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ],
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: ValueListenableBuilder<bool>(
                valueListenable: _showTrashNotifier,
                builder: (context, showTrash, _) {
                  if (!showTrash) {
                    return const SizedBox.shrink();
                  }
                  return Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Icon(
                      Icons.delete,
                      size: 18,
                      color: theme.colorScheme.error,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
