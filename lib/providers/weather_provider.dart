
import 'package:flutter/cupertino.dart';
import 'package:noaa/model/Weather.dart';

class Weather_Provider extends ChangeNotifier

{
  String? cityName;
  Weather? _weatherProv;
  set wertherProv(Weather? weather){
    _weatherProv=weather;
    notifyListeners();

  }
  Weather? get weatherProv=>_weatherProv;
}
