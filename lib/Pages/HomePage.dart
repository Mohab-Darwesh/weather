// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:noaa/model/Weather.dart';
import 'package:provider/provider.dart';

import '../providers/weather_provider.dart';
import 'SearchPage.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget{
    HomePage({Key? key}):super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

 class _HomePageState extends State<HomePage> {
  void updateUi() {
    setState(() {

    });
  }
  @override

  @override


Weather? weatherData;

  @override
  Widget build(BuildContext context) {
    weatherData = Provider.of<Weather_Provider>(context ,listen: true).weatherProv;
    print("weatherData== $weatherData");

    return(Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext contsxt){
              return(SearchPage(updateUi: updateUi   ,));
            }));
          }, icon: const Icon(Icons.search))
        ],

        title:const  Text("WeatherApp"),
        backgroundColor: Colors.cyan,
      ),

      body:weatherData == null?

      Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children:const [ Text(
            'there is no weather 😔 start',
            style: TextStyle(
              fontSize: 30,
            ),
          ),
            Text(
              'searching now 🔍',
              style: TextStyle(
                fontSize: 30,
              ),
            )

          ],
        ),

      ):
      Container (
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [weatherData!.getThemeColor()
            ,weatherData!.getThemeColor()[300]!,
            weatherData!.getThemeColor()[100]!      ] ,
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter
        )
      ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            const  Spacer(flex: 3,),
              Text(Provider.of<Weather_Provider>(context).cityName!,
              style: const TextStyle(fontSize: 32,
                  fontWeight: FontWeight.bold
              ),
            ),
             Text( 'updated at : ${weatherData!.date.hour.toString()}:${weatherData!.date.minute.toString()}',
              style: TextStyle(fontSize: 25,
                  fontWeight: FontWeight.bold
              ),
            ),
            const   Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(weatherData!.getImage()),
                const  Text("30",
                  style: TextStyle(fontSize: 32,
                      fontWeight: FontWeight.bold
                  ),
                ),
                Column(
                  children:  [
                    Text('maxTamp :${weatherData!.maxTemp.toInt()}'

                    ),
                    Text('manTamp :${weatherData!.minTemp.toInt()}'

                    ),
                  ],
                )
              ],

            ),
            const    Spacer(),

              Text(
                weatherData!.weatherStateName,
              style: const TextStyle(fontSize: 31,
                  fontWeight: FontWeight.bold
              ),
            ),
            const    Spacer(flex: 6,)

          ],
        ),

      ),

    )
    );
  }
}