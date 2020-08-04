import 'package:flutter/material.dart';
import '../services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima/screens/location_screen.dart';
const apiKey = '6d7f94fbcc26d5d34eb975a955454102';

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
    var mLat;
    var mLong;
    Location mLocation = Location();
    await mLocation.getCurrentLocation();

    mLat = mLocation.latitude ;
    mLong = mLocation.latitude ;

    NetworkHelper networkHelper = NetworkHelper('https://api.openweathermap.org/data/2.5/weather?lat=$mLat&lon=$mLong&appid=$apiKey&units=metric');

    var decodedData = await networkHelper.getDataFromNet();

    Navigator.push(context, MaterialPageRoute(
      builder: (context) => LocationScreen(currentLocationWeatherData: decodedData,),
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