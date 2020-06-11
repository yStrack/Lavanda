import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lavanda/Model/categories.dart';
import 'package:lavanda/constants.dart';
import 'package:lavanda/main.dart';
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
                        colors: [kPrimary300Color, kPrimary400Color])),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Align(
                        alignment: Alignment.topLeft,
                        child: GestureDetector(
                            onDoubleTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      HomePage(widget.username)));
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
                      children: <Widget>[
                        Card(
                          child: ListTile(
                            leading: Image.asset(
                              "assets/images/maos-01.png",
                              height: 100,
                            ),
                            title: Text('Molhe as mãos com água',
                                style: kTitleTextstyle.copyWith(
                                    fontFamily: 'Poppins', fontSize: 16)),
                            subtitle: Text(
                              '',
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
                            title: Text('Espalhe o sabonete',
                                style: kTitleTextstyle.copyWith(
                                    fontFamily: 'Poppins', fontSize: 16)),
                            subtitle: Text(
                              'Passe o sabonete por toda a superfície da mão',
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
                            title: Text('Ensaboar',
                                style: kTitleTextstyle.copyWith(
                                    fontFamily: 'Poppins', fontSize: 16)),
                            subtitle: Text(
                              'Ensaboe as palmas das mãos friccionando-as entre si',
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
                            title: Text('Esfregar',
                                style: kTitleTextstyle.copyWith(
                                    fontFamily: 'Poppins', fontSize: 16)),
                            subtitle: Text(
                              'Esfregue a palma da mão direita contra o dorso da mão esquerda, entrelaçando os dedos',
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
                            title: Text('Esfregar outra mão',
                                style: kTitleTextstyle.copyWith(
                                    fontFamily: 'Poppins', fontSize: 16)),
                            subtitle: Text(
                              'Repita o processo anterior com a mão esquerda contra o dorso da mão direita',
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
                            title: Text('Entre os dedos',
                                style: kTitleTextstyle.copyWith(
                                    fontFamily: 'Poppins', fontSize: 16)),
                            subtitle: Text(
                              'Entrelace os dedos e friccione os espaços entre eles',
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
                            title: Text('Ponta dos dedos',
                                style: kTitleTextstyle.copyWith(
                                    fontFamily: 'Poppins', fontSize: 16)),
                            subtitle: Text(
                              'Esfregue o dorso dos dedos de uma mão com a palma da mão oposta (e vice-versa), segurando os dedos, com movimento de vai-e-vem',
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
                            title: Text('Polegares',
                                style: kTitleTextstyle.copyWith(
                                    fontFamily: 'Poppins', fontSize: 16)),
                            subtitle: Text(
                              'Esfregue os polegares com o auxílio da palma da mão oposta, utilizando movimento circular',
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
                            title: Text('Concha',
                                style: kTitleTextstyle.copyWith(
                                    fontFamily: 'Poppins', fontSize: 16)),
                            subtitle: Text(
                              'Friccione as polpas digitais e unhas de uma mão contra a palma da mão oposta, fechada em concha e fazendo movimento circular',
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
                            title: Text('Exague',
                                style: kTitleTextstyle.copyWith(
                                    fontFamily: 'Poppins', fontSize: 16)),
                            subtitle: Text(
                              'Enxágue primeiro os punhos',
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
                            title: Text('Exague',
                                style: kTitleTextstyle.copyWith(
                                    fontFamily: 'Poppins', fontSize: 16)),
                            subtitle: Text(
                              'Enxágue, agora, as mãos, evitando contato direto da mão ensaboada com a torneira (procure usar os cotovelos na hora de abrir)',
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
                            title: Text('Secagem',
                                style: kTitleTextstyle.copyWith(
                                    fontFamily: 'Poppins', fontSize: 16)),
                            subtitle: Text(
                              'Seque-as com uma tolha de papel descartável ou de uso único quando estiver em casa',
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
                            title: Text('Fechando a torneira',
                                style: kTitleTextstyle.copyWith(
                                    fontFamily: 'Poppins', fontSize: 16)),
                            subtitle: Text(
                              'Use a toalha de papel para fechar a torneira. Pronto! Agora suas mãos estão seguras',
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
