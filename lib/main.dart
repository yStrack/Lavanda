import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lavanda/activityScreen.dart';
import 'package:lavanda/constants.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:lavanda/Model/categories.dart';
import 'package:lavanda/Widgets/activityCard.dart';
import 'package:lavanda/Widgets/cuidadosCard.dart';
import 'package:lavanda/Widgets/clipper.dart';
import 'package:lavanda/loginScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lavanda',
      theme: ThemeData(
          scaffoldBackgroundColor: kBackgroundColor,
          fontFamily: "Poppins",
          textTheme: TextTheme(
            body1: TextStyle(color: kBodyTextColor),
          )),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                                    ActivityScreen(Category(categories[0].name,
                                        categories[0].image))));
                          },
                          child: SvgPicture.asset("assets/icons/menu.svg"))),
                  SizedBox(height: 45),
                  Expanded(
                      child: Stack(children: <Widget>[
                    Positioned(
                        left: 0,
                        child: Text("Olá Emanuel,",
                            style: kHeadingTextStyle.copyWith(
                                color: Colors.white))),
                    Positioned(
                        top: 40,
                        child: Text("A hora de se cuidar é agora!",
                            style: kSubHeadingTextStyle.copyWith(
                                color: Colors.white)))
                  ]))
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 10),
            child: Row(
              children: <Widget>[
                Text(
                  "Cuidados",
                  style: kCuidadosTitleTextstyle,
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Container(
              height: 131,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  CuidadosCard(
                    image: "assets/images/brush-teeth.png",
                    title: "Mão no rosto",
                    isActive: true,
                  ),
                  CuidadosCard(
                    image: "assets/images/brush-teeth.png",
                    title: "Tossir",
                    isActive: true,
                  ),
                  CuidadosCard(
                    image: "assets/images/brush-teeth.png",
                    title: "Espirrar",
                    isActive: true,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 10),
            child: Row(
              children: <Widget>[
                Text(
                  "Atividades pessoais",
                  style: kCuidadosTitleTextstyle,
                )
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: StaggeredGridView.countBuilder(
                padding: EdgeInsets.all(0),
                crossAxisCount: 2,
                itemCount: categories.length,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                itemBuilder: (context, index) {
                  return ActivityCard(
                    image: categories[index].image,
                    name: categories[index].name,
                  );
                },
                staggeredTileBuilder: (index) => StaggeredTile.fit(1),
              ),
            ),
          )
        ],
      ),
    );
  }
}
