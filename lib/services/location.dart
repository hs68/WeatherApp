import 'package:geolocator/geolocator.dart';

class Location {
  double longitude;
  double latitude;
  Future<void> getcurrentlocation() async {
    try {
      //print("hello");
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      longitude = position.longitude;
      latitude = position.latitude;
      //print('location==$longitude');
    } catch (e) {
      print(e);
    }
  }
}
