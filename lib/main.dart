import 'package:flutter/material.dart';
import 'package:flutter_admin/theme/theme.dart';
import 'package:flutter_admin/ui/home_page.dart';
import 'package:flutter_admin/ui/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Admin App',
      theme: getTheme(Brightness.light),
      darkTheme: getTheme(Brightness.dark),
      home: LoginPage(),
    );
  }
}
