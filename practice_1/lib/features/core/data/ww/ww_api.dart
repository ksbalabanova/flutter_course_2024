import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:practice_1/features/core/data/ww/models/ww_weather.dart';

class WwApi {
  final String url;
  final String apiKey;

  WwApi(this.url, this.apiKey);

  Future<WWeather> getWeather(String city) async {
    var response = await http.get(Uri.parse('$url/data/2.5/weather?q=$city&appid=$apiKey'));
    var rJson = jsonDecode(response.body);

    return WWeather(rJson['main']['temp'], rJson['weather'][0]['main']);
  }
}