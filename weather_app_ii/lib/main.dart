import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_ii/routes/routeManager.dart';
import 'models/mapData.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MapData(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: RouteManager.searchPage,
        onGenerateRoute: RouteManager.generateRoute,
      ),
    );
  }
}
