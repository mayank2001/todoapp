import 'package:todoapp/config/routes/routes_location.dart';
import 'package:todoapp/config/routes/routes_provider.dart';
import 'package:todoapp/screens/screens.dart';
import 'package:go_router/go_router.dart';

final appRoutes = [
  GoRoute(
    path: RouteLocation.home,
    parentNavigatorKey: navigationKey,
    builder: HomeScreen.builder,
  ),
  GoRoute(
    path: RouteLocation.createTask,
    parentNavigatorKey: navigationKey,
    builder: CreateTaskScreen.builder,
  ),
];
