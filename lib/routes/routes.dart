import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin/ui/pages/home_page.dart';
import 'package:flutter_admin/ui/pages/login_page.dart';
import 'package:flutter_admin/ui/pages/signup_page.dart';

class RouteName {
  static const String login = "login_screen";
  static const String signup = "sign_up_screen";
  static const String home = "home_screen";
}

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.login:
        return MaterialPageRoute(builder: (BuildContext c) => LoginPage());
      case RouteName.home :
        return MaterialPageRoute(builder: (BuildContext c) => HomePage());
      case RouteName.signup :
        return MaterialPageRoute(builder: (BuildContext c) => SignUpPage());
      default:
        return MaterialPageRoute(
            builder: (BuildContext context) =>
                Scaffold(body: Center(child: Text('No Routes Found'))));
    }
  }
}
