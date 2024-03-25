import 'package:flutter/material.dart';
import 'package:todoapp/utils/tasks_keys.dart';

@immutable
class DBKeys {
  DBKeys._();
  static const String dbName = 'tasks.db';
  static const String dbTable = 'tasks';
  static const String idColumn = TaskKeys.id;
  static const String titleColumn = TaskKeys.title;
  static const String noteColumn = TaskKeys.note;
  static const String timeColumn = TaskKeys.time;
  static const String dateColumn = TaskKeys.date;
  static const String categoryColumn = TaskKeys.category;
  static const String isCompletedColumn = TaskKeys.isCompleted;
}
