//Exctracted Widget For the Style Of The Text. This is used parallel to the StyledData Class
//To Create an Apperance of two differently styled Texts next to each other
import 'package:flutter/material.dart';

class StyledTexts extends StatelessWidget {
  const StyledTexts({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      '$text',
      style: TextStyle(
        color: Colors.grey,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}

//Extracted Widget For The Color of the JSON Data
class StyledData extends StatelessWidget {
  const StyledData({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final widget;

  @override
  Widget build(BuildContext context) {
    return Text(
      '${widget}',
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.deepOrange.shade400,
        fontSize: 18,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}

//StyledData and StyledText placed in a row for the display in this page

class widgetAlignment extends StatelessWidget {
  const widgetAlignment({
    Key? key,
    required this.text,
    required this.weatherData,
  }) : super(key: key);

  final String text;
  final weatherData;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        StyledTexts(
          text: '$text:',
        ),
        SizedBox(
          width: 5,
        ),
        StyledData(
          widget: weatherData,
        ),
      ],
    );
  }
}

class customTexts extends StatelessWidget {
  const customTexts({
    Key? key,
    required this.text,
    required this.widget,
    required this.colorText,
    required this.colorWidget,
  }) : super(key: key);
  final String text;
  final widget;
  final Color colorText;
  final Color colorWidget;
  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
          text: text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 21,
            color: colorText,
          ),
          children: [
            TextSpan(
              text: widget,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: colorWidget,
              ),
            )
          ]),
    );
  }
}
