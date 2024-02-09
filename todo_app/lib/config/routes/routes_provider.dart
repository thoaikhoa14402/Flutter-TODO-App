import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/config/routes/app_routes.dart';
import 'package:todo_app/config/routes/route_location.dart';

// this code is creating a Provider for a GoRouter object
// that is configured with an initial location, a navigator key,
// and a set of routes. This GoRouter can then be accessed from anywhere
// in the widget tree using
// Provider.of<GoRouter>(context) or context.read<GoRouter>().
final routesProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: RouteLocation.home,
    navigatorKey: navigationKey,
    routes: appRoutes,
  );
});
