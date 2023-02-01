import 'package:flutter_admin/services/auth_service.dart';
import 'package:view_model_x/view_model_x.dart';

class HomeViewModel extends ViewModel{
  final AuthService _authService;
  HomeViewModel(this._authService);
  

  Future<void> logout() async{
      await _authService.logOut();
  }


  @override
  void dispose() {
    // TODO: implement dispose
  }

}