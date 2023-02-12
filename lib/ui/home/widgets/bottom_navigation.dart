import 'package:flutter/material.dart';
import 'package:flutter_admin/ui/home/view_models/home_view_model.dart';
import 'package:view_model_x/view_model_x.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      surfaceTintColor: Theme.of(context).colorScheme.primary,
      onDestinationSelected: (int index) {
        context.vm<HomeViewModel>().changeIndex(index);
      },
      selectedIndex: context.vm<HomeViewModel>().indexStateFlow.watch(context),
      destinations: const <Widget>[
        NavigationDestination(
          selectedIcon: Icon(Icons.home),
          icon: Icon(Icons.home_outlined),
          label: 'Home',
        ),
        NavigationDestination(
          selectedIcon: Icon(Icons.fact_check_sharp),
          icon: Icon(Icons.fact_check_outlined),
          label: 'Orders',
        ),
        NavigationDestination(
          selectedIcon: Icon(Icons.add_box_rounded),
          icon: Icon(Icons.add_box_outlined),
          label: 'Add Products',
        ),
        NavigationDestination(
          selectedIcon: Icon(Icons.person),
          icon: Icon(Icons.person_outline),
          label: 'Profile',
        ),
      ],
    );
  }
}