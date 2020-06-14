import 'dart:async';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:lavanda/constants.dart';

Future updateProfile(String email, String password, File image) async {
  //create multipart request for POST or PATCH method
  var request = http.MultipartRequest("POST", Uri.parse(urlPath + '/update'));
  request.fields["email"] = email;
  request.fields["password"] = password;
  //create multipart using filepath, string or bytes
  var pic = await http.MultipartFile.fromPath("image", image.path);
  //add multipart to request
  request.files.add(pic);
  var response = await request.send();

  if (response.statusCode == 200) {
    // Se o registro funcionou, cria o usuario local.
    print("Status code 200: " + image.path);
    return true;
  } else {
    // Caso contrário, lança erro.
    throw Exception('Failed to save profile');
  }
}
