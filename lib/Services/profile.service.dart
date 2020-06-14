import 'dart:async';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:lavanda/constants.dart';

void updateProfile(String email, String password, File image) async {
  //create multipart request for POST or PATCH method
  var request = http.MultipartRequest("POST", Uri.parse(urlPath + '/update'));
  request.fields["email"] = email;
  request.fields["password"] = password;
  //create multipart using filepath, string or bytes
  var pic = await http.MultipartFile.fromPath("image", image.path);
  //add multipart to request
  request.files.add(pic);
  var response = await request.send();

  //Get the response from the server
  var responseData = await response.stream.toBytes();
  var responseString = String.fromCharCodes(responseData);
  print(responseString);

  // if (response.statusCode == 200) {
  //   // Se o registro funcionou, cria o usuario local.
  //   print("Status code 200");
  //   return User(
  //       email: email,
  //       password: password,
  //       name: json.decode(response.body)['name']);
  // } else {
  //   // Caso contrário, lança erro.
  //   throw Exception('Failed to load post');
  // }
}
