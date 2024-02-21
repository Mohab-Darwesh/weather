// ignore_for_file: use_build_context_synchronously, must_be_immutable

import 'package:flutter/material.dart';
import 'package:noaa/Services/Weather_Services.dart';
import 'package:noaa/model/Weather.dart';
import 'package:noaa/providers/weather_provider.dart';
import 'package:provider/provider.dart';
class SearchPage extends StatelessWidget{
  // ignore: non_constant_identifier_names
 String? CityName;
 SearchPage({this.updateUi});
 VoidCallback? updateUi;

  @override
  Widget build(BuildContext context) {
    return(Scaffold(
      appBar: AppBar(
        title:const Text('Search a City'),

      ),

      body: Center(
        child:  Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: TextField(

            onChanged: (data){
              CityName=data;
            },

            onSubmitted: (data) async {
              CityName=data;

               Weather_Service service=Weather_Service();

               Weather? weather =
               await service.getWeather(cityName: CityName!);


              Provider.of<Weather_Provider>(context,listen: false).wertherProv = weather;
              Provider.of<Weather_Provider>(context, listen:  false).cityName=CityName;

               Navigator.pop(context);
            },
            decoration:  InputDecoration(
              contentPadding: const EdgeInsets.symmetric(vertical: 35,horizontal: 25),
              label: const Text('Search'),
              border: const OutlineInputBorder(),
              suffixIcon: GestureDetector(
                onTap: () async{
                  Weather_Service service=Weather_Service();
                  Weather? weather =
                      await service.getWeather(cityName: CityName!);
                  Provider.of<Weather_Provider>(context,listen: false).wertherProv = weather;
                  Provider.of<Weather_Provider>(context, listen:  false).cityName=CityName;
                  Navigator.pop(context);
                },
                  child: const Icon(Icons.search)
              ),
              hintText: 'enter city ',
            ),
          ),
        ),
      ),

    ));
  }

}
Weather? weatherData;