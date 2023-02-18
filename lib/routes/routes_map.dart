import 'package:flutter_admin/di/locator.dart';
import 'package:flutter_admin/routes/routes.dart';
import 'package:flutter_admin/routes/routes_security.dart';
import 'package:flutter_admin/ui/Product/pages/products_page.dart';
import 'package:flutter_admin/ui/dashboard/pages/dashboard_page.dart';
import 'package:flutter_admin/ui/login/view_models/login_view_model.dart';
import 'package:flutter_admin/ui/home/pages/home_page.dart';
import 'package:flutter_admin/ui/login/pages/login_page.dart';
import 'package:go_router/go_router.dart';
import 'package:view_model_x/view_model_x.dart';

final router = GoRouter(routes: [
  GoRoute(
      path: Routes.login.path,
      name: Routes.login.name,
      builder: (context, state) => const LoginPage().wrappedRoute(context)),
  /* builder: (context, state) => ViewModelProvider(create: (context) => LoginViewModel(locator()),
        child: const LoginPage())), */
  GoRoute(
      path: Routes.home.path,
      name: Routes.home.name,
      builder: (context, state) => const HomePage().wrappedRoute(context)),
  GoRoute(
      path: Routes.products.path,
      name: Routes.products.name,
      builder: (context, state) => const ProductsPage().wrappedRoute(context)),
  GoRoute(
      path: Routes.dashboard.path,
      name: Routes.dashboard.name,
      builder: (context, state) => const DashboardPage().wrappedRoute(context))
], initialLocation: "/", redirect: secureRoute);
