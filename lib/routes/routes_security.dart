import 'package:flutter/cupertino.dart';
import 'package:flutter_admin/di/locator.dart';
import 'package:flutter_admin/services/auth_service.dart';
import 'package:go_router/go_router.dart';

Future<String?> secureRoute(BuildContext context, GoRouterState state) async{
  final authService = locator<AuthService>();
  if(!authService.isUserLoggedIn){
    return "/login";
  }else if(state.location == "/login"){
    return "/";
  }
  return null;
}