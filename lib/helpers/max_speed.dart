import 'package:speedometer_light/variables.dart';

class MaxSpeed {
  getMaxSpeed(currentSpeed, reset) {
    if (currentSpeed > maxSpeed) {
      maxSpeed = currentSpeed;
    }

    if (reset == true) {
      maxSpeed = 0.0;
      resetValues = false;
    }
    return maxSpeed;
  }
}
