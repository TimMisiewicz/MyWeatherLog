import 'package:flutter/material.dart';

class WindDisplay extends StatelessWidget {
  String _WindDirection;
  String _WindSpeedKnots;

  WindDisplay(this._WindDirection, this._WindSpeedKnots, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.3,
            child: Stack(
              children: <Widget>[
                LayoutBuilder(builder: (context, constraints) {
                  return Center(
                    child: Opacity(
                        opacity: 0.2,
                        child: Icon(Icons.flare_rounded,
                            size: (MediaQuery.of(context).orientation ==
                                    Orientation.portrait)
                                ? constraints.biggest.width * 0.5
                                : MediaQuery.of(context).size.height * 0.20)),
                  );
                }),
                Center(
                  child: Column(
                    children: [
                      Text(
                        'Wind Direction',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Text(
                        _WindDirection,
                        style: Theme.of(context).textTheme.headline4,
                        key: const Key("windDirection"),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Column(
            children: [
              Text(
                'Wind Speed',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Text(
                '${_WindSpeedKnots}kn',
                style: Theme.of(context).textTheme.headline4,
                  key: const Key("windSpeed")
              ),
            ],
          )
        ],
      ),
    );
  }
}
