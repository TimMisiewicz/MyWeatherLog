import 'package:flutter/material.dart';

class SightDisplay extends StatelessWidget {
  final String _sight;

  const SightDisplay(this._sight, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            'Visibility',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Text(
            '${_sight}km',
            style: Theme.of(context).textTheme.headline4,
          )
        ],
      ),
    );
  }
}
