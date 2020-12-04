import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:clima/screens/location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
const apikey='7eef9ff479be2b4760bebd6dfe95c0ce';
double latitude;
double longitude;
class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getlocationData();
  }
  void getlocationData() async
  {
    var weatherda=await WeatherModel().getweatherdata();
    Navigator.push(context,MaterialPageRoute(builder:(context){

      return LocationScreen(weatherdata:weatherda,);

    }));
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body:Center(
        child:SpinKitChasingDots(
        color:Colors.white,
        size:100,
        ),
      ),
    );
  }
}
