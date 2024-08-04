import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wether_app/helper/weatherHelper.dart';
import 'package:wether_app/modal/weatherModal.dart';

class Weatherprovider extends ChangeNotifier{

  ApiHelper apiHelper = ApiHelper();
  WeatherModal? weatherModal;
  String searchCity = 'Surat';

  List<String> Weather = [];
  List<double> Weather1 = [];
  List<String> Weather2 = [];
  List<String> Weather3 = [];

  void getCity(String search) {
    searchCity = search;
    notifyListeners();
  }
 Future<WeatherModal?> fromJson(String search)
  async {
    final data = await apiHelper.fetchApiData(search);
    weatherModal = WeatherModal.fromJson(data);
    return weatherModal;
  }
  Future<void> addFavourite(String name)
  async {
    String data = "$name";
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Weather.add(data);
    sharedPreferences.setStringList('weather', Weather);
  }
  Future<void> addFavourite2(double temp)
  async {
    double data = temp;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Weather1.add(data);
    sharedPreferences.setStringList('weather', Weather);
  }
  Future<void> addFavourite3(String text)
  async {
    String data = "$text";
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Weather2.add(data);
    sharedPreferences.setStringList('weather', Weather);
  }
  Future<void> addFavourite4(String icon)
  async {
    String data = "http:$icon";
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Weather3.add(data);
    sharedPreferences.setStringList('weather', Weather);
  }
  Future<void> getFavourite()
  async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    List<String> weather = sharedPreferences.getStringList('weather') ?? <String>[];
    notifyListeners();
  }
 WeatherProvider()
  {
    getFavourite();
  }

}
