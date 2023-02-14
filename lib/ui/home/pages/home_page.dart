import 'package:flutter/material.dart';
import 'package:flutter_admin/common/common.dart';
import 'package:flutter_admin/ui/home/view_models/home_view_model.dart';
import 'package:view_model_x/view_model_x.dart';

class HomePage extends StatelessWidget with RouteWrapper {
  const HomePage({Key? key}) : super(key: key);

  // ------------------------------- Setting Home View Model to View Model Provider ---------------------

  @override
  Widget wrappedRoute(BuildContext context) =>
      ViewModelProvider(create: (context) => HomeViewModel(), child: this);

  // ------------------------------- UI Design ---------------------

  @override
  Widget build(BuildContext context) {
    debugPrint("ghghjdg");
    /* int currentPageIndex =
        context.vm<HomeViewModel>().indexStateFlow.watch(context); */
    // debugPrint("Current Page Index : $currentPageIndex ");

    return Container();
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