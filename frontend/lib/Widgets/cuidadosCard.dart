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
      padding: EdgeInsets.all(10),
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
                    offset: Offset(0, 3), blurRadius: 6, color: kShadowColor)
          ]),
      child: Column(
        children: <Widget>[
          Image.asset(
            image,
            height: 90,
          ),
          Text(title, style: kTitleTextstyle.copyWith(color: Colors.black))
        ],
      ),
    );
  }
}
