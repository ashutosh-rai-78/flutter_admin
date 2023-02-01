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
    return Scaffold(
        appBar: AppBar(
          title: const Text("Home Page"),
        ),
        body: ElevatedButton(
            onPressed: () async {
              context.vm<HomeViewModel>().logout().then((value) {
                context.pushReplacementNamed(Routes.login.name);
              }).onError((error, stackTrace) {

              });
            },
            child: const Text("LOGOUT")));
  }
}
