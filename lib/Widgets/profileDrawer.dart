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
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 60),
            child: Center(
              child: AspectRatio(
                aspectRatio: 1 / 1,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: user.imageUrl != 'null'
                            ? NetworkImage(user.imageUrl)
                            : NetworkImage(
                                'https://sumaleeboxinggym.com/wp-content/uploads/2018/06/Generic-Profile-1600x1600.png')),
                  ),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      decoration: const ShapeDecoration(
                        color: kPrimary400Color,
                        shape: CircleBorder(),
                      ),
                      child: IconButton(
                        icon: Icon(Icons.camera_alt),
                        color: Colors.white,
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) =>
                                TakePictureScreen(
                              // Pass the appropriate camera to the TakePictureScreen widget.
                              camera: camera,
                            ),
                          ));
                        },
                      ),
                    ),
                  ),
                ),
              ),
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
