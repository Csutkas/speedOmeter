import 'dart:math';

double roundDouble(double value, int places) {
  double mod = pow(10.0, places);
  return ((value * mod).round().toDouble() / mod);
}

class SpeedConverter {
  unitConverter(speed, unit) {
    if (unit == null) {
      return speed;
    } else if (speed == 0.0) {
      return 0;
      // case km/h
    } else if (unit == "km/h") {
      return speed;
      // case m/s
    } else if (unit == "m/s") {
      speed = roundDouble(((speed / 36) * 10), 1);
      return speed;
      // case knots
    } else if (unit == "knots") {
      speed = roundDouble(((speed / 1852) * 1000), 1);
      return speed;
      // case knots
    } else if (unit == "mph") speed = roundDouble(((speed / 1609) * 1000), 1);
    return speed;
  }
}
