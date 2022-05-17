import 'package:flutter/material.dart';

import '../pages/firstDisplay.dart';
import '../pages/searchPage.dart';
import '../pages/secondDisplay.dart';

class RouteManager {
  static const searchPage = '/';
  static const firstDisplay = '/firstDisplay';
  static const secondDisplay = "/secondDisplay";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    var varSent;

    if (settings.arguments != null) {
      varSent = settings.arguments as Map<String, dynamic>;
    }

    switch (settings.name) {
      case searchPage:
        return MaterialPageRoute(
          builder: (context) => SearchPage(),
        );
      case firstDisplay:
        return MaterialPageRoute(
          builder: (context) => FirstDisplay(),
        );

      case secondDisplay:
        return MaterialPageRoute(
          builder: (context) => SecondDisplay(
            pressure: varSent['pressure'],
            windSpeed: varSent['windSpeed'],
            sunrise: varSent['sunrise'],
            sunset: varSent['sunset'],
          ),
        );
      default:
        return throw FormatException('Something went wrong check routes');
    }
  }
}
