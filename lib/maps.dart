import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lavanda/Shared/appTranslate.dart';

class Map extends StatefulWidget {
  State createState() => MapState();
}

class MapState extends State<Map> {
  GoogleMapController mapController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
              AppTranslate(context).text(["profile", "location", "title"]))),
      body: Stack(
        children: <Widget>[
          GoogleMap(
            initialCameraPosition: CameraPosition(
                target: LatLng(-23.0096522, -43.4385644), zoom: 12),
          )
        ],
      ),
    );
  }
}
