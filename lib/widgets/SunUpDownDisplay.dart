import 'package:flutter/material.dart';

class SunUpDownDisplay extends StatelessWidget {
  String _sunUp;
  String _sunDown;

  SunUpDownDisplay(this._sunUp, this._sunDown, {Key? key}) : super(key: key);

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
                'Sunrise',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Text(
                '${_sunUp}',
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          ),
          Column(
            children: [
              Text(
                'Sunset',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Text(
                '${_sunDown}',
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          )
        ],
      ),
    );
  }
}
