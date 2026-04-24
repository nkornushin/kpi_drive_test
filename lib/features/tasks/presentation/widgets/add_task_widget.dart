import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class AddTaskWidget extends StatelessWidget {
  const AddTaskWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(4),
      child: DottedBorder(
        options: RoundedRectDottedBorderOptions(
          dashPattern: [8, 8],
          strokeWidth: 2,
          radius: Radius.circular(4),
          color: Colors.grey,
        ),
        child: Container(
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            spacing: 8,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.add),
              Text('Добавить задачу'),
            ],
          ),
        ),
      ),
    );
  }
}
