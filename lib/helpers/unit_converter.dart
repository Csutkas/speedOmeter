import 'dart:math';

double roundDouble(double value, int places) {
  double mod = pow(10.0, places);
  return ((value * mod).round().toDouble() / mod);
}

class SpeedConverter {
  unitConverter(speed, unit) {
    // case km/h
    if (unit == null) {
      return speed;
    } else if (unit.toUpperCase() == "KM/H") {
      return speed;
      // case m/s
    } else if (unit.toUpperCase() == "M/S") {
      speed = roundDouble(((speed / 36) * 10), 1);
      return speed;
      // case knots
    } else if (unit.toUpperCase() == "KNOTS") {
      speed = roundDouble(((speed / 1852) * 1000), 1);
      return speed;
      // case knots
    } else if (unit.toUpperCase() == "MPH")
      speed = roundDouble(((speed / 1609) * 1000), 1);
    return speed;
  }
}
