import 'package:flutter/material.dart';
import 'package:flutter_admin/di/initilize_di.dart';
import 'package:flutter_admin/routes/routes.dart';
import 'package:flutter_admin/routes/routes_map.dart';
import 'package:flutter_admin/theme/theme.dart';
import 'package:hive_flutter/adapters.dart';

void main() async{
  await Hive.initFlutter();
  await initializeDependencyInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Admin App',
      theme: getTheme(Brightness.light),
      darkTheme: getTheme(Brightness.dark),
      routerConfig: router,
    );
  }
}
