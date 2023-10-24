import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/services/weather_services.dart';

part 'get_weather_state.dart';

class GetWeatherCubit extends Cubit<GetWeatherCubitState> {
  GetWeatherCubit() : super(GetWeatherCubitInitialState());

   WeatherModel? weatherModel;
  getWeather({String? cityName}) async {
    try {
       weatherModel =
          await WeatherService(Dio()).getCurrentWeather(name: cityName!);
      emit(GetWeatherCubitLoadingState(weatherModel!));
    } catch (e) {
      emit(GetWeatherCubitFailureState(e.toString()));
    }
  }
}
