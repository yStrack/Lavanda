import 'package:lavanda/Shared/appTranslate.dart';
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
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text(AppTranslate(context).text("name"),
                style: kTitleTextstyle.copyWith(
                    fontFamily: 'Poppins', fontSize: 16)),
            subtitle: Text(
              '${user.name}',
              style: TextStyle(fontFamily: 'Poppins'),
            ),
          ),
          ListTile(
            leading: Icon(Icons.mail),
            title: Text(AppTranslate(context).text("email"),
                style: kTitleTextstyle.copyWith(
                    fontFamily: 'Poppins', fontSize: 16)),
            subtitle: Text(
              '${user.email}',
              style: TextStyle(fontFamily: 'Poppins'),
            ),
          ),
          ListTile(
            leading: Icon(Icons.lock),
            title: Text(AppTranslate(context).text("pass"),
                style: kTitleTextstyle.copyWith(
                    fontFamily: 'Poppins', fontSize: 16)),
            subtitle: Text(
              '*' * user.password.length,
              style: TextStyle(fontFamily: 'Poppins'),
            ),
          ),
          ListTile(
              leading: Icon(Icons.location_on),
              title: Text(AppTranslate(context).text("location"),
                  style: kTitleTextstyle.copyWith(
                      fontFamily: 'Poppins', fontSize: 16)),
              subtitle: Text(
                AppTranslate(context).text("locationTip"),
                style: TextStyle(fontFamily: 'Poppins'),
              ),
              trailing: Icon(Icons.edit)),
        ],
      ),
    );
  }
}
