import 'dart:convert';
import 'dart:io';
import 'package:myweatherlog/models/weather_data.dart';
import 'package:path_provider/path_provider.dart';

class FileHandler {
  FileHandler._privateConstructor();

  static final FileHandler instance = FileHandler._privateConstructor();

  static File? _file;

  static const _fileName = 'log.txt';

  Future<File> get file async {
    if (_file != null) return _file!;

    _file = await _initFile();
    return _file!;
  }

  Future<File> _initFile() async {
    final _directory = await getApplicationDocumentsDirectory();
    final _path = _directory.path;
    return File('$_path/$_fileName');
  }

  static Set<WeatherData> _weatherDataSet = {};

  Future<void> writeWeatherData(WeatherData weatherData) async {
    final File fl = await file;
    _weatherDataSet.add(weatherData);
    final _userListMap = _weatherDataSet.map((e) => e.toJson()).toList();

    await fl.writeAsString(jsonEncode(_userListMap));
  }

  Future<List<WeatherData>> readWeatherData() async {
    final File fl = await file;
    final _content = await fl.readAsString();

    final List<dynamic> _jsonData = jsonDecode(_content);
    final List<WeatherData> _weatherData = _jsonData
        .map(
          (e) => WeatherData.fromJson(e as Map<String, dynamic>),
        )
        .toList();
    return _weatherData;
  }

  Future<void> deleteWeatherData(WeatherData weatherData) async {
    final File fl = await file;

    _weatherDataSet.removeWhere((e) => e == weatherData);
    final _userListMap = _weatherDataSet.map((e) => e.toJson()).toList();

    await fl.writeAsString(jsonEncode(_userListMap));
  }
}
