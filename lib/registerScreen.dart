import 'package:flutter/material.dart';
import 'package:lavanda/Services/auth.service.dart';
import 'package:lavanda/constants.dart';
import 'package:lavanda/loginScreen.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  final TextEditingController _controllerConfirmPassword =
      TextEditingController();

  bool registerLoading = false;

  Widget backBT() {
    return Container(
      width: double.infinity,
      height: 25,
      alignment: AlignmentDirectional(-1.0, 0.0),
      child: Ink(
        decoration: const ShapeDecoration(
          color: Colors.lightBlue,
          shape: CircleBorder(),
        ),
        child: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.white,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen()),
            );
          },
        ),
      ),
    );
  }

  Widget emailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Email',
          style: kLabelBoldStyle,
        ),
        SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60,
          child: TextField(
            controller: _controllerEmail,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14.0),
                prefixIcon: Icon(Icons.email, color: Colors.white),
                hintText: 'Coloque seu email',
                hintStyle: kHintTextStyle),
          ),
        )
      ],
    );
  }

  Widget nameTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Nome',
          style: kLabelBoldStyle,
        ),
        SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60,
          child: TextField(
            controller: _controllerName,
            keyboardType: TextInputType.text,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14.0),
                prefixIcon: Icon(Icons.person, color: Colors.white),
                hintText: 'Coloque seu nome',
                hintStyle: kHintTextStyle),
          ),
        )
      ],
    );
  }

  Widget passwordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Senha',
          style: kLabelBoldStyle,
        ),
        SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60,
          child: TextField(
            controller: _controllerPassword,
            obscureText: true,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14.0),
                prefixIcon: Icon(Icons.lock, color: Colors.white),
                hintText: 'Coloque sua senha',
                hintStyle: kHintTextStyle),
          ),
        )
      ],
    );
  }

  Widget confirmPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Confirmar Senha',
          style: kLabelBoldStyle,
        ),
        SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60,
          child: TextField(
            controller: _controllerConfirmPassword,
            obscureText: true,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14.0),
                prefixIcon: Icon(Icons.lock, color: Colors.white),
                hintText: 'Coloque sua senha',
                hintStyle: kHintTextStyle),
          ),
        )
      ],
    );
  }

  Widget registerBT() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () {
          print('Register clicado');
          if (!registerLoading &&
              _controllerPassword.text == _controllerConfirmPassword.text) {
            registerLoading = true;
            try {
              register(_controllerEmail.text, _controllerPassword.text,
                  _controllerName.text);
              registerLoading = false;
              MaterialPageRoute(builder: (context) => LoginScreen());
            } catch (error) {
              print('ERROR: ' + error);
              registerLoading = false;
            }
          }
          print('Register clicado');
        },
        padding: EdgeInsets.all(15.0),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        color: Colors.white,
        child: Text('Registrar',
            style: TextStyle(
                color: Color(0xFF527DAA),
                letterSpacing: 1.5,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins')),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [kPrimary200Color, kPrimary400Color]),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.fromLTRB(35, 50, 35, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  backBT(),
                  Text('Lavanda',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Poppins',
                          fontSize: 30,
                          fontWeight: FontWeight.bold)),
                  SizedBox(height: 20),
                  emailTF(),
                  SizedBox(height: 20),
                  nameTF(),
                  SizedBox(height: 20),
                  passwordTF(),
                  SizedBox(height: 20),
                  confirmPasswordTF(),
                  SizedBox(height: 20),
                  registerBT(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
