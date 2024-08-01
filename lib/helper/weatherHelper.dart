import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;
class ApiHelper
{

  Future<Map> fetchApiData(String search)
  async {
    String api = "http://api.weatherapi.com/v1/current.json?key=74eb41b9deb24f808c0141812243007&q=$search";
    Uri url = Uri.parse(api);
    Response response = await http.get(url);
    if(response.statusCode == 200)
    {
      final json = response.body;
      Map data = jsonDecode(json);
      return data;
    }
    else {
      return {};
    }
  }
}