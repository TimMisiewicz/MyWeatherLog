import 'package:flutter/material.dart';

class HumidityPressureDisplay extends StatelessWidget {
  String _airPressure;
  String _dewPoint;

  HumidityPressureDisplay(this._airPressure, this._dewPoint, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Text(
                'Air pressure',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Text(
                '${_airPressure}',
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          ),
          Column(
            children: [
              Text(
                'Dew point',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Text(
                '${_dewPoint}C\u00B0',
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          )
        ],
      ),
    );
  }
}
