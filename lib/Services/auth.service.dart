import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:lavanda/constants.dart';
import 'package:lavanda/Model/user.dart';

Future<User> login(String email, String password) async {
  final response = await http.post(
    localPath + '/login',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'email': email,
      'password': password,
    }),
  );

  if (response.statusCode == 200) {
    // Se o registro funcionou, cria o usuario local.
    return User(
        email: email,
        password: password,
        name: json.decode(response.body)['name']);
  } else {
    // Caso contrário, lança erro.
    throw Exception('Failed to load post');
  }
}

Future<bool> register(String email, String password, String name) async {
  final response = await http.post(
    localPath + '/register',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'email': email,
      'password': password,
      'name': name,
    }),
  );

  if (response.statusCode == 200) {
    // Se o registro funcionou.
    return true;
  } else {
    // Caso contrário, lança erro.
    throw Exception('Failed to load post');
  }
}
