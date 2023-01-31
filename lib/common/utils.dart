import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

class Utils{


  static toastMessage(String message){
    Fluttertoast.showToast(msg: message,
    backgroundColor: Colors.black,
    textColor: Colors.white,
    toastLength: Toast.LENGTH_SHORT);
  }

}