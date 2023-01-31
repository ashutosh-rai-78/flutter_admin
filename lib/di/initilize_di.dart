import 'package:flutter_admin/di/locator.dart';
import 'package:flutter_admin/network/base/network_call.dart';
import 'package:flutter_admin/services/auth_service.dart';
import 'package:flutter_admin/services/impl/main_auth_service.dart';
import 'package:hive/hive.dart';

Future<void> initializeDependencyInjection() async {
  final Box<String> box = await Hive.openBox("auth");
  locator.registerSingleton<AuthService>(MainAuthService(box));

  await locator.allReady();
}
