import 'package:flutter/material.dart';
import 'package:speedometer_light/widgets/drawer.dart';

// Theming
import 'package:provider/provider.dart';
import 'package:speedometer_light/models/theme_model.dart';

import 'package:speedometer_light/variables.dart';

/*

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
*/

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  SpeedUnitValue _character = activeSpeedUnit;
  ThemeValue _themeValue = ThemeValue.dark;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("Settings"),
        ),
        //drawer: AppDrawer(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(top: 20.0, bottom: 10.0, left: 20.0),
              child: Text('Change your speed theme:'),
            ),
            ListTile(
              title: const Text('Dark'),
              leading: Radio(
                value: ThemeValue.dark,
                groupValue: _themeValue,
                onChanged: (ThemeValue value) {
                  setState(() {
                    _themeValue = value;
                    Provider.of<ThemeModel>(context, listen: false)
                        .toggleTheme();
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('Light'),
              leading: Radio(
                value: ThemeValue.light,
                groupValue: _themeValue,
                onChanged: (ThemeValue value) {
                  setState(() {
                    _themeValue = value;
                    Provider.of<ThemeModel>(context, listen: false)
                        .toggleTheme();
                  });
                },
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 20.0, bottom: 10.0, left: 20.0),
              child: Text('Choose your speed unit:'),
            ),
            ListTile(
              title: const Text('km/h'),
              leading: Radio(
                value: SpeedUnitValue.km,
                groupValue: _character,
                onChanged: (SpeedUnitValue value) {
                  setState(() {
                    _character = value;
                    setState(() {
                      activeSpeedUnit = _character;
                    });
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('m/s'),
              leading: Radio(
                value: SpeedUnitValue.ms,
                groupValue: _character,
                onChanged: (SpeedUnitValue value) {
                  setState(() {
                    _character = value;
                    setState(() {
                      activeSpeedUnit = _character;
                    });
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('knots'),
              leading: Radio(
                value: SpeedUnitValue.knots,
                groupValue: _character,
                onChanged: (SpeedUnitValue value) {
                  setState(() {
                    _character = value;
                    setState(() {
                      activeSpeedUnit = _character;
                    });
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('mph'),
              leading: Radio(
                value: SpeedUnitValue.mph,
                groupValue: _character,
                onChanged: (SpeedUnitValue value) {
                  setState(() {
                    _character = value;
                    setState(() {
                      activeSpeedUnit = _character;
                    });
                  });
                },
              ),
            ),
          ],
        ));
  }
}
