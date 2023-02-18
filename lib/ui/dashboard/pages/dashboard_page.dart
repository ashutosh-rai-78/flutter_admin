import 'package:flutter/material.dart';
import 'package:flutter_admin/common/common.dart';
import 'package:flutter_admin/di/locator.dart';
import 'package:flutter_admin/routes/routes.dart';
import 'package:flutter_admin/ui/Product/pages/products_page.dart';
import 'package:flutter_admin/ui/home/pages/home_page.dart';
import 'package:go_router/go_router.dart';
import 'package:view_model_x/view_model_x.dart';

import '../view_models/db_view_model.dart';
import '../widgets/bottom_navigation.dart';
import '../widgets/custom_navigation_rail.dart';
import '../widgets/responsive_scaffold.dart';

class DashboardPage extends StatelessWidget with RouteWrapper {
  const DashboardPage({Key? key}) : super(key: key);

  // ------------------------------- Setting Home View Model to View Model Provider ---------------------

  @override
  Widget wrappedRoute(BuildContext context) => ViewModelProvider(
      create: (context) => DBViewModel(locator()), child: this);

  // ------------------------------- UI Design ---------------------

  Widget screen(BuildContext context, int index) {
    switch (index) {
      case 0:
        return const HomePage();
      case 1:
        return Container(
          color: Theme.of(context).colorScheme.background,
          alignment: Alignment.center,
          child: const Text('Page 2'),
        );
      case 2:
        return const ProductsPage().wrappedRoute(context);
      case 3:
        return Container(
          color: Theme.of(context).colorScheme.background,
          alignment: Alignment.center,
          child: const Text('Page 3'),
        );
      default:
        return const SizedBox();
    }
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("ghghjdg");

    return ResponsiveScaffold(
      toolbartitle: const Text("Admin App"),
      navigationRail: (context, extended) =>
          CustomNavigationRail(extended: extended),
      actions: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
              padding: const EdgeInsets.all(5),
              color: Theme.of(context).colorScheme.secondaryContainer,
              child: const Icon(Icons.person)),
        ),
        PopupMenuButton<String>(
          icon: const Icon(Icons.keyboard_arrow_down_outlined),
          onSelected: (value) {
            switch (value) {
              case 'Logout':
                context.vm<DBViewModel>().logout().then((value) {
                  context.pushReplacementNamed(Routes.login.name);
                }).onError((error, stackTrace) {});
                break;
              case 'Settings':
                break;
            }
          },
          itemBuilder: (BuildContext context) {
            return {'Logout', 'Settings'}.map((String choice) {
              return PopupMenuItem<String>(
                value: choice,
                child: Text(choice),
              );
            }).toList();
          },
        ),
      ],
      bottomNavigationBar: const BottomNavigation(),
      body: StateFlowBuilder(
        builder: (context, currrentIndex) => screen(context, currrentIndex),
        stateFlow: context.vm<DBViewModel>().indexStateFlow,
      ),
    );
  }
}
