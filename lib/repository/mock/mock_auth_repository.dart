import 'package:flutter_admin/repository/auth_repository.dart';
import 'package:flutter_admin/services/auth_service.dart';

class MockAuthRepository extends AuthRepository{
  final AuthService _authService;

  MockAuthRepository(this._authService);
  @override
  Future<void> login(String email, String password) async{
    await Future.delayed(Duration(seconds: 2));
    _authService.login("asasasalkhjlskdfjlksdjf;ali");
    // return Future.error("error");
  }
  
}