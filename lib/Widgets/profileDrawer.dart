import 'package:lavanda/Shared/appTranslate.dart';
import 'package:lavanda/constants.dart';
import 'package:flutter/material.dart';
import 'package:lavanda/Shared/camera.dart';
import 'package:lavanda/maps.dart';

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
    var prof = {
      "name": Icons.account_circle,
      "email": Icons.mail,
      "password": Icons.lock,
      "location": Icons.location_on,
    };
    return Drawer(
      child: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 60),
            child: Center(
              child: AspectRatio(
                aspectRatio: 1 / 1,
                child: Stack(children: [
                  AspectRatio(
                    aspectRatio: 1 / 1,
                    child: ClipOval(
                      child: FadeInImage(
                          image: NetworkImage(user.imageUrl),
                          placeholder: AssetImage('assets/images/profile.png'),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Align(
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
                ]),
              ),
            ),
          ),
          for (var key in prof.keys)
            ListTile(
              leading: Icon(prof[key]),
              title: Text(AppTranslate(context).text(["profile", key, "title"]),
                  style: kTitleTextstyle.copyWith(
                      fontFamily: 'Poppins', fontSize: 16)),
              subtitle: Text(
                key == 'password'
                    ? '*' * user.password.length
                    : '${user.toMap()[key]}',
                style: TextStyle(fontFamily: 'Poppins'),
              ),
              trailing: key == 'location'
                  ? IconButton(
                      icon: Icon(Icons.edit),
                      tooltip: 'Increase volume by 10',
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => Map()));
                      },
                    )
                  : null,
            ),
        ],
      ),
    );
  }
}
