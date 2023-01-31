import 'package:flutter/material.dart';
import 'package:flutter_admin/repository/auth_repository.dart';
import 'package:view_model_x/view_model_x.dart';

class LoginViewModel extends ViewModel{

  final AuthRepository _authRepository;

  LoginViewModel(this._authRepository);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final MutableSharedFlow<String> mutableSharedFlow = MutableSharedFlow();

  SharedFlow<String> get sharedFlow => mutableSharedFlow;


  Future<void> login() async {
    try {
    await _authRepository.login(emailController.text, passwordController.text);
    mutableSharedFlow.emit("ok");
    }catch(e){
      mutableSharedFlow.emit(e.toString());
    }
  }


  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
  }

}