import 'package:flutter/material.dart';
import '../customWidgets/customTextWidgets.dart';
import '../routes/routeManager.dart';

class SecondDisplay extends StatefulWidget {
  const SecondDisplay({
    Key? key,
    required this.pressure,
    required this.windSpeed,
    required this.sunset,
    required this.sunrise,
  }) : super(key: key);

  final double pressure;
  final double windSpeed;
  final DateTime sunrise;
  final DateTime sunset;

  @override
  State<SecondDisplay> createState() => _SecondDisplayState();
}

class _SecondDisplayState extends State<SecondDisplay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).pushNamed(RouteManager.searchPage);
        },
        label: Text(
          'Search',
          style: TextStyle(
            fontSize: 15,
          ),
        ),
        backgroundColor: Colors.pink[400],
        elevation: 20,
      ),
      body: Center(
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('assets/images/MoreDetailsImage.jpg'),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 100.0, left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        customTexts(
                          colorText: Colors.pink.shade300,
                          colorWidget: Colors.purple.shade400,
                          text: 'Pressure: ',
                          widget: '${widget.pressure}',
                        ),
                        SizedBox(
                          width: 160,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(1, 1),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.arrow_back_rounded,
                          ),
                        ),
                      ],
                    ),
                    // SizedBox(
                    //   height: 5,
                    // ),
                    customTexts(
                      colorText: Colors.pink.shade300,
                      colorWidget: Colors.purple.shade400,
                      text: 'Windspeed: ',
                      widget: '${widget.windSpeed}',
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    customTexts(
                      colorText: Colors.pink.shade300,
                      colorWidget: Colors.purple.shade400,
                      text: 'Sunrise: ',
                      widget: '${widget.sunrise.hour}:${widget.sunrise.minute}',
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    customTexts(
                      colorText: Colors.pink.shade300,
                      colorWidget: Colors.purple.shade400,
                      text: 'Sunset: ',
                      widget: '${widget.sunset.hour}:${widget.sunset.minute}',
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
