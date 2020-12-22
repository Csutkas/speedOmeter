import 'package:flutter/material.dart';
import 'package:speedometer_light/widgets/drawer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:speedometer_light/variables.dart';

//Helpers
import 'package:speedometer_light/helpers/max_speed.dart';
import 'package:speedometer_light/helpers/unit_converter.dart';

// Theming
import 'package:provider/provider.dart';
import 'package:speedometer_light/models/theme_model.dart';

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
  String speedUnit = 'km/h';

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
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              child: Icon(
                Icons.wb_sunny_outlined,
                size: 0.05.sw,
              ),
              onTap: () =>
                  Provider.of<ThemeModel>(context, listen: false).toggleTheme(),
            ),
          ),
        ],
      ),
      drawer: AppDrawer(),
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
                      top: 18, bottom: 5.0, left: 8.0, right: 8.0),
                  child: Container(
                    width: 0.95.sw,
                    height: 0.50.sw,
                    child: Card(
                      margin: EdgeInsets.all(0),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20.0, top: 15.0, bottom: 0.0),
                              child: Text("Speed",
                                  style: Theme.of(context).textTheme.headline2),
                            ),
                            Row(
                              children: [
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20.0, top: 0.0),
                                    child: Text(
                                      SpeedConverter().unitConverter(
                                          _currentSpeed.toStringAsFixed(0),
                                          speedUnit),
                                      style:
                                          Theme.of(context).textTheme.headline1,
                                    ),
                                  ),
                                ),
                                FlatButton(
                                  padding: EdgeInsets.all(0.0),
                                  onPressed: null,
                                  child: Text('km/h',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 5.0, bottom: 5.0, left: 8.0, right: 8.0),
                  child: Container(
                    width: 0.45.sw,
                    height: 0.45.sw,
                    child: Card(
                      margin: EdgeInsets.all(0.0),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20.0, top: 15.0, bottom: 8.0),
                              child: Text("Max",
                                  style: Theme.of(context).textTheme.headline2),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 20.0),
                                    child: Text(
                                        SpeedConverter()
                                            .unitConverter(
                                                MaxSpeed().getMaxSpeed(
                                                    _currentSpeed, resetValues),
                                                speedUnit)
                                            .toStringAsFixed(0),
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline1
                                            .copyWith(fontSize: 55)),
                                  ),
                                ),
                                FlatButton(
                                  onPressed: null,
                                  child: Text(
                                    'km/h',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2
                                        .copyWith(
                                          fontSize: 12,
                                        ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            FlatButton(
                onPressed: () {
                  resetValues = true;
                  setState(() {});
                },
                child: Text("Reset")),
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
