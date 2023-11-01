import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather/home_view.dart';
import 'package:weather/utils/helper.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      /* I use 'Builder Widget' becuse i want build  BlocProvider.of<GetWeatherCubit>(context)
                      .weatherModel
                      ?.weatherCondition after this Widget */

      child: Builder(builder: (context) {
        return BlocBuilder<GetWeatherCubit, GetWeatherCubitState>(
          builder: (context, state) {
            return MaterialApp(
              theme: ThemeData(
                  primarySwatch: getThemeColor(
                      BlocProvider.of<GetWeatherCubit>(context)
                          .weatherModel
                          ?.weatherCondition)),
              debugShowCheckedModeBanner: false,
              home: const HomeView(),
            );
          },
        );
      }),
    );
  }
}

   //   primarySwatch: Provider.of<WeatherProvider>(context).weatherData == null ?  Colors.blue : Provider.of<WeatherProvider>(context).weatherData!.getThemeColor()  ,
