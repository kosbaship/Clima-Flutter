import 'package:flutter/material.dart';
import '../services/weather.dart';
import 'package:clima/screens/location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';



class LoadingScreen extends StatefulWidget {

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    super.initState();
    getLocationAndData();
  }

  void getLocationAndData() async {
    WeatherModel weatherModel = WeatherModel();

    var decodedWeatherData = await weatherModel.getWeatherDataWithLocation();

    Navigator.push(context, MaterialPageRoute(
      builder: (context) => LocationScreen(currentLocationWeatherData: decodedWeatherData,),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:  SpinKitFadingFour(
            color: Colors.white,
            size: 50.0,
          ),
      ),
    );
  }
}