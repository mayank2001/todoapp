import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp/data/data.dart';

final taskRepositoriesProvider = Provider<TaskRepositories>((ref) {
  final datasource = ref.watch(taskDataSourceProvider);
  return TaskRepositoriesImplement(datasource);
});
