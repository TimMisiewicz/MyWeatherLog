import 'package:flutter/material.dart';
import 'package:myweatherlog/widgets/ApiData.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  bool get _isPortrait{
    return MediaQuery.of(context).orientation == Orientation.portrait;
  }

  double get _deviceHeight {
    return MediaQuery.of(context).size.height;
  }

  double get _deviceWidth {
    return MediaQuery.of(context).size.width;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [Container(
        height: _deviceHeight * 0.1,
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: FittedBox(
            child: Text("Weather",
            style: Theme.of(context).textTheme.headline4,),
          ),
        ),
      ), ApiData()],
    );
  }
}
