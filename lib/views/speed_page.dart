import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:speedometer_light/variables.dart';
import 'package:speedometer_light/views/settings_page.dart';
import 'package:speedometer_light/views/about_page.dart';
import 'package:speedometer_light/widgets/drawer.dart';

//Helpers
import 'package:speedometer_light/helpers/max_speed.dart';
import 'package:speedometer_light/helpers/unit_converter.dart';

// Location
import 'package:geolocator/geolocator.dart';
import 'dart:async';

class SpeedsPage extends StatefulWidget {
  @override
  _SpeedsPageState createState() => _SpeedsPageState();
}

class _SpeedsPageState extends State<SpeedsPage> {
  List _positionItems = [];
  var _currentSpeed = 0.0;
  StreamSubscription<Position> _positionStreamSubscription;

  final myController = TextEditingController();

  @override
  void initState() {
    _toggleListening();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          "Measure speed",
          style: Theme.of(context).textTheme.headline6,
        ),
        leading: Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: GestureDetector(
              child: Icon(
                Icons.info_outline,
                size: 0.05.sw,
              ),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AboutPage(),
                ),
              ).then(
                (context) => setState(() => {}),
              ),
            )),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                child: Icon(
                  Icons.settings,
                  size: 0.05.sw,
                ),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingsPage(),
                  ),
                ).then(
                  (context) => setState(() => {}),
                ),
              ))
        ],
      ),
      //drawer: AppDrawer(),

      body: Container(
        width: 1.0.sw,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Speed
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 15, bottom: 5.0, left: 12.0, right: 12.0),
                  child: Container(
                    width: 0.95.sw,
                    height: 0.80.sw,
                    child: Card(
                      margin: EdgeInsets.all(0),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Speed",
                                style: Theme.of(context).textTheme.headline2),
                            Padding(
                              padding: const EdgeInsets.only(top: 0.0),
                              child: Text(
                                SpeedConverter()
                                    .unitConverter(_currentSpeed,
                                        speedUnitHandler(activeSpeedUnit))
                                    .toString(),
                                style: Theme.of(context).textTheme.headline1,
                              ),
                            ),
                            Text(speedUnitHandler(activeSpeedUnit),
                                style: Theme.of(context).textTheme.bodyText2),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 10.0, bottom: 5.0, left: 12.0, right: 12.0),
                  child: Container(
                    width: 0.95.sw,
                    height: 0.4.sw,
                    child: Card(
                      margin: EdgeInsets.all(0.0),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Max",
                                style: Theme.of(context).textTheme.headline2),
                            Text(
                                SpeedConverter()
                                    .unitConverter(
                                        MaxSpeed().getMaxSpeed(
                                            _currentSpeed, resetValues),
                                        'km/h')
                                    .toStringAsFixed(0),
                                style: Theme.of(context)
                                    .textTheme
                                    .headline1
                                    .copyWith(fontSize: 35)),
                            Text(
                              speedUnitHandler(activeSpeedUnit),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  .copyWith(
                                    fontSize: 15,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            Padding(
              padding:
                  const EdgeInsets.only(bottom: 15.0, left: 12.0, right: 12.0),
              child: Container(
                width: 0.95.sw,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xffFFB2FF),
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(3.0))),
                child: FlatButton(
                    onPressed: () {
                      resetValues = true;
                      setState(() {});
                    },
                    child: Text("Reset")),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _toggleListening() {
    if (_positionStreamSubscription == null) {
      final positionStream = Geolocator.getPositionStream();
      _positionStreamSubscription = positionStream.handleError((error) {
        _positionStreamSubscription.cancel();
        _positionStreamSubscription = null;
      }).listen(
        (position) => setState(() {
          _currentSpeed = position.speed * 3.6;
          _positionItems.add(position.speed);
          if ((_currentSpeed == null) || (_currentSpeed < 0.0)) {
            _currentSpeed = 0;
          }
        }),
      );
      _positionStreamSubscription.pause();
    }

    setState(() {
      if (_positionStreamSubscription.isPaused) {
        _positionStreamSubscription.resume();
      } else {
        _positionStreamSubscription.pause();
      }
    });
  }

  @override
  void dispose() {
    if (_positionStreamSubscription != null) {
      _positionStreamSubscription.cancel();
      _positionStreamSubscription = null;
    }

    super.dispose();
  }
}

enum _PositionItemType {
  permission,
  position,
}

class _PositionItem {
  _PositionItem(this.type, this.displayValue);

  final _PositionItemType type;
  final String displayValue;
}

distanceBetween() async {
  final distance = await Geolocator.distanceBetween(0, 0, 0, 0);
  return (distance);
}

speedUnitHandler(settingsSpeed) {
  String activeUnit;
  if (settingsSpeed == SpeedUnitValue.km) {
    activeUnit = 'km/h';
  } else if (settingsSpeed == SpeedUnitValue.ms) {
    activeUnit = 'm/s';
  } else if (settingsSpeed == SpeedUnitValue.knots) {
    activeUnit = 'knots';
  } else if (settingsSpeed == SpeedUnitValue.mph) {
    activeUnit = 'mph';
  } else {
    activeUnit = 'km/h';
  }
  return activeUnit;
}
