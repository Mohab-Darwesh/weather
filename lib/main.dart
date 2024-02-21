

import 'package:flutter/material.dart';
import 'package:noaa/model/Weather.dart';
import 'package:noaa/providers/weather_provider.dart';
import 'package:provider/provider.dart';

import 'Pages/HomePage.dart';
void main(){
  runApp(ChangeNotifierProvider

    (
      create: (context){
        return Weather_Provider();
      },
      child: weatherApp()));
}

// ignore: camel_case_types
class weatherApp extends StatelessWidget {
  Weather ? weatherm;
   weatherApp({super.key});

  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     theme: ThemeData(
       primaryColor: Provider.of<Weather_Provider>(context).weatherProv==null ?Colors.lightBlue :Provider.of<Weather_Provider>(context).weatherProv!.getThemeColor(),
brightness: Brightness.dark,


     ),
     debugShowCheckedModeBanner: false,
     home:HomePage() ,
   );

  }

}