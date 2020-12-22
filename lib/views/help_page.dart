import 'package:flutter/material.dart';
import 'package:speedometer_light/widgets/drawer.dart';

class HelpPage extends StatelessWidget {
  static const String routeName = '/help';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("Help"),
        ),
        drawer: AppDrawer(),
        body: Center(child: Text("Help")));
  }
}
