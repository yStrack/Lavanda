import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lavanda/Shared/appTranslate.dart';
import 'package:lavanda/constants.dart';

import 'Services/profile.service.dart';

class Map extends StatefulWidget {
  State createState() => MapState();
}

class MapState extends State<Map> {
  Completer<GoogleMapController> _controller = Completer();

  List<Marker> markers = [];

  @override
  void initState() {
    super.initState();
    user.location[0] != 0
        ? markers.add(Marker(
            markerId: MarkerId("home"),
            draggable: false,
            position: LatLng(user.location[1], user.location[0])))
        : markers = [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
              AppTranslate(context).text(["profile", "location", "title"]))),
      body: Stack(
        children: <Widget>[
          Builder(
            builder: (context) => GoogleMap(
              initialCameraPosition: CameraPosition(
                  target: LatLng(-23.0096522, -43.4385644), zoom: 16),
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
              markers: Set.from(markers),
              myLocationEnabled: true,
              myLocationButtonEnabled: false,
              onTap: (LatLng point) async {
                if (markers.length == 0) {
                  setState(() {
                    markers.add(Marker(
                        markerId: MarkerId("home"),
                        draggable: false,
                        position: point));
                  });
                  Scaffold.of(context).showSnackBar(new SnackBar(
                      content: new Text(AppTranslate(context)
                          .text(["label", "addLocation"]))));

                  print(point.latitude);
                  await updateLocation(user.email, user.password,
                      point.latitude, point.longitude);
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
