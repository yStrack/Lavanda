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
            leading: Icon(Icons.account_circle),
            title: Text('Nome',
                style: kTitleTextstyle.copyWith(
                    fontFamily: 'Poppins', fontSize: 16)),
            subtitle: Text(
              '${user.name}',
              style: TextStyle(fontFamily: 'Poppins'),
            ),
          ),
          ListTile(
            leading: Icon(Icons.mail),
            title: Text('Email',
                style: kTitleTextstyle.copyWith(
                    fontFamily: 'Poppins', fontSize: 16)),
            subtitle: Text(
              '${user.email}',
              style: TextStyle(fontFamily: 'Poppins'),
            ),
          ),
          ListTile(
            leading: Icon(Icons.lock),
            title: Text('Senha',
                style: kTitleTextstyle.copyWith(
                    fontFamily: 'Poppins', fontSize: 16)),
            subtitle: Text(
              '****',
              style: TextStyle(fontFamily: 'Poppins'),
            ),
          ),
          ListTile(
              leading: Icon(Icons.location_on),
              title: Text('Localização',
                  style: kTitleTextstyle.copyWith(
                      fontFamily: 'Poppins', fontSize: 16)),
              subtitle: Text(
                'Sua residência',
                style: TextStyle(fontFamily: 'Poppins'),
              ),
              trailing: Icon(Icons.edit)),
        ],
      ),
    );
  }
}
