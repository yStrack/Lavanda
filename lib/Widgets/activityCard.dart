import 'package:lavanda/constants.dart';
import 'package:flutter/material.dart';

class ActivityCard extends StatelessWidget {
  final String image;
  final String name;
  const ActivityCard({
    Key key,
    this.image,
    this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      height: 150,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          // color: Colors.white,
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [kPrimary300Color, kPrimary400Color]),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 8), blurRadius: 20, color: kTextLightColor)
          ],
          image: DecorationImage(
            image: AssetImage(image),
            // fit: BoxFit.fill,
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            name,
            style: kTitleTextstyle.copyWith(color: Colors.white),
          )
        ],
      ),
    );
  }
}
