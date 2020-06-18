import 'package:flutter/material.dart';
import 'package:lavanda/Model/categories.dart';
import 'package:lavanda/constants.dart';
import 'Shared/appTranslate.dart';
import 'Widgets/clipper.dart';

class ActivityScreen extends StatefulWidget {
  final Category category;
  final String username;
  ActivityScreen(this.category, this.username);

  @override
  _ActivityScreenState createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [kPrimary300Color, kPrimary400Color])),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ClipPath(
              clipper: MyClipper(),
              child: Container(
                padding: EdgeInsets.only(left: 20, top: 20, right: 40),
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [kPrimary400Color, kPrimary300Color])),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                        child: Stack(children: <Widget>[
                      Positioned(
                          left: 0,
                          child: Text(
                              AppTranslate(context).text([
                                "activities",
                                "${widget.category.name}",
                                "title"
                              ]),
                              style: kHeadingTextStyle.copyWith(
                                  color: Colors.white, fontFamily: "Poppins"))),
                      Positioned(
                          top: 40,
                          child: Text(
                              AppTranslate(context)
                                  .text(["label", "learnMore"]),
                              style: kLabelBoldStyle.copyWith(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w200)))
                    ]))
                  ],
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Column(children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        AppTranslate(context).text(["label", "procedures"]),
                        style: kCuidadosTitleTextstyle,
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                  Column(children: <Widget>[
                    for (var i = 0; i < widget.category.step; i++)
                      Card(
                        child: ListTile(
                          leading: Image.asset(
                            "assets/images/${widget.category.fileName}-${i + 1}.png",
                            height: 100,
                          ),
                          title: Text(
                              AppTranslate(context).text([
                                "activities",
                                "${widget.category.name}",
                                "step",
                                i,
                                "title"
                              ]),
                              style: kTitleTextstyle.copyWith(
                                  fontFamily: 'Poppins', fontSize: 16)),
                          subtitle: Text(
                            AppTranslate(context).text([
                              "activities",
                              "${widget.category.name}",
                              "step",
                              i,
                              "subTitle"
                            ]),
                            style: TextStyle(fontFamily: 'Poppins'),
                          ),
                        ),
                      ),
                  ])
                ]))
          ],
        ),
      ),
    );
  }
}
