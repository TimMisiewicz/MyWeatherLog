import 'package:flutter/material.dart';

import 'package:environment_sensors/environment_sensors.dart';
import 'package:myweatherlog/widgets/TemperatureSeperator.dart';

class SensorDisplay extends StatefulWidget {
  final environmentSensors = EnvironmentSensors();

  SensorDisplay({Key? key}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<SensorDisplay> {
  bool _tempAvailable = false;
  bool _humidityAvailable = false;
  bool _pressureAvailable = false;
  final environmentSensors = EnvironmentSensors();
  double? temperature;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    bool tempAvailable;
    bool humidityAvailable;
    bool pressureAvailable;

    tempAvailable = await environmentSensors
        .getSensorAvailable(SensorType.AmbientTemperature);
    humidityAvailable =
        await environmentSensors.getSensorAvailable(SensorType.Humidity);
    pressureAvailable =
        await environmentSensors.getSensorAvailable(SensorType.Pressure);

    setState(() {
      _tempAvailable = tempAvailable;
      _humidityAvailable = humidityAvailable;
      _pressureAvailable = pressureAvailable;
    });
  }

  double get _responsiveHeight {
    return (_isPortrait) ? 0.15 : 0.30;
  }

  double get _responsiveWidth {
    return (_isPortrait) ? 0.45 : 0.30;
  }

  bool get _isPortrait {
    return MediaQuery.of(context).orientation == Orientation.portrait;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            if (_isPortrait)
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.90,
                height: (MediaQuery.of(context).size.height -
                        (MediaQuery.of(context).padding.top + kToolbarHeight)) *
                    0.20,
                child: Column(children: [
                  Text('Ambient Temperature',
                      style: Theme.of(context).textTheme.bodyMedium),
                  FittedBox(
                    child: (_tempAvailable)
                        ? StreamBuilder<double>(
                            stream: environmentSensors.temperature,
                            builder: (context, snapshot) {
                              if (!snapshot.hasData) {
                                return const CircularProgressIndicator();
                              }
                              return Column(
                                children: [
                                  TemperatureSeperator(
                                      temperature: snapshot.data as double),
                                  Text(
                                    '${snapshot.data?.toStringAsFixed(2)}C\u00B0',
                                    style:
                                        Theme.of(context).textTheme.headline2,
                                  ),
                                  TemperatureSeperator(
                                      temperature: snapshot.data as double),
                                ],
                              );
                            })
                        : const Text('No ambient temperature sensor found'),
                  ),
                ]),
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                if (!_isPortrait)
                  SizedBox(
                    width: MediaQuery.of(context).size.width * _responsiveWidth,
                    height: (MediaQuery.of(context).size.height -
                            (MediaQuery.of(context).padding.top +
                                kToolbarHeight)) *
                        _responsiveHeight,
                    child: Column(children: [
                      Text('Temperature',
                          style: Theme.of(context).textTheme.bodyMedium),
                      FittedBox(
                        child: (_tempAvailable)
                            ? StreamBuilder<double>(
                                stream: environmentSensors.temperature,
                                builder: (context, snapshot) {
                                  if (!snapshot.hasData) {
                                    return const CircularProgressIndicator();
                                  }
                                  return Text(
                                    '${snapshot.data?.toStringAsFixed(2)}C\u00B0',
                                    style:
                                        Theme.of(context).textTheme.headline3,
                                  );
                                })
                            : const Text('No ambient temperature sensor found'),
                      ),
                    ]),
                  ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * _responsiveWidth,
                  height: (MediaQuery.of(context).size.height -
                          (MediaQuery.of(context).padding.top +
                              kToolbarHeight)) *
                      _responsiveHeight,
                  child: Column(children: [
                    Text('Air Pressure',
                        style: Theme.of(context).textTheme.bodyMedium),
                    FittedBox(
                      child: (_pressureAvailable)
                          ? StreamBuilder<double>(
                              stream: environmentSensors.pressure,
                              builder: (context, snapshot) {
                                if (!snapshot.hasData) {
                                  return const CircularProgressIndicator();
                                }
                                return Text(
                                  '${snapshot.data?.toStringAsFixed(2)}',
                                  style: Theme.of(context).textTheme.headline3,
                                );
                              })
                          : const Text('No air pressure sensor found'),
                    ),
                  ]),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * _responsiveWidth,
                  height: (MediaQuery.of(context).size.height -
                          (MediaQuery.of(context).padding.top +
                              kToolbarHeight)) *
                      _responsiveHeight,
                  child: Column(children: [
                    Text('Relative Humidity',
                        style: Theme.of(context).textTheme.bodyMedium),
                    FittedBox(
                      child: (_humidityAvailable)
                          ? StreamBuilder<double>(
                              stream: environmentSensors.humidity,
                              builder: (context, snapshot) {
                                if (!snapshot.hasData) {
                                  return const CircularProgressIndicator();
                                }
                                return Text(
                                  '${snapshot.data?.toStringAsFixed(2)}%',
                                  style: Theme.of(context).textTheme.headline3,
                                );
                              })
                          : const Text('No air humidity sensor found'),
                    ),
                  ]),
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
