import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:geolocator/geolocator.dart';
import 'package:myweatherlog/Handlers/file_handler.dart';

import 'package:myweatherlog/widgets/ApiTemperatureDisplay.dart';
import 'package:myweatherlog/widgets/HumidityPressureDisplay.dart';
import 'package:myweatherlog/widgets/PrecipSunDisplay.dart';
import 'package:myweatherlog/widgets/SightDisplay.dart';
import 'package:myweatherlog/widgets/SunUpDownDisplay.dart';
import 'package:myweatherlog/widgets/WindDisplay.dart';

import '../models/weather_data.dart';

class ApiData extends StatefulWidget {
  const ApiData({Key? key}) : super(key: key);

  @override
  _ApiDataState createState() => _ApiDataState();
}

class _ApiDataState extends State<ApiData> {
  final String _apiKey = "Get your own API Key via weerlive.nl/delen.php !";
  final DateTime _dateTime = DateTime.now();
  String _location = 'locatie=Amsterdam'; /* Default value is Amsterdam */

  late Future<WeatherData> weatherData;
  late Future<Position> currentPosition;

  FileHandler fileHandler = FileHandler.instance;

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition();
  }

  Future<WeatherData> fetchWeatherData() async {
    final response = await http.get(Uri.parse(
        'https://weerlive.nl/api/json-data-10min.php?key=' +
            _apiKey +
            _location));
    if (response.statusCode == 200) {
      return WeatherData.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load weather data");
    }
  }

  bool get _isPortrait {
    return MediaQuery.of(context).orientation == Orientation.portrait;
  }

  double get _deviceHeight {
    return MediaQuery.of(context).size.height;
  }

  double get _deviceWidth {
    return MediaQuery.of(context).size.width;
  }

  @override
  void initState() {
    super.initState();
    currentPosition = _determinePosition();
    weatherData = fetchWeatherData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: (_isPortrait) ? _deviceHeight * 0.70 : _deviceHeight * 0.55,
      child: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder<Position>(
              future: currentPosition,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Text("No location data available");
                } else {
                  return Column(
                    children: [
                      Text(
                          'Current position - lat:${snapshot.data?.latitude as double} '
                          'lon:${snapshot.data?.longitude as double}'),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _location = "locatie=" +
                                (snapshot.data?.latitude as double).toString() +
                                "," +
                                (snapshot.data?.longitude as double).toString();
                            weatherData = fetchWeatherData();
                          });
                        },
                        child: Text(
                          "Get weather data for my location",
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      )
                    ],
                  );
                }
              },
            ),
            FutureBuilder<WeatherData>(
              future: weatherData,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      Text(
                        "Today",
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      Text(snapshot.data?.liveweer?.elementAt(0).plaats
                          as String),
                      Text(
                        snapshot.data?.liveweer?.elementAt(0).samenv as String,
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      ApiTemperatureDisplay(
                          snapshot.data?.liveweer?.elementAt(0).temp as String,
                          snapshot.data?.liveweer?.elementAt(0).gtemp
                              as String),
                      WindDisplay(
                          snapshot.data?.liveweer?.elementAt(0).windr as String,
                          snapshot.data?.liveweer?.elementAt(0).windk
                              as String),
                      HumidityPressureDisplay(
                          snapshot.data?.liveweer?.elementAt(0).luchtd
                              as String,
                          snapshot.data?.liveweer?.elementAt(0).dauwp
                              as String),
                      SightDisplay(snapshot.data?.liveweer?.elementAt(0).zicht
                          as String),
                      SunUpDownDisplay(
                          snapshot.data?.liveweer?.elementAt(0).sup as String,
                          snapshot.data?.liveweer?.elementAt(0).sunder
                              as String),
                      ElevatedButton(
                          onPressed: () {
                            fileHandler.writeWeatherData(snapshot.data as WeatherData);
                          },
                          child: Text(
                            "Save to Log!",
                            style: Theme.of(context).textTheme.bodyText1,
                          )),
                      Divider(
                        height: 5,
                        indent: 10,
                        endIndent: 10,
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                      Text(
                        DateFormat('EEEE')
                            .format(_dateTime.add(const Duration(days: 1))),
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      Text(
                        snapshot.data?.liveweer?.elementAt(0).d0weer as String,
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      ApiTemperatureDisplay(
                          snapshot.data?.liveweer?.elementAt(0).d0tmax
                              as String,
                          snapshot.data?.liveweer?.elementAt(0).d0tmin
                              as String),
                      WindDisplay(
                          snapshot.data?.liveweer?.elementAt(0).d0windr
                              as String,
                          snapshot.data?.liveweer?.elementAt(0).d0windk
                              as String),
                      PrecipSunDisplay(
                          snapshot.data?.liveweer?.elementAt(0).d0neerslag
                              as String,
                          snapshot.data?.liveweer?.elementAt(0).d0zon
                              as String),
                      Divider(
                        height: 5,
                        indent: 10,
                        endIndent: 10,
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                      Text(
                        DateFormat('EEEE')
                            .format(_dateTime.add(const Duration(days: 2))),
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      Text(
                        snapshot.data?.liveweer?.elementAt(0).d1weer as String,
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      ApiTemperatureDisplay(
                          snapshot.data?.liveweer?.elementAt(0).d1tmax
                              as String,
                          snapshot.data?.liveweer?.elementAt(0).d1tmin
                              as String),
                      WindDisplay(
                          snapshot.data?.liveweer?.elementAt(0).d1windr
                              as String,
                          snapshot.data?.liveweer?.elementAt(0).d1windk
                              as String),
                      PrecipSunDisplay(
                          snapshot.data?.liveweer?.elementAt(0).d1neerslag
                              as String,
                          snapshot.data?.liveweer?.elementAt(0).d1zon
                              as String),
                      Divider(
                        height: 5,
                        indent: 10,
                        endIndent: 10,
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                return const CircularProgressIndicator();
              },
            ),
            const Text('Weather data via weerlive.nl')
          ],
        ),
      ),
    );
  }
}
