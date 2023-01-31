abstract class AuthServices{
  bool get isUserLoggedIn;
  Future<void> login(String token);
  String? get token;
  Future<void> logOut();
}