// weather_response.dart
import 'weather.dart';

class WeatherResponse {
  final List<Weather> weather;

  WeatherResponse({required this.weather});

  factory WeatherResponse.fromJson(Map<String, dynamic> json) {
    var weatherList = (json['weather'] as List)
        .map((item) => Weather.fromJson(item))
        .toList();

    return WeatherResponse(weather: weatherList);
  }
}
