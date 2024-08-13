// home_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/data/repo/weather_repository.dart';
import 'package:myapp/ui/cubit/home_page_cubit.dart';
import 'package:myapp/data/entity/weather.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomePageCubit(WeatherRepository())..fetchWeatherData('Baku')),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Weather App'),
          centerTitle: true,
        ),
        body: BlocBuilder<HomePageCubit, Weather?>(
          builder: (context, weather) {
            if (weather == null) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return ListTile(
                title: Text(weather.cityName),
                subtitle: Text('Temperature: ${weather.temperature}°C'),
                trailing: Text(weather.weatherCondition),
              );
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
           //context.read<HomePageCubit>().fetchWeatherData('Baku');
          // Navigator.push(
              //context,
              //MaterialPageRoute(builder: (context) =>  CityNameScreen()),
            //);
          },
          child: const Icon(Icons.refresh),
        ),
      ),
    );
  }
}
