// home_page_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/data/entity/weather.dart';
import 'package:myapp/data/repo/weather_repository.dart';

class HomePageCubit extends Cubit<Weather?> {
  final WeatherRepository repository;

  HomePageCubit(this.repository) : super(null);

  Future<void> fetchWeatherData(String cityName) async {
    try {
      final weather = await repository.fetchWeatherData(cityName);
      emit(weather);
    } catch (e) {
      emit(null);
    }
  }
}
