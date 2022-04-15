import 'package:flutter/material.dart';
import 'dart:async';

import 'package:intl/intl.dart';
import 'package:myweatherlog/enums/time_slot.dart';

class TimeDisplay extends StatefulWidget {
  const TimeDisplay({Key? key}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<TimeDisplay> {
  String? _timeString;
  String? _dateString;
  DateTime _dateTime = DateTime.now();
  late Timer timer;

  @override
  void initState() {
    _dateString = _formatDate(DateTime.now());
    _timeString = _formatTime(DateTime.now());
    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) => _getTime());
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  TimeSlot _getTimeSlot(int hour) {
    const int morningFrom = 6;
    const int noonFrom = 12;
    const int eveningFrom = 18;
    const int nightFrom = 0;

    if (hour >= nightFrom && hour < morningFrom) {
      return TimeSlot.night;
    } else if (hour >= morningFrom && hour < noonFrom) {
      return TimeSlot.morning;
    } else if (hour >= noonFrom && hour < eveningFrom) {
      return TimeSlot.noon;
    } else {
      return TimeSlot.evening;
    }
  }

  IconData get _timeStackIcon {
    int hour = _dateTime.hour;
    TimeSlot timeSlot = _getTimeSlot(hour);

    switch (timeSlot) {
      case TimeSlot.night:
        return Icons.dark_mode;
      case TimeSlot.morning:
        return Icons.sunny_snowing;
      case TimeSlot.noon:
        return Icons.sunny;
      case TimeSlot.evening:
        return Icons.dark_mode_outlined;
    }
  }

  bool get _isPortrait {
    return MediaQuery.of(context).orientation == Orientation.portrait;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.75,
      child: Center(
        child: Stack(
          children: <Widget>[
            LayoutBuilder(builder: (context, constraints) {
              return Center(
                child: Opacity(
                    opacity: 0.1,
                    child: Icon(_timeStackIcon,
                        size: (_isPortrait)
                            ? constraints.biggest.width * 0.5
                            : MediaQuery.of(context).size.height * 0.25)),
              );
            }),
            Center(
              child: Column(
                children: [
                  Text(
                    '$_timeString',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  Text(
                    '$_dateString',
                    style: Theme.of(context).textTheme.bodyMedium,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _getTime() {
    final DateTime now = DateTime.now();
    final String formattedTime = _formatTime(now);
    final String formattedDate = _formatDate(now);
    setState(() {
      _dateString = formattedDate;
      _timeString = formattedTime;
      _dateTime = now;
    });
  }

  String _formatTime(DateTime dateTime) {
    return DateFormat('HH:mm:ss').format(dateTime);
  }

  String _formatDate(DateTime dateTime) {
    return DateFormat('EEE d MMM').format(dateTime);
  }
}
