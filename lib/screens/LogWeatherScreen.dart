import 'package:flutter/material.dart';
import 'package:myweatherlog/models/weather_data.dart';

import '../widgets/ApiTemperatureDisplay.dart';
import '../widgets/HumidityPressureDisplay.dart';
import '../widgets/SightDisplay.dart';
import '../widgets/SunUpDownDisplay.dart';
import '../widgets/WindDisplay.dart';

class LogWeatherScreen extends StatelessWidget {
  final WeatherData _weatherData;

  const LogWeatherScreen(this._weatherData, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FittedBox(
                child: Text("${_weatherData.liveweer?.elementAt(0).plaats}",
                style: Theme.of(context).textTheme.headline3,),
              ),
            ),
            Text(
              _weatherData.liveweer?.elementAt(0).samenv as String,
              style: Theme.of(context).textTheme.headline5,
            ),
            ApiTemperatureDisplay(
                _weatherData.liveweer?.elementAt(0).temp as String,
                _weatherData.liveweer?.elementAt(0).gtemp as String),
            WindDisplay(_weatherData.liveweer?.elementAt(0).windr as String,
                _weatherData.liveweer?.elementAt(0).windk as String),
            HumidityPressureDisplay(
                _weatherData.liveweer?.elementAt(0).luchtd as String,
                _weatherData.liveweer?.elementAt(0).dauwp as String),
            SightDisplay(_weatherData.liveweer?.elementAt(0).zicht as String),
            SunUpDownDisplay(_weatherData.liveweer?.elementAt(0).sup as String,
                _weatherData.liveweer?.elementAt(0).sunder as String),
          ],
        ),
      ),
    );
  }
}
