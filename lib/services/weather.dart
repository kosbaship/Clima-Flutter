import 'package:flutter/material.dart';
import '../services/location.dart';
import 'package:clima/services/networking.dart';
const apiKey = '6d7f94fbcc26d5d34eb975a955454102';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';


class WeatherModel {

  Future<dynamic> getWeatherDataWithLocation() async{
    Location mLocation = Location();
    await mLocation.getCurrentLocation();
    NetworkHelper networkHelper = NetworkHelper('$openWeatherMapURL?lat=${mLocation.latitude}&lon=${mLocation.latitude }&appid=$apiKey&units=metric');

    var decodedWeatherData = await networkHelper.getDataFromNet();

    return decodedWeatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧 ';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }



  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
