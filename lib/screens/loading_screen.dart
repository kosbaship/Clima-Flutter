import 'package:flutter/material.dart';
import '../services/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class LoadingScreen extends StatefulWidget {

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    super.initState();
    getLocation();
    getDataFromNet();


  }

  void getLocation() async {
    Location mLocation = Location();
    await mLocation.getCurrentLocation();
    print(mLocation.latitude);
    print(mLocation.longitude);

  }

  // ignore: missing_return
  Future<http.Response> getDataFromNet() async{
    http.Response response = await http.get('https://samples.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=439d4b804bc8187953eb36d2a8c26a02');
    if(response.statusCode == 200){
      String data = response.body;
      // dynamic variable
      var decodedData = jsonDecode(data);

      double temperature = decodedData['main']['temp'];
      int condition = decodedData['weather'][0]['id'];
      String cityName = decodedData['name'];
      print(temperature);
      print(condition);
      print(cityName);
    }else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}