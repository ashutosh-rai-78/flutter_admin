import 'package:flutter/material.dart';
import 'package:flutter_admin/common/common.dart';
import 'package:flutter_admin/di/locator.dart';
import 'package:flutter_admin/routes/routes.dart';
import 'package:flutter_admin/ui/home/view_models/home_view_model.dart';
import 'package:go_router/go_router.dart';
import 'package:view_model_x/view_model_x.dart';

class HomePage extends StatelessWidget with RouteWrapper {
  const HomePage({Key? key}) : super(key: key);

  // ------------------------------- Setting Home View Model to View Model Provider ---------------------

  @override
  Widget wrappedRoute(BuildContext context) => ViewModelProvider(
      create: (context) => HomeViewModel(locator()), child: this);

  // ------------------------------- UI Design ---------------------

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    int currentPageIndex =
        context.vm<HomeViewModel>().indexStateFlow.watch(context);
    debugPrint("Current Page Index : $currentPageIndex ");

    List<Widget> screens = [
      Container(
        color: Colors.red,
        alignment: Alignment.center,
        child: const Text('Page 1'),
      ),
      Container(
        color: Colors.green,
        alignment: Alignment.center,
        child: const Text('Page 2'),
      ),
      Container(
        color: Colors.blue,
        alignment: Alignment.center,
        child: const Text('Page 3'),
      ),Container(
        color: Colors.redAccent,
        alignment: Alignment.center,
        child: const Text('Page 4'),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        title: const Text("Home Page"),
        actions: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 5),
            margin: const EdgeInsets.only(right: 10, top: 5),
            child: OutlinedButton(
                style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(horizontal: 10))),
                onPressed: () async {
                  context.vm<HomeViewModel>().logout().then((value) {
                    context.pushReplacementNamed(Routes.login.name);
                  }).onError((error, stackTrace) {});
                },
                child: const Icon(Icons.logout,size: 20,)),
          ),
        ],
      ),
      bottomNavigationBar: width < 650 ? NavigationBar(
        onDestinationSelected: (int index) {
          context.vm<HomeViewModel>().changeIndex(index);
        },
        selectedIndex: currentPageIndex,
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
      ): null,
      body: Row(
        children: [
          if(width >= 650)
          NavigationRail(
            extended: width >= 800 ? true:false,
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
                ),NavigationRailDestination(
                  selectedIcon: Icon(Icons.person),
                  icon: Icon(Icons.person_outline),
                  label: Text('Profile'),
                ),
              ],
              selectedIndex: currentPageIndex),
          Expanded(child: screens[currentPageIndex]),
        ],
      ),
    );
  }
}
