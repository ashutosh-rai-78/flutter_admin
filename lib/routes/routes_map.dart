import 'package:flutter_admin/routes/routes.dart';
import 'package:flutter_admin/routes/routes_security.dart';
import 'package:flutter_admin/ui/pages/home_page.dart';
import 'package:flutter_admin/ui/pages/login_page.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    GoRoute(
        path: Routes.login.path,
        name: Routes.login.name,
        builder: (context, state) => const LoginPage()),
    GoRoute(
        path: Routes.home.path,
        name: Routes.home.name,
        builder: (context, state) => const HomePage()),
  ],
  initialLocation: "/",
redirect: secureRoute);
