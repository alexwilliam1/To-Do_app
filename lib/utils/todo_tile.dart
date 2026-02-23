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
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.red.shade500, //delete button
              borderRadius: BorderRadius.circular(12),
            ),
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              //checkbox
              Checkbox(
                // fillColor: WidgetStateProperty.resolveWith((states) {
                //   if (!states.contains(WidgetState.selected)) {
                //     return Colors.transparent;
                //   }
                //   return null;
                // }),
                side: const BorderSide(
                  color: Colors.black,
                  width: 2,
                  strokeAlign: BorderSide.strokeAlignInside,
                ),
                value: taskStatus,
                onChanged: onChanged,
                activeColor: Colors.black,
                checkColor: Colors.orange,
              ),
              // task name
              Text(
                taskName,
                style: TextStyle(
                  color: Colors.black,
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
