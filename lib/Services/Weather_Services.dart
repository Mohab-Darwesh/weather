

import 'dart:convert';

import 'package:http/http.dart'as http;
import 'package:noaa/model/Weather.dart';
class Weather_Service{
  String baseUrl='http://api.weatherapi.com/v1';
  String kayUrl='14718cfcab3c4cc7a2b212721232703';

  Future<Weather?> getWeather({required String cityName})async{
    Weather? weather;
    try{
      http.Response response =await http.get(
          Uri.parse(
              '$baseUrl/forecast.json?key=$kayUrl&q=$cityName&days=7' ));
      Map <String,dynamic> data=jsonDecode(response.body);
//     var jsonData = data['forecast']['forecastday'][0]['day'];
// Weather weather=Weather(
//     date: data['location']['localtime'],
//     temp:jsonData['avgtemp_c'],
//     maxTemp: jsonData['maxtemp_c'],
//     minTemp: jsonData['mintemp_c'],
//     weatherStateName: jsonData['condition']['text']);
      Weather weather=Weather.fromjson(data);


    }
    catch(e){
      print(e);
    }
    return(weather);
  }


}