import 'package:flutter_admin/di/locator.dart';
import 'package:flutter_admin/repository/auth_repository.dart';
import 'package:flutter_admin/repository/mock/mock_auth_repository.dart';
import 'package:flutter_admin/repository/mock/mock_product_repository.dart';
import 'package:flutter_admin/repository/product_repository.dart';
import 'package:flutter_admin/services/auth_service.dart';
import 'package:flutter_admin/services/impl/main_auth_service.dart';
import 'package:hive/hive.dart';

Future<void> initializeDependencyInjection() async {
  final Box<String> box = await Hive.openBox("auth");
  

  locator.registerSingleton<AuthService>(MainAuthService(box));

// Repository
  locator.registerFactory<AuthRepository>(() => MockAuthRepository(locator()));
  locator.registerFactory<ProductRepository>(() => MockProductRepository());
  
  await locator.allReady();
}
