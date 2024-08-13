import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/data/repo/weather_repository.dart';
import 'package:myapp/ui/cubit/home_page_cubit.dart';
import 'package:myapp/ui/views/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomePageCubit(WeatherRepository()),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Weather App',
        theme: ThemeData(
          primarySwatch: Colors.amber,
        ),
        home: const HomePage(),
      ),
    );
  }
}
