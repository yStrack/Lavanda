import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:lavanda/Model/user.dart';
import 'package:lavanda/Services/auth.service.dart';

class UserProvider extends ChangeNotifier {
  User user;
  bool status = false;
  bool isReady = false;
  String message = "";

  Future checkUser(String name, String pass) async {
    try {
      status = true;
      notifyListeners();

      user = await login(name, pass);

      isReady = true;
    } catch (e) {
      status = false;
      message = "Falha ao logar";
    }

    notifyListeners();
  }
}
