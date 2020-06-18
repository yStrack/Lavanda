import 'package:lavanda/Model/categories.dart';
import 'package:lavanda/activityScreen.dart';
import 'package:lavanda/constants.dart';
import 'package:flutter/material.dart';

class ActivityCard extends StatelessWidget {
  final Category category;
  final String username;
  const ActivityCard({
    Key key,
    this.category,
    this.username,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 150,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            // color: Colors.white,
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [kPrimary200Color, kPrimary400Color]),
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 8), blurRadius: 20, color: kTextLightColor)
            ],
            image: DecorationImage(
              image: AssetImage(category.image),
              // fit: BoxFit.fill,
            )),
        child: FlatButton(
          onPressed: () {
            print('Clicou no ActivityCard');
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) =>
                    ActivityScreen(category, 'test')));
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
