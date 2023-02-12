import 'package:flutter/material.dart';
import 'package:flutter_admin/ui/home/view_models/home_view_model.dart';
import 'package:view_model_x/view_model_x.dart';

class CustomNavigationRail extends StatelessWidget {
  const CustomNavigationRail({super.key, required this.extended});
  final bool extended;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        NavigationRail(
            extended: extended,
            onDestinationSelected: (value) {
              context.vm<HomeViewModel>().changeIndex(value);
            },
            destinations: const [
              NavigationRailDestination(
                selectedIcon: Icon(Icons.home),
                icon: Icon(Icons.home_outlined),
                label: Text('Home'),
              ),
              NavigationRailDestination(
                selectedIcon: Icon(Icons.fact_check_sharp),
                icon: Icon(Icons.fact_check_outlined),
                label: Text('Orders'),
              ),
              NavigationRailDestination(
                selectedIcon: Icon(Icons.add_box_rounded),
                icon: Icon(Icons.add_box_outlined),
                label: Text('Add Products'),
              ),
              NavigationRailDestination(
                selectedIcon: Icon(Icons.person),
                icon: Icon(Icons.person_outline),
                label: Text('Profile'),
              ),
            ],
            selectedIndex:
                context.vm<HomeViewModel>().indexStateFlow.watch(context)),
        Container(
          width: 2,
          color: Theme.of(context).colorScheme.outline,
        )
      ],
    );
  }
}
