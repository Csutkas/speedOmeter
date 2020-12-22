import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:speedometer_light/views/speed_page.dart';

import 'package:provider/provider.dart';
import 'package:speedometer_light/models/theme_model.dart';

void main() {
  runApp(ChangeNotifierProvider<ThemeModel>(
      create: (BuildContext context) => ThemeModel(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(750, 1334),
      child: MaterialApp(
        title: 'Speedometer Light',
        theme: Provider.of<ThemeModel>(context).currentTheme,
        home: SpeedsPage(),
      ),
    );
  }
}
