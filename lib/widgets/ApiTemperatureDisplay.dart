import 'package:flutter/material.dart';

class ApiTemperatureDisplay extends StatelessWidget {
  final String _ambientTemperature;
  final String _windChill;

  const ApiTemperatureDisplay(this._ambientTemperature, this._windChill,
      {Key? key})
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
                'Temperature',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Text(
                '${_ambientTemperature}C\u00B0',
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          ),
          Column(
            children: [
              Text(
                'Wind Chill',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Text(
                '${_windChill}C\u00B0',
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          )
        ],
      ),
    );
  }
}
