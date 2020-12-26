// App global variables

double maxSpeed = 0.0;
bool resetValues = false;

int speedUnitItem = 0;
List speedUnitList = ['km/h', 'm/s', 'knots', 'mph'];

enum SpeedUnitValue { km, ms, knots, mph }
enum ThemeValue { dark, light }

var activeSpeedUnit = SpeedUnitValue.km;
var activeTheme = ThemeValue.dark;
