import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  ToDoTile({
    super.key,
    required this.taskName,
    required this.taskStatus,
    required this.onChanged,
    required this.deleteFunction,
  });

  final String taskName;
  final bool taskStatus;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
      child: Slidable(
        endActionPane: ActionPane(
          extentRatio: 0.2,
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.red.shade500, //delete button
              borderRadius: BorderRadius.circular(12),
              label: 'Deletar',
            ),
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            // color: Colors.orange,
            // color: Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              //checkbox
              Checkbox(
                side: const BorderSide(
                  color: Colors.white60,
                  width: 2,
                  strokeAlign: BorderSide.strokeAlignInside,
                ),
                value: taskStatus,
                onChanged: onChanged,
                activeColor: Colors.orange,
                checkColor: Colors.black,
              ),
              // task name
              Text(
                taskName,
                style: TextStyle(
                  color: Colors.white60,
                  decoration: taskStatus
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                  fontStyle: taskStatus ? FontStyle.italic : FontStyle.normal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
