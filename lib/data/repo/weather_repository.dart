
import 'package:dio/dio.dart';
import 'package:myapp/data/entity/weather.dart';

class WeatherRepository {
  final String _apiKey = '1d2c81aa0eb07291cfaed1156997a653';
  
  Future<Weather> fetchWeatherData(String cityName) async {
    final url = 'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$_apiKey';
    final response = await Dio().get(url);

    if (response.statusCode == 200) {
      return Weather.fromJson(response.data);
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}

