import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/serach_view.dart';
import 'package:weather/widgets/no_weather_body.dart';
import 'package:weather/widgets/weather_info_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
  });

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
          //   var data = GetWeatherCubit().getWeather();
          if (state is GetWeatherCubitLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is GetWeatherCubitSuccessState) {
            /* Another way i put var data */

            // var data = GetWeatherCubit().weatherModel;

            BlocProvider.of<GetWeatherCubit>(context).weatherModel;
            return WeatherInfoBody(
              weatherModel: state.weatherModel,
            );
          } else if (state is GetWeatherCubitFailureState) {
            return const Center(child: Text('oops there was an error'));
          } else {
            return const NoWeatherBody();
          }
        },
      ),
    );
  }
}
