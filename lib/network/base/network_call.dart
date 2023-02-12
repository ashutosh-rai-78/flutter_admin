import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:retrofit/retrofit.dart';

class NetworkCall{
  final baseUrl = "https://reqres.in/api/register";

  Future<void> NetworkResponse(String email, String password) async {
    var dio = Dio();
    var response = await dio.post(baseUrl,
    data: {'email' : email, 'password' : password});

    debugPrint(response.toString());

  }


  /*{
  "email": "eve.holt@reqres.in",
  "password": "pistol"
  }*/

}

