import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/WeatherData.dart';
import '../models/mapData.dart';

class FirstDisplay extends StatefulWidget {
  const FirstDisplay({Key? key}) : super(key: key);

  @override
  State<FirstDisplay> createState() => _FirstDisplayState();
}

class _FirstDisplayState extends State<FirstDisplay> {
  @override
  Widget build(BuildContext context) {
    context.read<MapData>().fetchData;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Text('Details'),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/images/firstPage.jpg'),
          ),
        ),
        child: RefreshIndicator(
          onRefresh: () async {
            await context.read<MapData>().fetchData;
          },
          child: Center(
            child: Consumer<MapData>(
              builder: (context, value, child) {
                return value.map.length == 0 && !value.error
                    ? CircularProgressIndicator()
                    : value.error
                        ? Text(
                            'Something went wrong:\n${value.errorMessage}',
                            textAlign: TextAlign.center,
                          )
                        : ListView.builder(
                            itemCount: value.map['weather'].length,
                            itemBuilder: (context, index) {
                              return WeatherData(
                                sunrise: DateTime.fromMillisecondsSinceEpoch(
                                    value.map['sys']['sunrise'] * 1000),
                                sunset: DateTime.fromMillisecondsSinceEpoch(
                                    value.map['sys']['sunset'] * 1000),
                                windSpeed: value.map['wind']['speed'],
                                pressure:
                                    value.map['main']['pressure'].toDouble(),
                                weatherIcon: value.map['weather'][index]
                                    ['icon'],
                                weatherDescription: value.map['weather'][index]
                                    ['description'],
                                temperature: value.map['main']['temp'],
                                feelsLike: value.map['main']['feels_like'],
                                humidity:
                                    value.map['main']['humidity'].toDouble(),
                              );
                            },
                          );
              },
            ),
          ),
        ),
      ),
    );
  }
}
