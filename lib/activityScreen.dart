import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lavanda/Model/categories.dart';
import 'package:lavanda/constants.dart';
import 'package:lavanda/main.dart';
import 'Widgets/clipper.dart';

class ActivityScreen extends StatefulWidget {
  final Category category;
  ActivityScreen(this.category);

  @override
  _ActivityScreenState createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ClipPath(
              clipper: MyClipper(),
              child: Container(
                padding: EdgeInsets.only(left: 20, top: 60, right: 40),
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [Color(0xFF3383CD), Color(0xFF11249F)])),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Align(
                        alignment: Alignment.topLeft,
                        child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      HomePage()));
                            },
                            child: SvgPicture.asset("assets/icons/menu.svg"))),
                    SizedBox(height: 45),
                    Expanded(
                        child: Stack(children: <Widget>[
                      Positioned(
                          left: 0,
                          child: Text("${widget.category.name}",
                              style: kHeadingTextStyle.copyWith(
                                  color: Colors.white, fontFamily: "Poppins"))),
                      Positioned(
                          top: 40,
                          child: Text("Aprenda mais sobre a atividade!",
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
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                          "Procedimentos",
                          style: kCuidadosTitleTextstyle,
                        )
                      ],
                    ),
                    SizedBox(height: 10),
                    Column(
                      children: categories
                          .map(
                            (item) => Card(
                              child: ListTile(
                                leading: FlutterLogo(size: 56.0),
                                title: Text('Nome do procedimento X',
                                    style: kTitleTextstyle.copyWith(
                                        fontFamily: 'Poppins', fontSize: 16)),
                                subtitle: Text(
                                  'Descricao de como fazer',
                                  style: TextStyle(fontFamily: 'Poppins'),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
