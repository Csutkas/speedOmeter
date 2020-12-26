import 'package:flutter/material.dart';
import 'package:speedometer_light/widgets/drawer.dart';

// Theming
import 'package:provider/provider.dart';
import 'package:speedometer_light/models/theme_model.dart';

import 'package:speedometer_light/variables.dart';
import 'package:speedometer_light/style.dart';

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
  SpeedUnitValue _speedUnit = activeSpeedUnit;
  ThemeValue _themeValue = activeTheme;

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
              padding: EdgeInsets.only(top: 20.0, bottom: 10.0, left: 20.0),
              child: Text('Change your speed theme:'),
            ),
            ListTile(
              title: Text(
                'Dark',
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    .copyWith(fontSize: 15),
              ),
              leading: Radio(
                value: ThemeValue.dark,
                groupValue: _themeValue,
                onChanged: (ThemeValue value) {
                  setState(() {
                    _themeValue = value;
                    Provider.of<ThemeModel>(context, listen: false)
                        .toggleTheme();
                  });
                  activeTheme = _themeValue;
                },
              ),
            ),
            ListTile(
              title: Text(
                'Light',
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    .copyWith(fontSize: 15),
              ),
              leading: Radio(
                value: ThemeValue.light,
                groupValue: _themeValue,
                onChanged: (ThemeValue value) {
                  setState(() {
                    _themeValue = value;
                    Provider.of<ThemeModel>(context, listen: false)
                        .toggleTheme();
                  });
                  activeTheme = _themeValue;
                },
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 20.0, bottom: 10.0, left: 20.0),
              child: Text('Choose your speed unit:'),
            ),
            ListTile(
              title: Text(
                'km/h',
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    .copyWith(fontSize: 15),
              ),
              leading: Radio(
                value: SpeedUnitValue.km,
                groupValue: _speedUnit,
                onChanged: (SpeedUnitValue value) {
                  setState(() {
                    _speedUnit = value;
                    setState(() {
                      activeSpeedUnit = _speedUnit;
                    });
                  });
                },
              ),
            ),
            ListTile(
              title: Text(
                'm/s',
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    .copyWith(fontSize: 15),
              ),
              leading: Radio(
                value: SpeedUnitValue.ms,
                groupValue: _speedUnit,
                onChanged: (SpeedUnitValue value) {
                  setState(() {
                    _speedUnit = value;
                    setState(() {
                      activeSpeedUnit = _speedUnit;
                    });
                  });
                },
              ),
            ),
            ListTile(
              title: Text(
                'knots',
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    .copyWith(fontSize: 15),
              ),
              leading: Radio(
                value: SpeedUnitValue.knots,
                groupValue: _speedUnit,
                onChanged: (SpeedUnitValue value) {
                  setState(() {
                    _speedUnit = value;
                    setState(() {
                      activeSpeedUnit = _speedUnit;
                    });
                  });
                },
              ),
            ),
            ListTile(
              title: Text(
                'mph',
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    .copyWith(fontSize: 15),
              ),
              leading: Radio(
                value: SpeedUnitValue.mph,
                groupValue: _speedUnit,
                onChanged: (SpeedUnitValue value) {
                  setState(() {
                    _speedUnit = value;
                    setState(() {
                      activeSpeedUnit = _speedUnit;
                    });
                  });
                },
              ),
            ),
          ],
        ));
  }
}
