import 'package:flutter/material.dart';
import 'package:flutter_admin/di/initilize_di.dart';
import 'package:flutter_admin/routes/routes_map.dart';
import 'package:flutter_admin/theme/theme.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
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
      debugShowCheckedModeBanner: false,
      title: 'Admin App',
      // themeMode: ThemeMode.light,
      theme: getTheme(Brightness.light, useMaterial3: true),
      darkTheme: getTheme(Brightness.dark, useMaterial3: true),
      routerConfig: router,
    );
  }
}
