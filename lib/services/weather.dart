import 'package:clima/services/networking.dart';
import 'package:clima/services/location.dart';
double latitude;
double longitude;
class WeatherModel {
  Future<dynamic> getcityweather(String cityname) async{
    //print('cityname==$cityname');
    var url='https://samples.openweathermap.org/data/2.5/weather?q=$cityname&appid=b6907d289e10d714a6e88b30761fae22';
    Networking Networkinghelper=Networking(url);
    var weatherData=await Networkinghelper.getData();
    return weatherData;
  }
  Future<dynamic>getweatherdata() async{
    Location location=Location();
    await location.getcurrentlocation();
    latitude=location.latitude;
    longitude=location.longitude;
    Networking Networkinghelper=Networking('https://samples.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=b6907d289e10d714a6e88b30761fae22');
    var weatherData=await Networkinghelper.getData();
    return weatherData;
  }
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
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
