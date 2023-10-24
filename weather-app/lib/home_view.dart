import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather/serach_view.dart';
import 'package:weather/widgets/no_weather_body.dart';
import 'package:weather/widgets/weather_info_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        actions: [
          IconButton(
            onPressed: () {
              // TODO convert into Navigator.pushNamed
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return const SearchView();
              }));
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: BlocBuilder<GetWeatherCubit, GetWeatherCubitState>(
        builder: (context, state) {
          if (state is GetWeatherCubitInitialState) {
            return const NoWeatherBody();
          } else if (state is GetWeatherCubitLoadingState) {
            return WeatherInfoBody(weatherModel: state.weatherModel!);
          } else {
            return const Text('oops there was an error');
          }
        },
      ),
    );
  }
}
