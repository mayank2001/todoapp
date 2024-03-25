import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp/utils/tasks_category.dart';

final categoryProvider = StateProvider.autoDispose<TaskCategory>((ref) {
  return TaskCategory.others;
});