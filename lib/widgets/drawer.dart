import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:speedometer_light/views/about_page.dart';
import 'package:speedometer_light/views/settings_page.dart';
import 'package:speedometer_light/views/speed_page.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 0.75.sw,
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            _createHeader(context),
            _createDrawerItem(context,
                icon: Icons.speed,
                text: 'Speed',
                onTap: () => Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => SpeedsPage()),
                    (r) => false)),
            _createDrawerItem(context,
                icon: Icons.settings,
                text: 'Settings',
                onTap: () => Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => SettingsPage()),
                    (r) => false)),
            _createDrawerItem(context,
                icon: Icons.help,
                text: 'Help',
                onTap: () => Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => AboutPage()),
                    (r) => false)),
            Divider(),
          ],
        ),
      ),
    );
  }
}

Widget _createHeader(context) {
  return Container(
    height: 0.22.sw,
    child: DrawerHeader(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      child: Stack(
        children: <Widget>[
          Center(
            child: Text(
              "Speedometer Light",
              style: Theme.of(context).textTheme.bodyText2.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 16.0,
                  ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _createDrawerItem(context,
    {IconData icon, String text, GestureTapCallback onTap}) {
  return ListTile(
    title: Row(
      children: <Widget>[
        Icon(icon),
        Padding(
          padding: EdgeInsets.only(left: 18.0),
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyText1.copyWith(
                  fontWeight: FontWeight.w300,
                  fontSize: 16.0,
                ),
          ),
        )
      ],
    ),
    onTap: onTap,
  );
}
