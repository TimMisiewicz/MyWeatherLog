import 'package:flutter/material.dart';
import 'package:myweatherlog/models/weather_data.dart';
import 'package:myweatherlog/screens/LogWeatherScreen.dart';

import '../Handlers/file_handler.dart';

class LogData extends StatefulWidget {
  const LogData({Key? key}) : super(key: key);

  @override
  _LogDataState createState() => _LogDataState();
}

class _LogDataState extends State<LogData> {
  late Future<List<WeatherData>> _weatherData;
  FileHandler fileHandler = FileHandler.instance;

  @override
  void initState() {
    _weatherData = fileHandler.readWeatherData();
    super.initState();
  }

  void deleteRecord(WeatherData weatherData) {
    fileHandler.deleteWeatherData(weatherData);
    setState(() {
      _weatherData = fileHandler.readWeatherData();
    });
  }

  @override
  Widget build(BuildContext context) {
    _weatherData = fileHandler.readWeatherData();
    return FutureBuilder(
      future: _weatherData,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const CircularProgressIndicator();
        } else if ((snapshot.data as List<WeatherData>).isEmpty) {
          return Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "No Weather Data saved!",
                style: Theme.of(context).textTheme.headline5,
              ),
              const Text(
                  "Navigate to the WeerLive Page and save your data to the log")
            ],
          ));
        } else {
          return ListView.builder(
              itemCount: ((snapshot.data as List<WeatherData>).length),
              itemBuilder: (BuildContext ctx, int index) {
                return ListTile(
                  leading: const Icon(Icons.sunny),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(((snapshot.data) as List<WeatherData>)
                          .elementAt(index)
                          .liveweer
                          ?.elementAt(0)
                          .plaats as String),
                      Text(
                          '${((snapshot.data) as List<WeatherData>)
                              .elementAt(index)
                              .liveweer
                              ?.elementAt(0)
                              .temp as String}C\u00B0'),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => LogWeatherScreen(
                                  ((snapshot.data) as List<WeatherData>)
                                      .elementAt(index))));
                        },
                        child: const Icon(Icons.chevron_right),
                      ),
                    ],
                  ),
                  trailing: InkWell(
                    onTap: () {
                      deleteRecord(((snapshot.data) as List<WeatherData>)
                          .elementAt(index));
                    },
                    child: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                  ),
                );
              });
        }
      },
    );
  }
}
