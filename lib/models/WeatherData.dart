import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../customWidgets/customTextWidgets.dart';
import '../routes/routeManager.dart';

class WeatherData extends StatefulWidget {
  const WeatherData({
    Key? key,
    required this.weatherDescription,
    required this.weatherIcon,
    required this.temperature,
    required this.feelsLike,
    required this.pressure,
    required this.windSpeed,
    required this.humidity,
    required this.sunrise,
    required this.sunset,
  }) : super(key: key);

  //fields required
  final double windSpeed;
  final String weatherDescription; //used
  final String weatherIcon; //used
  final double temperature; //used
  final double feelsLike; //used
  final double pressure; //used
  final double humidity; //used
  final DateTime sunrise; //used
  final DateTime sunset; //used

  @override
  State<WeatherData> createState() => _WeatherDataState();
}

class _WeatherDataState extends State<WeatherData> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                constraints: BoxConstraints.expand(height: 100, width: 100),
                child: CachedNetworkImage(
                  errorWidget: (context, url, error) => Icon(
                    Icons.error,
                    size: 50,
                    color: Colors.red,
                  ),
                  placeholder: (context, url) {
                    return Image(
                      matchTextDirection: true,
                      image: AssetImage(
                        'assets/images/placeholder.png',
                      ),
                    );
                  },
                  imageUrl:
                      'http://openweathermap.org/img/wn/${widget.weatherIcon}@2x.png',
                ),
              ),
              SizedBox(
                width: 210,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(1, 1),
                  fixedSize: Size(60, 30),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Center(
                  child: Icon(
                    Icons.arrow_back_sharp,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          widgetAlignment(
            text: 'Temperature',
            weatherData: widget.temperature,
          ),
          SizedBox(
            height: 5,
          ),
          widgetAlignment(
            text: 'Description',
            weatherData: widget.weatherDescription,
          ),
          SizedBox(
            height: 5,
          ),
          widgetAlignment(
            text: 'Feels Like',
            weatherData: widget.feelsLike,
          ),
          SizedBox(
            height: 5,
          ),
          widgetAlignment(
            text: 'Humidity',
            weatherData: widget.humidity,
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ButtonStyle(),
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    RouteManager.secondDisplay,
                    arguments: {
                      'pressure': widget.pressure,
                      'windSpeed': widget.windSpeed,
                      'sunrise': widget.sunrise,
                      'sunset': widget.sunset,
                    },
                  );
                },
                child: Text('Touch Me for More Details'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
