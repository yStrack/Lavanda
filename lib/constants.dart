import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:lavanda/Model/user.dart';

// const localPath = 'http://:3333'; // não usamos mais
const urlPath = 'https://lavanda-backend.herokuapp.com';

CameraDescription camera;
User user;

// Colors
const kBackgroundColor = Color(0xFFFEFEFE);
const kTitleTextColor = Color(0xFF303030);
const kBodyTextColor = Color(0xFF4B4B4B);
const kTextLightColor = Color(0xFF959595);
const kInfectedColor = Color(0xFFFF8748);
const kDeathColor = Color(0xFFFF4848);
const kRecovercolor = Color(0xFF36C12C);
const kPrimary400Color = Color(0xFF7F22FD);
const kPrimary300Color = Color(0xFF9E54FC);
const kPrimary200Color = Color(0xFFBB86FC);
const kPrimary100Color = Color(0xFFD7B7FD);
const kPrimary50Color = Color(0xFFF2E7FE);
final kShadowColor = Color(0xFFB7B7B7).withOpacity(.50);
final kActiveShadowColor = Color(0xFFBB86FC).withOpacity(.15);

// Text Style
const kHeadingTextStyle = TextStyle(
  fontSize: 28,
  fontWeight: FontWeight.w600,
);

const kSubHeadingTextStyle = TextStyle(
  fontSize: 22,
  fontWeight: FontWeight.normal,
);

const kSubTextStyle = TextStyle(fontSize: 16, color: kTextLightColor);

const kTitleTextstyle = TextStyle(
  fontSize: 14,
  color: kTitleTextColor,
  fontWeight: FontWeight.bold,
);

const kCuidadosTitleTextstyle = TextStyle(
  fontSize: 18,
  color: kTitleTextColor,
  fontWeight: FontWeight.bold,
);

final kLabelBoldStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontFamily: 'Poppins',
);

final kLabelStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.w500,
  fontFamily: 'Poppins',
);

final kLabelSmallStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.w500,
  fontSize: 14,
  fontFamily: 'Poppins',
);

final kHintTextStyle = TextStyle(
  color: Colors.white70,
  fontFamily: 'Poppins',
);

final kBoxDecorationStyle = BoxDecoration(
  color: kPrimary200Color,
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);
