import 'dart:convert';
import 'package:http/http.dart' as http;
class Networking{
  Networking(this.url);
  final String url;
  Future getData() async {
    http.Response response=await http.get(url);
    if(response.statusCode==200)
    {
      String s=response.body;
      print(s);
      //print("wecw");
      return jsonDecode(s);
    }
    else
    {
      print(response.statusCode);
    }
  }
}