import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp/data/data.dart';
import 'package:todoapp/providers/task/task_provider.dart';
import 'package:todoapp/utils/utils.dart';
import 'package:todoapp/widgets/common_container.dart';
import 'package:todoapp/widgets/task_tile.dart';
import 'package:todoapp/widgets/task_details.dart';

class DisplayListTasks extends ConsumerWidget {
  const DisplayListTasks({
    super.key,
    required this.tasks,
    this.isCompletedTasks = false,
  });

  final List<Task> tasks;
  final bool isCompletedTasks;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deviceSize = context.deviceSize;
    final height =
        isCompletedTasks ? deviceSize.height * 0.25 : deviceSize.height * 0.3;
    final emptyTasksMessage =
        isCompletedTasks ? 'No task todo.' : 'No task todo!';

    return CommonContainer(
      height: height,
      child: tasks.isEmpty
          ? Center(
              child: Text(
                emptyTasksMessage,
                style: context.textTheme.titleSmall,
              ),
            )
          : ListView.separated(
              shrinkWrap: true,
              itemCount: tasks.length,
              padding: EdgeInsets.zero,
              itemBuilder: (ctx, index) {
                final task = tasks[index];
                return InkWell(
                  onLongPress: () {
                    AppAlerts.showAlertDeleteDialog(
                        context: context, ref: ref, task: task);
                  },
                  onTap: () async {
                    await showModalBottomSheet(
                        context: context,
                        builder: (ctx) {
                          return TaskDetails(task: task);
                        });
                  },
                  child: TaskTile(
                    task: task,
                    onCompleted: (value) async {
                      await ref
                          .read(taskProvider.notifier)
                          .updateTask(task)
                          .then((value) {
                        AppAlerts.displaySnackbar(
                            context,
                            task.isCompleted
                                ? 'Task incompleted'
                                : 'Task Completed');
                      });
                    },
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider(thickness: 1.5);
              },
            ),
    );
  }
}
