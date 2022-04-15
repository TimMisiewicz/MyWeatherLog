import 'package:flutter/material.dart';
import 'package:myweatherlog/widgets/LogData.dart';

class LogScreen extends StatefulWidget {
  const LogScreen({Key? key}) : super(key: key);

  @override
  _LogScreenState createState() => _LogScreenState();
}

class _LogScreenState extends State<LogScreen> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: LogData(),
    );
  }
}
