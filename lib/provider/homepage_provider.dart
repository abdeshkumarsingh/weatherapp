import 'dart:convert';
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/services/location_service.dart';
import 'package:weather_app/services/weather_service.dart';

class HomepageProvider with ChangeNotifier{
  String _labelText = '';
  double _temprature = 0.0;
  String _climet = '';
  String _weatherIcon = '';

  double get temprature => _temprature;
  String get climet => _climet;
  String get weatherIcon => _weatherIcon;

  String get labelText => _labelText;
  void setLabelText(String text){
    _labelText = text;
    notifyListeners();
  }

  Future getWeather() async{
    if(_labelText.isEmpty){
      Position position = await LocationService().getLocation();
      final weatherData = await WeatherService().fetchLocationWeather(position.longitude, position.latitude);
      _temprature = jsonDecode(weatherData)['main']['temp'];
      _climet = jsonDecode(weatherData)['weather'][0]['main'];
      _weatherIcon = jsonDecode(weatherData)['weather'][0]['icon'];
      notifyListeners();
    } else {
      final weatherData = await WeatherService().fetchCityWeather(_labelText);
      _temprature = jsonDecode(weatherData)['main']['temp'];
      _climet = jsonDecode(weatherData)['weather'][0]['main'];
      _weatherIcon = jsonDecode(weatherData)['weather'][0]['icon'];
      notifyListeners();
    }
  }

//   void updateWeatherIcon(){
//     if(_weatherCode <= 250){
//
//     }
//     if(_weatherCode >= 300 && _weatherCode <= 350){
//
//     }
//     if(_weatherCode >= 500 && _weatherCode <= 550){
//
//     }
//     if(_weatherCode >= 600 && _weatherCode <= 650){
//
//     }
//     if(_weatherCode >= 700 && _weatherCode <= 750){
//
//     }
//     if(_weatherCode == 800){
//
//     }
//     if(_weatherCode > 800){
//
//     }
//   }
}