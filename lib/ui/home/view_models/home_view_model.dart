import 'package:flutter_admin/services/auth_service.dart';
import 'package:view_model_x/view_model_x.dart';

class HomeViewModel extends ViewModel {
  // final AuthService _authService;
  // HomeViewModel(this._authService);

  Future<void> logout() async {
    // await _authService.logOut();
  }

  @override
  void dispose() {}
}
// Consolas, 'Courier New', monospace

/* bottomNavigationBar: NavigationBar(
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
            selectedIcon: Icon(Icons.person),
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ), */