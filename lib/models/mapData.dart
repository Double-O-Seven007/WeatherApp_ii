import 'dart:convert';
import 'dart:ffi';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

class MapData with ChangeNotifier {
  Map<String, dynamic> _map = {};
  bool _error = false;
  String _errorMessage = '';
  String _city = '';

  set city(String city) {
    _city = city;
  }

  Map<String, dynamic> get map => _map;
  bool get error => _error;
  String get errorMessage => _errorMessage;
  String get city => _city;

  Future<Void?> get fetchData async {
    final mapData = await get(
      Uri.parse(
          'http://api.openweathermap.org/data/2.5/weather?q=$city&units=metric&appid=150648eb24f4e424830da9adad83ff26'),
    );

    if (mapData.statusCode == 200) {
      try {
        _map = jsonDecode(mapData.body);
        _error = false;
      } catch (e) {
        _error = true;
        _errorMessage = e.toString();
      }
    } else {
      _error = true;
      _errorMessage =
          'Error: Oops! there is a problem with the internet connection, the link or the name of the city you entered';
    }
    notifyListeners();
  }

  void initialValues() {
    _map = {};
    _error = false;
    _errorMessage = '';
    notifyListeners();
  }
}
