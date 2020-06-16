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
                              AppTranslate(context)
                                  .text("${widget.category.name}"),
                              style: kHeadingTextStyle.copyWith(
                                  color: Colors.white, fontFamily: "Poppins"))),
                      Positioned(
                          top: 40,
                          child: Text(AppTranslate(context).text("learnMore"),
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
                child: widget.category.name != "washHands"
                    ? Column(children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text(
                              AppTranslate(context).text("procedures"),
                              style: kCuidadosTitleTextstyle,
                            )
                          ],
                        ),
                        SizedBox(height: 10),
                        Column(children: <Widget>[
                          Card(
                            child: ListTile(
                              leading: Image.asset(
                                "assets/images/dente-01.png",
                                height: 100,
                              ),
                              title: Text(
                                  AppTranslate(context).text(
                                      "${widget.category.name[0]}" + "title1"),
                                  style: kTitleTextstyle.copyWith(
                                      fontFamily: 'Poppins', fontSize: 16)),
                              subtitle: Text(
                                AppTranslate(context).text(
                                    "${widget.category.name[0]}" + "subTitle1"),
                                style: TextStyle(fontFamily: 'Poppins'),
                              ),
                            ),
                          ),
                          Card(
                            child: ListTile(
                              leading: Image.asset(
                                "assets/images/dente-02.png",
                                height: 100,
                              ),
                              title: Text(
                                  AppTranslate(context).text(
                                      "${widget.category.name[0]}" + "title2"),
                                  style: kTitleTextstyle.copyWith(
                                      fontFamily: 'Poppins', fontSize: 16)),
                              subtitle: Text(
                                AppTranslate(context).text(
                                    "${widget.category.name[0]}" + "subTitle2"),
                                style: TextStyle(fontFamily: 'Poppins'),
                              ),
                            ),
                          ),
                          Card(
                            child: ListTile(
                              leading: Image.asset(
                                "assets/images/dente-03.png",
                                height: 100,
                              ),
                              title: Text(
                                  AppTranslate(context).text(
                                      "${widget.category.name[0]}" + "title3"),
                                  style: kTitleTextstyle.copyWith(
                                      fontFamily: 'Poppins', fontSize: 16)),
                              subtitle: Text(
                                AppTranslate(context).text(
                                    "${widget.category.name[0]}" + "subTitle3"),
                                style: TextStyle(fontFamily: 'Poppins'),
                              ),
                            ),
                          ),
                          Card(
                            child: ListTile(
                              leading: Image.asset(
                                "assets/images/dente-04.png",
                                height: 100,
                              ),
                              title: Text(
                                  AppTranslate(context).text(
                                      "${widget.category.name[0]}" + "title4"),
                                  style: kTitleTextstyle.copyWith(
                                      fontFamily: 'Poppins', fontSize: 16)),
                              subtitle: Text(
                                AppTranslate(context).text(
                                    "${widget.category.name[0]}" + "subTitle4"),
                                style: TextStyle(fontFamily: 'Poppins'),
                              ),
                            ),
                          ),
                          Card(
                            child: ListTile(
                              leading: Image.asset(
                                "assets/images/dente-05.png",
                                height: 100,
                              ),
                              title: Text(
                                  AppTranslate(context).text(
                                      "${widget.category.name[0]}" + "title5"),
                                  style: kTitleTextstyle.copyWith(
                                      fontFamily: 'Poppins', fontSize: 16)),
                              subtitle: Text(
                                AppTranslate(context).text(
                                    "${widget.category.name[0]}" + "subTitle5"),
                                style: TextStyle(fontFamily: 'Poppins'),
                              ),
                            ),
                          )
                        ])
                      ])
                    : Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(
                                AppTranslate(context).text("procedures"),
                                style: kCuidadosTitleTextstyle,
                              )
                            ],
                          ),
                          SizedBox(height: 10),
                          Column(
                            children: <Widget>[
                              Card(
                                child: ListTile(
                                  leading: Image.asset(
                                    "assets/images/maos-01.png",
                                    height: 100,
                                  ),
                                  title: Text(
                                      AppTranslate(context).text(
                                          "${widget.category.name[0]}" +
                                              "title1"),
                                      style: kTitleTextstyle.copyWith(
                                          fontFamily: 'Poppins', fontSize: 16)),
                                  subtitle: Text(
                                    AppTranslate(context).text(
                                        "${widget.category.name[0]}" +
                                            "subTitle1"),
                                    style: TextStyle(fontFamily: 'Poppins'),
                                  ),
                                ),
                              ),
                              Card(
                                child: ListTile(
                                  leading: Image.asset(
                                    "assets/images/maos-02.png",
                                    height: 100,
                                  ),
                                  title: Text(
                                      AppTranslate(context).text(
                                          "${widget.category.name[0]}" +
                                              "title2"),
                                      style: kTitleTextstyle.copyWith(
                                          fontFamily: 'Poppins', fontSize: 16)),
                                  subtitle: Text(
                                    AppTranslate(context).text(
                                        "${widget.category.name[0]}" +
                                            "subTitle2"),
                                    style: TextStyle(fontFamily: 'Poppins'),
                                  ),
                                ),
                              ),
                              Card(
                                child: ListTile(
                                  leading: Image.asset(
                                    "assets/images/maos-03.png",
                                    height: 100,
                                  ),
                                  title: Text(
                                      AppTranslate(context).text(
                                          "${widget.category.name[0]}" +
                                              "title3"),
                                      style: kTitleTextstyle.copyWith(
                                          fontFamily: 'Poppins', fontSize: 16)),
                                  subtitle: Text(
                                    AppTranslate(context).text(
                                        "${widget.category.name[0]}" +
                                            "subTitle3"),
                                    style: TextStyle(fontFamily: 'Poppins'),
                                  ),
                                ),
                              ),
                              Card(
                                child: ListTile(
                                  leading: Image.asset(
                                    "assets/images/maos-04.png",
                                    height: 100,
                                  ),
                                  title: Text(
                                      AppTranslate(context).text(
                                          "${widget.category.name[0]}" +
                                              "title4"),
                                      style: kTitleTextstyle.copyWith(
                                          fontFamily: 'Poppins', fontSize: 16)),
                                  subtitle: Text(
                                    AppTranslate(context).text(
                                        "${widget.category.name[0]}" +
                                            "subTitle4"),
                                    style: TextStyle(fontFamily: 'Poppins'),
                                  ),
                                ),
                              ),
                              Card(
                                child: ListTile(
                                  leading: Image.asset(
                                    "assets/images/maos-05.png",
                                    height: 100,
                                  ),
                                  title: Text(
                                      AppTranslate(context).text(
                                          "${widget.category.name[0]}" +
                                              "title5"),
                                      style: kTitleTextstyle.copyWith(
                                          fontFamily: 'Poppins', fontSize: 16)),
                                  subtitle: Text(
                                    AppTranslate(context).text(
                                        "${widget.category.name[0]}" +
                                            "subTitle5"),
                                    style: TextStyle(fontFamily: 'Poppins'),
                                  ),
                                ),
                              ),
                              Card(
                                child: ListTile(
                                  leading: Image.asset(
                                    "assets/images/maos-06.png",
                                    height: 100,
                                  ),
                                  title: Text(
                                      AppTranslate(context).text(
                                          "${widget.category.name[0]}" +
                                              "title6"),
                                      style: kTitleTextstyle.copyWith(
                                          fontFamily: 'Poppins', fontSize: 16)),
                                  subtitle: Text(
                                    AppTranslate(context).text(
                                        "${widget.category.name[0]}" +
                                            "subTitle6"),
                                    style: TextStyle(fontFamily: 'Poppins'),
                                  ),
                                ),
                              ),
                              Card(
                                child: ListTile(
                                  leading: Image.asset(
                                    "assets/images/maos-07.png",
                                    height: 100,
                                  ),
                                  title: Text(
                                      AppTranslate(context).text(
                                          "${widget.category.name[0]}" +
                                              "title7"),
                                      style: kTitleTextstyle.copyWith(
                                          fontFamily: 'Poppins', fontSize: 16)),
                                  subtitle: Text(
                                    AppTranslate(context).text(
                                        "${widget.category.name[0]}" +
                                            "subTitle7"),
                                    style: TextStyle(fontFamily: 'Poppins'),
                                  ),
                                ),
                              ),
                              Card(
                                child: ListTile(
                                  leading: Image.asset(
                                    "assets/images/maos-08.png",
                                    height: 100,
                                  ),
                                  title: Text(
                                      AppTranslate(context).text(
                                          "${widget.category.name[0]}" +
                                              "title8"),
                                      style: kTitleTextstyle.copyWith(
                                          fontFamily: 'Poppins', fontSize: 16)),
                                  subtitle: Text(
                                    AppTranslate(context).text(
                                        "${widget.category.name[0]}" +
                                            "subTitle8"),
                                    style: TextStyle(fontFamily: 'Poppins'),
                                  ),
                                ),
                              ),
                              Card(
                                child: ListTile(
                                  leading: Image.asset(
                                    "assets/images/maos-09.png",
                                    height: 100,
                                  ),
                                  title: Text(
                                      AppTranslate(context).text(
                                          "${widget.category.name[0]}" +
                                              "title9"),
                                      style: kTitleTextstyle.copyWith(
                                          fontFamily: 'Poppins', fontSize: 16)),
                                  subtitle: Text(
                                    AppTranslate(context).text(
                                        "${widget.category.name[0]}" +
                                            "subTitle9"),
                                    style: TextStyle(fontFamily: 'Poppins'),
                                  ),
                                ),
                              ),
                              Card(
                                child: ListTile(
                                  leading: Image.asset(
                                    "assets/images/maos-10.png",
                                    height: 100,
                                  ),
                                  title: Text(
                                      AppTranslate(context).text(
                                          "${widget.category.name[0]}" +
                                              "title10"),
                                      style: kTitleTextstyle.copyWith(
                                          fontFamily: 'Poppins', fontSize: 16)),
                                  subtitle: Text(
                                    AppTranslate(context).text(
                                        "${widget.category.name[0]}" +
                                            "subTitle10"),
                                    style: TextStyle(fontFamily: 'Poppins'),
                                  ),
                                ),
                              ),
                              Card(
                                child: ListTile(
                                  leading: Image.asset(
                                    "assets/images/maos-11.png",
                                    height: 100,
                                  ),
                                  title: Text(
                                      AppTranslate(context).text(
                                          "${widget.category.name[0]}" +
                                              "title11"),
                                      style: kTitleTextstyle.copyWith(
                                          fontFamily: 'Poppins', fontSize: 16)),
                                  subtitle: Text(
                                    AppTranslate(context).text(
                                        "${widget.category.name[0]}" +
                                            "subTitle11"),
                                    style: TextStyle(fontFamily: 'Poppins'),
                                  ),
                                ),
                              ),
                              Card(
                                child: ListTile(
                                  leading: Image.asset(
                                    "assets/images/maos-12.png",
                                    height: 100,
                                  ),
                                  title: Text(
                                      AppTranslate(context).text(
                                          "${widget.category.name[0]}" +
                                              "title12"),
                                      style: kTitleTextstyle.copyWith(
                                          fontFamily: 'Poppins', fontSize: 16)),
                                  subtitle: Text(
                                    AppTranslate(context).text(
                                        "${widget.category.name[0]}" +
                                            "subTitle12"),
                                    style: TextStyle(fontFamily: 'Poppins'),
                                  ),
                                ),
                              ),
                              Card(
                                child: ListTile(
                                  leading: Image.asset(
                                    "assets/images/maos-13.png",
                                    height: 100,
                                  ),
                                  title: Text(
                                      AppTranslate(context).text(
                                          "${widget.category.name[0]}" +
                                              "title13"),
                                      style: kTitleTextstyle.copyWith(
                                          fontFamily: 'Poppins', fontSize: 16)),
                                  subtitle: Text(
                                    AppTranslate(context).text(
                                        "${widget.category.name[0]}" +
                                            "subTitle13"),
                                    style: TextStyle(fontFamily: 'Poppins'),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ))
          ],
        ),
      ),
    );
  }
}
