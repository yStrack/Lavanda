import 'dart:async';

import 'package:camera/camera.dart';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:lavanda/Shared/appLocations.dart';
import 'package:lavanda/constants.dart';
import 'package:lavanda/Model/categories.dart';
import 'package:lavanda/loginScreen.dart';
import 'package:lavanda/Widgets/activityCard.dart';
import 'package:lavanda/Widgets/cuidadosCard.dart';
import 'package:lavanda/Widgets/clipper.dart';
import 'package:lavanda/Widgets/profileDrawer.dart';

Future<void> main() async {
  // Ensure that plugin services are initialized so that `availableCameras()`
  // can be called before `runApp()`
  WidgetsFlutterBinding.ensureInitialized();

  // Obtain a list of the available cameras on the device.
  final cameras = await availableCameras();

  // Get a specific camera from the list of available cameras.
  camera = cameras.last;

  runApp(MyApp());
}

// void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('pt'), // BRASILEIRO
        Locale('en'), // English
        Locale('es'), // Spanish
      ],
      debugShowCheckedModeBanner: false,
      title: 'Lavanda',
      theme: ThemeData(
          primaryColor: kPrimary300Color,
          accentColor: kPrimary400Color,
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
      appBar: AppBar(
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [kPrimary300Color, kPrimary400Color])),
        ),
      ),
      drawer: ProfileDrawer(name: widget.username),
      body: Column(
        children: <Widget>[
          ClipPath(
            clipper: MyClipper(),
            child: Container(
              padding: EdgeInsets.only(left: 20, top: 20, right: 20),
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [kPrimary400Color, kPrimary300Color])),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
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
