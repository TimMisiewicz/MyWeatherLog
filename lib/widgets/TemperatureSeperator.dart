import 'package:flutter/material.dart';

class TemperatureSeperator extends StatelessWidget {
  final double temperature;

  const TemperatureSeperator({Key? key, required this.temperature})
      : super(key: key);

  Color get _determineColor {
    if (temperature < -5) {
      return const Color.fromRGBO(70, 9, 165, 1.0);
    } else if (temperature < 0) {
      return const Color.fromRGBO(0, 36, 125, 1.0);
    } else if (temperature < 10) {
      return const Color.fromRGBO(0, 255, 255, 1.0);
    } else if (temperature < 17.5) {
      return const Color.fromRGBO(0, 255, 124, 1.0);
    } else if (temperature < 25) {
      return const Color.fromRGBO(255, 140, 0, 1.0);
    } else {
      return const Color.fromRGBO(255, 0, 0, 1.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: const Key("tempSep"),
      margin: const EdgeInsets.all(5),
      width: MediaQuery.of(context).size.width * 0.70,
      height: 2,
      color: _determineColor,
    );
  }
}
