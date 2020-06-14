import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';

import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:lavanda/activityScreen.dart';
import 'package:lavanda/constants.dart';
import 'package:lavanda/Shared/camera.dart';
import 'package:lavanda/Model/categories.dart';
import 'package:lavanda/Widgets/activityCard.dart';
import 'package:lavanda/Widgets/cuidadosCard.dart';
import 'package:lavanda/Widgets/clipper.dart';
import 'package:lavanda/loginScreen.dart';
import 'package:lavanda/registerScreen.dart';

CameraDescription camera;

// Future<void> main() async {
//   // Ensure that plugin services are initialized so that `availableCameras()`
//   // can be called before `runApp()`
//   WidgetsFlutterBinding.ensureInitialized();

//   // Obtain a list of the available cameras on the device.
//   final cameras = await availableCameras();

//   // Get a specific camera from the list of available cameras.
//   camera = cameras.last;

//   runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lavanda',
      theme: ThemeData(
          scaffoldBackgroundColor: kBackgroundColor,
          fontFamily: 'Poppins',
          textTheme: TextTheme(
            body1: TextStyle(color: kBodyTextColor),
          )),
      home: LoginScreen(),
    );
  }
}

class HomePage extends StatefulWidget {
  final String username;

  HomePage(this.username);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          ClipPath(
            clipper: MyClipper(),
            child: Container(
              padding: EdgeInsets.only(left: 20, top: 60, right: 20),
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [kPrimary300Color, kPrimary400Color])),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Align(
                      alignment: Alignment.topLeft,
                      child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  TakePictureScreen(
                                // Pass the appropriate camera to the TakePictureScreen widget.
                                camera: camera,
                              ),
                            ));
                          },
                          child: SvgPicture.asset('assets/icons/menu.svg'))),
                  SizedBox(height: 45),
                  Expanded(
                      child: Stack(children: <Widget>[
                    Positioned(
                        left: 0,
                        child: Text('Olá ${widget.username},',
                            style: kHeadingTextStyle.copyWith(
                                color: Colors.white))),
                    Positioned(
                        top: 40,
                        child: Text('A hora de se cuidar é agora!',
                            style: kSubHeadingTextStyle.copyWith(
                                color: Colors.white)))
                  ]))
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 10),
            child: Row(
              children: <Widget>[
                Text(
                  'Cuidados',
                  style: kCuidadosTitleTextstyle,
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              // height: 131,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                      child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: CuidadosCard(
                            image: 'assets/images/tosse.png',
                            title: '',
                            isActive: true,
                          ))),
                  Expanded(
                      child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: CuidadosCard(
                            image: 'assets/images/aglomeracao.png',
                            title: '',
                            isActive: true,
                          ))),
                  Expanded(
                      child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: CuidadosCard(
                            image: 'assets/images/rosto.png',
                            title: '',
                            isActive: true,
                          ))),
                ],
              ),
            ),
          ),
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 10),
            child: Row(
              children: <Widget>[
                Text(
                  'Atividades pessoais',
                  style: kCuidadosTitleTextstyle,
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              // height: 131,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  for (var item in categories)
                    Expanded(
                        child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: ActivityCard(
                              image: item.image,
                              name: item.name,
                              // isActive: true,
                            ))),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
