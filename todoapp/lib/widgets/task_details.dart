import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:todoapp/utils/extensions.dart';
import 'package:todoapp/widgets/widgets.dart';
import '../data/data.dart';

class TaskDetails extends StatelessWidget {
  const TaskDetails({super.key, required this.task});
  final Task task;

  @override
  Widget build(BuildContext context) {
    final style = context.textTheme;

    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(children: [
        CircleContainer(
          color: task.category.color.withOpacity(0.3),
          child: Icon(
            task.category.icon,
            color: task.category.color,
          ),
        ),
        const Gap(16),
        Text(task.title,
            style: style.titleMedium
                ?.copyWith(fontWeight: FontWeight.bold, fontSize: 20)),
        Text(task.time, style: style.titleMedium),
        const Gap(16),
        Visibility(
            visible: !task.isCompleted,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('task to be completed on ${task.date}'),
                Icon(
                  Icons.warning,
                  color: Colors.red,
                ),
              ],
            )),
        const Gap(16),
        Divider(
          thickness: 1.2,
          color: task.category.color,
        ),
        const Gap(16),
        Text(
          task.note.isEmpty ? 'There are no more tasks' : task.note,
        ),
        const Gap(16),
        Visibility(
            visible: task.isCompleted,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Task completed'),
                Icon(
                  Icons.check_box,
                  color: Colors.green,
                ),
              ],
            )),
      ]),
    );
  }
}



