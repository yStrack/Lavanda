import 'package:flutter/material.dart';
import 'package:lavanda/Services/auth.service.dart';
import 'package:lavanda/constants.dart';
import 'package:lavanda/main.dart';
import 'package:lavanda/registerScreen.dart';

import 'Model/user.dart';
import 'Widgets/progress.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  bool loginLoading = false;

  bool rememberMe = false;

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

  Widget rememberMeBT() {
    return Container(
      height: 20.0,
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.white),
            child: Checkbox(
                value: rememberMe,
                checkColor: kPrimary300Color,
                activeColor: Colors.white,
                onChanged: (value) {
                  setState(() {
                    rememberMe = value;
                  });
                }),
          ),
          Text('Lembrar', style: kLabelSmallStyle)
        ],
      ),
    );
  }

  Widget forgotPassword() {
    return Container(
      alignment: Alignment.centerRight,
      child: FlatButton(
          onPressed: () => print('Esqueceu a sennha clicado'),
          child: Text(
            'Esqueceu a senha?',
            style: kLabelSmallStyle,
          )),
    );
  }

  Widget loginBT() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () async {
          print('Login clicado');
          if (!loginLoading) {
            setState(() {
              loginLoading = true;
            });
            try {
              // print(_controllerEmail.text);
              // print(_controllerPassword.text);
              User user =
                  await login(_controllerEmail.text, _controllerPassword.text);
              setState(() {
                loginLoading = true;
              });
              print(user.name);
              print(user.email);
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => HomePage(user.name)));
            } catch (error) {
              print(error);
              setState(() {
                loginLoading = true;
              });
            }
          }
        },
        padding: EdgeInsets.all(15.0),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        color: Colors.white,
        child: Text('Entrar',
            style: TextStyle(
                color: kPrimary300Color,
                letterSpacing: 1.5,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins')),
      ),
    );
  }

  Widget signInBT() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          'Não possui uma conta?',
          style: TextStyle(
              height: 0,
              color: Colors.white,
              fontFamily: 'Poppins',
              fontSize: 18.0,
              fontWeight: FontWeight.w400),
        ),
        FlatButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => RegisterScreen()),
            );
          },
          child: Text('Crie uma',
              style: TextStyle(
                  height: 0,
                  color: Colors.white,
                  fontFamily: 'Poppins',
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold)),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProgressHUD(
        inAsyncCall: loginLoading,
        opacity: 0.5,
        valueColor: new AlwaysStoppedAnimation<Color>(kPrimary400Color),
        child: Stack(
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
                    Text('Lavanda',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Poppins',
                            fontSize: 30,
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 30),
                    emailTF(),
                    SizedBox(height: 30),
                    passwordTF(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        rememberMeBT(),
                        forgotPassword(),
                      ],
                    ),
                    loginBT(),
                    SizedBox(height: 10),
                    signInBT(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
