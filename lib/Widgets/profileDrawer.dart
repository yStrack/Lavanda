import 'package:lavanda/constants.dart';
import 'package:flutter/material.dart';
import 'package:lavanda/Shared/camera.dart';

class ProfileDrawer extends StatelessWidget {
  // final String image;
  final String name;
  final String username;
  const ProfileDrawer({
    Key key,
    // this.image,
    this.name,
    this.username,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: kPrimary300Color,
            ),
            child: Text(
              this.name,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          FlatButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => TakePictureScreen(
                  // Pass the appropriate camera to the TakePictureScreen widget.
                  camera: camera,
                ),
              ));
            },
            child: Text(
              "Camera",
            ),
          ),
          ListTile(
            leading: Icon(Icons.message),
            title: Text('Messages'),
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Outro'),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
          ),
        ],
      ),
    );
  }
}
