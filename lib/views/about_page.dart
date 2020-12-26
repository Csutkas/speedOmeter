import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Text(
                "This is a free of use speedometer application. Speed measured with the mobile device's gps signal. Please let the app use the location."),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0, right: 30.0),
            child: Text(
                "In case of any bug or question feel free to write to info@theapplabor.hu."),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0, left: 30.0, right: 30.0),
            child: Text("Developed by www.theapplabor.hu"),
          ),
        ],
      ),
    );
  }
}
