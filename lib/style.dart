import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

TextStyle speedValueTextStyle = TextStyle(fontSize: 0.48.sw);

TextStyle appBarTextTextStyle =
    TextStyle(fontSize: ScreenUtil().setSp(37), color: Colors.white);

ThemeData darkTheme = ThemeData.dark().copyWith(
  primaryColor: Color(0xff1f655d),
  accentColor: Color(0xff40bf7a),
  scaffoldBackgroundColor: Color(0xff121212),
  textTheme: TextTheme(
      headline1: TextStyle(
        color: Color(0xfff8f8f8),
        fontWeight: FontWeight.w300,
        fontSize: 120.0,
      ),
      headline2: TextStyle(
        color: Color(0xffBC86FC),
        fontSize: 20.0,
        fontWeight: FontWeight.w100,
      ),
      headline3: TextStyle(color: Color(0xfff8f8f8)),
      headline4: TextStyle(color: Color(0xfff8f8f8)),
      headline5: TextStyle(color: Color(0xfff8f8f8)),
      headline6: TextStyle(color: Color(0xfff8f8f8), fontSize: 16.0),
      bodyText1: TextStyle(color: Color(0xfff8f8f8)),
      bodyText2: TextStyle(color: Color(0xffB8B8B8), fontSize: 16.0),
      subtitle2: TextStyle(color: Color(0xfff8f8f8)),
      subtitle1: TextStyle(color: Color(0xfff8f8f8))),
  appBarTheme: AppBarTheme(color: Color(0xff1E1E1E)),
  cardColor: Color(0xff1E1E1E),
  canvasColor: Color(0xff1E1E1E),
);

ThemeData lightTheme = ThemeData.light().copyWith(
  primaryColor: Color(0xfff5f5f5),
  accentColor: Color(0xff40bf7a),
  scaffoldBackgroundColor: Color(0xffE8E8E8),
  textTheme: TextTheme(
      headline1: TextStyle(
        color: Color(0xff484848),
        fontWeight: FontWeight.w300,
        fontSize: 120.0,
      ),
      headline2: TextStyle(
        color: Color(0xff1f655d),
        fontSize: 20.0,
        fontWeight: FontWeight.w200,
      ),
      headline3: TextStyle(color: Color(0xff585858)),
      headline4: TextStyle(color: Color(0xff585858)),
      headline5: TextStyle(color: Color(0xff585858)),
      headline6: TextStyle(color: Colors.white, fontSize: 16.0),
      bodyText1: TextStyle(color: Color(0xff585858)),
      bodyText2: TextStyle(color: Color(0xff585858), fontSize: 16.0),
      subtitle2: TextStyle(color: Colors.grey),
      subtitle1: TextStyle(color: Colors.white)),
  appBarTheme: AppBarTheme(
    color: Color(0xff1f655d),
  ),
  cardColor: Color(0xffFBFBFD),
  canvasColor: Color(0xffFBFBFD),
);
