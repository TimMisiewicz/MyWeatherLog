import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:myweatherlog/widgets/TemperatureSeperator.dart';
import 'package:myweatherlog/widgets/WindDisplay.dart';

void main() {
  testWidgets('Test WindData', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: WindDisplay("NW", "10.2")));

    final windFinder = find.byKey(const ValueKey("windDirection"));
    final windSpeedFinder = find.byKey(const ValueKey("windSpeed"));

    expect(windFinder, findsOneWidget);
    expect(find.text("NE"), findsNothing);
    expect(windSpeedFinder, findsOneWidget);
    expect(find.text("10.2"), findsNothing);
    expect(find.text("10.2kn"), findsOneWidget);
  });

  testWidgets('Test TemperatureSeperator', (WidgetTester tester) async {
    await tester.pumpWidget(
        const MaterialApp(home: TemperatureSeperator(temperature: 15.66)));

    final temperatureSeperatorFinder = find.byKey(const ValueKey("tempSep"));
    final tempSep = tester.widget<Container>(temperatureSeperatorFinder);

    expect(tempSep.color, const Color.fromRGBO(0, 255, 124, 1.0));
    expect(tempSep.color, isNot(const Color.fromRGBO(255, 140, 0, 1.0)));
  });
}
