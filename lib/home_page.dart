import 'package:flutter/material.dart';
import 'package:speedometer_light/style.dart';
import 'package:speedometer_light/widgets/drawer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text('Speedometer Light', style: appBarTextTextStyle),
      ),
      drawer: AppDrawer(),
    );
  }
}
