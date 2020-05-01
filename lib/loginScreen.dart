import 'package:flutter/material.dart';
import 'package:lavanda/constants.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool rememberMe = false;

  Widget emailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Email",
          style: kLabelStyle,
        ),
        SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60,
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14.0),
                prefixIcon: Icon(Icons.email, color: Colors.white),
                hintText: "Coloque seu email",
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
          "Senha",
          style: kLabelStyle,
        ),
        SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60,
          child: TextField(
            obscureText: true,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14.0),
                prefixIcon: Icon(Icons.lock, color: Colors.white),
                hintText: "Coloque sua senha",
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
                checkColor: Colors.green,
                activeColor: Colors.white,
                onChanged: (value) {
                  setState(() {
                    rememberMe = value;
                  });
                }),
          ),
          Text("Lembrar de mim", style: kLabelStyle)
        ],
      ),
    );
  }

  Widget forgotPassword() {
    return Container(
      alignment: Alignment.centerRight,
      child: FlatButton(
          onPressed: () => print("Esqueceu a sennha clicado"),
          child: Text(
            "Esqueceu sua senha?",
            style: kLabelStyle,
          )),
    );
  }

  Widget loginBT() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () => print("Login clicado"),
        padding: EdgeInsets.all(15.0),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        color: Colors.white,
        child: Text("Entrar",
            style: TextStyle(
                color: Color(0xFF527DAA),
                letterSpacing: 1.5,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins')),
      ),
    );
  }

  Widget signInBT() {
    return GestureDetector(
      onTap: () => print("Criar uma conta clicado"),
      child: RichText(
          text: TextSpan(children: [
        TextSpan(
            text: "Não possui uma conta?",
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'Poppins',
                fontSize: 18.0,
                fontWeight: FontWeight.w400)),
        TextSpan(
            text: " Criar uma",
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'Poppins',
                fontSize: 18.0,
                fontWeight: FontWeight.bold)),
      ])),
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
                  colors: [Color(0xFF3383CD), Color(0xFF11249F)]),
            ),
          ),
          Container(
            height: double.infinity,
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 120),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Lavanda",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Poppins",
                          fontSize: 30,
                          fontWeight: FontWeight.bold)),
                  SizedBox(height: 30),
                  emailTF(),
                  SizedBox(height: 30),
                  passwordTF(),
                  forgotPassword(),
                  rememberMeBT(),
                  loginBT(),
                  signInBT(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
