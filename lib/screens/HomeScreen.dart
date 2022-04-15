import 'package:flutter/material.dart';

import '../widgets/SensorDisplay.dart';
import '../widgets/TimeDisplay.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        (MediaQuery.of(context).orientation == Orientation.portrait)?
        Text(
          'Live Data',
          style: Theme.of(context).textTheme.headline4,):
        Container() /* do nothing */,
        const TimeDisplay(),
        SensorDisplay()
      ], mainAxisAlignment: MainAxisAlignment.spaceEvenly,)
    ;
  }
}
