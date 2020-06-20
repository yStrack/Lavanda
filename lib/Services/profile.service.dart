import 'dart:async';
import 'dart:io';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:lavanda/Model/user.dart';
import 'package:lavanda/constants.dart';

Future updateImage(String email, String password, File image) async {
  //create multipart request for POST or PATCH method
  var request = http.MultipartRequest("POST", Uri.parse(urlPath + '/update'));
  request.fields["email"] = email;
  request.fields["password"] = password;
  //create multipart using filepath, string or bytes
  var pic = await http.MultipartFile.fromPath("image", image.path);
  //add multipart to request
  request.files.add(pic);
  var streamedResponse = await request.send();
  var response = await http.Response.fromStream(streamedResponse);

  if (response.statusCode == 200) {
    // Se o registro funcionou, cria o usuario local.
    print("Status code 200");
    print('image.path ' + image.path);
    print('response.body ' + response.body);
    user = new User(
      email: json.decode(response.body)['email'],
      password: json.decode(response.body)['password'],
      name: json.decode(response.body)['name'],
      image: json.decode(response.body)['image'],
      imageUrl: json.decode(response.body)['image_url'],
      location: json.decode(response.body)['location']['coordinates'],
    );
    return true;
  } else {
    // Caso contrário, lança erro.
    throw Exception('Failed to save profile');
  }
}

Future updateLocation(
    String email, String password, double latitude, double longitude) async {
  print(longitude);
  print(latitude);
  final response = await http.post(
    urlPath + '/updateLocation',
    headers: <String, String>{
      'Accept': 'application/json',
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode({
      'email': email,
      'password': password,
      'latitude': latitude,
      'longitude': longitude,
    }),
  );

  if (response.statusCode == 200) {
    // Se o registro funcionou, cria o usuario local.
    print("Status code 200");
    print('response.body ' + response.body);
    user = new User(
      email: json.decode(response.body)['email'],
      password: json.decode(response.body)['password'],
      name: json.decode(response.body)['name'],
      image: json.decode(response.body)['image'],
      imageUrl: json.decode(response.body)['image_url'],
      location: json.decode(response.body)['location']['coordinates'],
    );
    return true;
  } else {
    // Caso contrário, lança erro.
    throw Exception('Failed to save profile');
  }
}
