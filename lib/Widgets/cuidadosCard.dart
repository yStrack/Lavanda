import 'package:lavanda/constants.dart';
import 'package:flutter/material.dart';

class CuidadosCard extends StatelessWidget {
  final String image;
  final String title;
  final bool isActive;
  const CuidadosCard({
    Key key,
    this.image,
    this.title,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 80,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
            boxShadow: [
              isActive
                  ? BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 20,
                      color: kActiveShadowColor)
                  : BoxShadow(
                      offset: Offset(0, 8),
                      blurRadius: 6,
                      color: kTextLightColor)
            ],
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.contain,
            )),
        child: FlatButton(
          onPressed: () {
            print('Clicou no cuidadosCard');
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Text(
              //   name,
              //   style: kTitleTextstyle.copyWith(color: Colors.white),
              // )
            ],
          ),
        ));
  }
}
