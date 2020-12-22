import 'package:flutter/material.dart';
import 'package:speedometer_light/widgets/drawer.dart';

// Theming
import 'package:provider/provider.dart';
import 'package:speedometer_light/models/theme_model.dart';

class SettingsPage extends StatelessWidget {
  static const String routeName = '/settings';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("Settings"),
        ),
        drawer: AppDrawer(),
        body: Column(
          children: [
            Row(
              children: [
                RaisedButton(
                  child: Text("Change Theme"),
                  onPressed: () {
                    Provider.of<ThemeModel>(context, listen: false)
                        .toggleTheme();
                  },
                ),
              ],
            )
          ],
        ));
  }
}
