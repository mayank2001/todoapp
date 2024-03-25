import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:todoapp/config/routes/routes_location.dart';
import 'package:todoapp/data/models/task.dart';
import 'package:todoapp/providers/date_provider.dart';
import 'package:todoapp/providers/task/task_provider.dart';
import 'package:todoapp/utils/helpers.dart';
import 'package:todoapp/utils/utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp/widgets/widgets.dart';

class HomeScreen extends ConsumerWidget {
  static HomeScreen builder(BuildContext context, GoRouterState state) =>
      const HomeScreen();
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.colorScheme;
    final taskState = ref.watch(taskProvider);
    final completedTasks = _completedTasks(taskState.tasks);
    final incompletedTasks = _incompletedTasks(taskState.tasks);
    final deviceSize = context.deviceSize;
    final date = ref.watch(dateProvider);

    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: deviceSize.height * 0.3,
                width: deviceSize.width,
                color: colors.primary,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () => Helpers.selectDate(context, ref),
                      child: DisplayWhiteText(
                        text: Helpers.dateFormatter(date),
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    const Gap(10),
                    DisplayWhiteText(
                      text: 'My Todo List',
                      fontSize: 35,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: 130,
            left: 0,
            right: 0,
            child: SafeArea(
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    DisplayListTasks(
                      tasks: incompletedTasks,
                      isCompletedTasks: true,
                    ),
                    const Gap(20),
                    Text(
                      'Completed',
                      style: context.textTheme.headlineMedium,
                    ),
                    const Gap(20),
                    DisplayListTasks(
                      tasks: completedTasks,
                      isCompletedTasks: true,
                    ),
                    const Gap(20),
                    ElevatedButton(
                        onPressed: () => context.push(RouteLocation.createTask),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: DisplayWhiteText(text: 'Add New Task'),
                        )),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Task> _completedTasks(List<Task> tasks) {
    final List<Task> filteredTasks = [];
    for (var task in tasks) {
      if (task.isCompleted) {
        filteredTasks.add(task);
      }
    }

    return filteredTasks;
  }

  List<Task> _incompletedTasks(List<Task> tasks) {
    final List<Task> filteredTasks = [];
    for (var task in tasks) {
      if (!task.isCompleted) {
        filteredTasks.add(task);
      }
    }

    return filteredTasks;
  }
}
