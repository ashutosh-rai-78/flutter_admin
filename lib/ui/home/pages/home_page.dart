import 'package:flutter/material.dart';
import 'package:flutter_admin/common/common.dart';
import 'package:flutter_admin/di/locator.dart';
import 'package:flutter_admin/routes/routes.dart';
import 'package:flutter_admin/ui/Product_page/pages/products_page.dart';
import 'package:flutter_admin/ui/home/view_models/home_view_model.dart';
import 'package:flutter_admin/ui/home/widgets/bottom_navigation.dart';
import 'package:flutter_admin/ui/home/widgets/custom_navigation_rail.dart';
import 'package:flutter_admin/ui/home/widgets/responsive_scaffold.dart';
import 'package:go_router/go_router.dart';
import 'package:view_model_x/view_model_x.dart';

class HomePage extends StatelessWidget with RouteWrapper {
  const HomePage({Key? key}) : super(key: key);

  // ------------------------------- Setting Home View Model to View Model Provider ---------------------

  @override
  Widget wrappedRoute(BuildContext context) => ViewModelProvider(
      create: (context) => HomeViewModel(locator()), child: this);

  // ------------------------------- UI Design ---------------------

  Widget screen(BuildContext context, int index) {
    switch (index) {
      case 0:
        return Container(
          color: Theme.of(context).colorScheme.background,
          alignment: Alignment.center,
          child: const Text('Page 1'),
        );
      case 1:
        return Container(
          color: Theme.of(context).colorScheme.background,
          alignment: Alignment.center,
          child: const Text('Page 2'),
        );
      case 2:
        return ProductsPage().wrappedRoute(context);
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
    /* int currentPageIndex =
        context.vm<HomeViewModel>().indexStateFlow.watch(context); */
    // debugPrint("Current Page Index : $currentPageIndex ");

    return ResponsiveScaffold(
      appBartitle: const Text("Admin App"),
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
                context.vm<HomeViewModel>().logout().then((value) {
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
        stateFlow: context.vm<HomeViewModel>().indexStateFlow,
      ),
    );
  }
}


/* 

[
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
                  context.vm<HomeViewModel>().logout().then((value) {
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
 */