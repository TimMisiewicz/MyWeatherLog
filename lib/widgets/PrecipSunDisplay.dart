import 'package:flutter/material.dart';

class PrecipSunDisplay extends StatelessWidget {
  final String _precip;
  final String _sun;

  const PrecipSunDisplay(this._precip, this._sun, {Key? key}) : super(key: key);

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
                'Sun Chance',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Text(
                '${_sun}%',
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          ),
          Column(
            children: [
              Text(
                'Precipitation Chance',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Text(
                '${_precip}%',
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          )
        ],
      ),
    );
  }
}
