import 'package:flutter/material.dart';

class CustomNavigationRail extends StatelessWidget {
  final int selectedIndex;
  final bool extended;
  final void Function(int index) onDestinationSelected;
  final List<NavigationRailDestination> destinations;
  const CustomNavigationRail({Key? key, this.extended = true, required this.onDestinationSelected, required this.destinations, required this.selectedIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: extended ? 250 : 80,
      child: ListView.separated(
        padding: EdgeInsets.all(10),
        itemCount: destinations.length,
        separatorBuilder: (context, index) => SizedBox(height: 10),
        itemBuilder: (context, index) {
          final railItem = destinations[index];
          return _CustomRailNavigationDestination(
              railItem: railItem,
              extended: extended,
              isSelected: selectedIndex == index,
              onPressed: () {
                onDestinationSelected(index);
              });
        },
      ),
    );
  }
}


class _CustomRailNavigationDestination extends StatelessWidget {
  final bool isSelected;
  final NavigationRailDestination railItem;
  final bool extended;
  final void Function() onPressed;
  const _CustomRailNavigationDestination({Key? key, required this.isSelected, required this.railItem, required this.extended, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
            color: isSelected
                ? Theme.of(context).colorScheme.secondaryContainer.withOpacity(0.5)
                : null,
            borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          mainAxisAlignment:
          extended ? MainAxisAlignment.start : MainAxisAlignment.center,
          children: [
            IconTheme(
                data: IconThemeData(
                    color: isSelected
                        ? Theme.of(context).colorScheme.onBackground
                        : Theme.of(context).colorScheme.secondary),
                child: isSelected ? railItem.selectedIcon : railItem.icon),
            if (extended) const SizedBox(width: 16),
            if (extended)
              DefaultTextStyle(
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: isSelected
                          ? Theme.of(context).colorScheme.onBackground
                          : Theme.of(context).colorScheme.secondary),
                  child: railItem.label)
          ],
        ),
      ),
    );
  }
}


/*class CustomNavigationRail extends StatelessWidget {
  const CustomNavigationRail({super.key, required this.extended});
  final bool extended;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        NavigationRail(
            extended: extended,
            onDestinationSelected: (value) {
              context.vm<DBViewModel>().changeIndex(value);
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
                context.vm<DBViewModel>().indexStateFlow.watch(context)),
        Container(
          width: 2,
          color: Theme.of(context).colorScheme.outline,
        )
      ],
    );
  }
}*/
