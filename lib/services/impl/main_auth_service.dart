import 'package:flutter_admin/services/auth_service.dart';
import 'package:hive/hive.dart';
class MainAuthService extends AuthService{
  final Box<String> _box;

  MainAuthService(this._box);
  @override
  bool get isUserLoggedIn => (_box.get("token") != null);

  @override
  Future<void> login(String token) async{
    await _box.put("token", token);
  }

  @override
  String? get token => _box.get("token");



  @override
  Future<void> logOut() async{
    await _box.clear();
  }

}