import 'dart:async';
import 'dart:convert';

import 'package:camera/camera.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:lavanda/Shared/appLocalization.dart';

import 'package:lavanda/constants.dart';
import 'package:lavanda/Model/categories.dart';
import 'package:lavanda/loginScreen.dart';
import 'package:lavanda/Widgets/activityCard.dart';
import 'package:lavanda/Widgets/cuidadosCard.dart';
import 'package:lavanda/Widgets/clipper.dart';
import 'package:lavanda/Widgets/profileDrawer.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:location_permissions/location_permissions.dart';

import 'Shared/appTranslate.dart';

List getLocations(prefs) {
  var storedValue = prefs.getString('locations');
  if (storedValue == null) {
    storedValue = jsonEncode([]);
  }
  var locations = jsonDecode(storedValue);
  return locations;
}

Future<void> main() async {
  bool callbackLocation = false;
  // can be called before `runApp()`
  WidgetsFlutterBinding.ensureInitialized();

  PermissionStatus currPermission =
      await LocationPermissions().checkPermissionStatus();
  if (currPermission != PermissionStatus.granted) {
    await LocationPermissions().requestPermissions();
  }
  ServiceStatus serviceStatus =
      await LocationPermissions().checkServiceStatus();
  if (serviceStatus == ServiceStatus.enabled) {
    const MethodChannel _channel = const MethodChannel('geolocation_plugin');
    _channel.setMethodCallHandler((MethodCall call) async {
      print(call.method);
      if (call.method == "callbackLocation") {
        callbackLocation = true;

        var lat = call.arguments.split(',')[0];
        var lon = call.arguments.split(',')[1];
        var vel = call.arguments.split(',')[2];
        var isRunningInBackground = call.arguments.split(',')[3];

        if (isRunningInBackground == "true") {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          List locations = getLocations(prefs);
          locations.add({'lat': lat, 'lon': lon});
          prefs.setString('locations', jsonEncode(locations));
        }
      }
    });
  }

  // Obtain a list of the available cameras on the device.
  final cameras = await availableCameras();

  // Get a specific camera from the list of available cameras.
  camera = cameras.last;

  runApp(MyApp(
    callbackLocation: callbackLocation,
  ));
}

// void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  bool callbackLocation = false;

  MyApp({this.callbackLocation});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    if (callbackLocation) {
      return SizedBox();
    }

    return MaterialApp(
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
      supportedLocales: [Locale('pt'), Locale('en'), Locale('es')],
      localizationsDelegates: [
        AppLocalization.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      // localeResolutionCallback: (locale, supportedLocales) {
      //   for (var local in supportedLocales) {
      //     if (local.languageCode == locale.languageCode) {
      //       return local;
      //     }
      //   }
      //   return supportedLocales.first;
      // },
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
                        child: Text(
                            AppTranslate(context).text(["label", "hello"]) +
                                ' ${widget.username},',
                            style: kHeadingTextStyle.copyWith(
                                color: Colors.white))),
                    Positioned(
                        top: 40,
                        child: Text(
                            AppTranslate(context)
                                .text(["label", "timeToTakeCareIsNow"]),
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
                  AppTranslate(context).text(["label", "cares"]),
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
                  AppTranslate(context).text(["label", "personalActivities"]),
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
                            child: ActivityCard(category: item))),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
