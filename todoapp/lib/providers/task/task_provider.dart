import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp/providers/providers.dart';

final taskProvider = StateNotifierProvider<TaskNotification, TaskState>((ref) {
  final repositories = ref.watch(taskRepositoriesProvider);
  return TaskNotification(repositories);
});
