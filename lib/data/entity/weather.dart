// weather.dart
class Weather {
  final String cityName;
  final double temperature;
  final String weatherCondition;

  Weather({
    required this.cityName,
    required this.temperature,
    required this.weatherCondition,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
      double temperatureKelvin = json['main']['temp'] as double;
    double temperatureCelsius = temperatureKelvin - 273.15;
    return Weather(
      cityName: json['name'],
      temperature: temperatureCelsius.floorToDouble(),
      weatherCondition: json['weather'][0]['main'],
    );
  }
}
