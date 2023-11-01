import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/services/weather_services.dart';

part 'get_weather_state.dart';

class GetWeatherCubit extends Cubit<GetWeatherCubitState> {
  GetWeatherCubit() : super(GetWeatherCubitInitialState());

  WeatherModel? weatherModel;
  
  void getWeather({String? cityName}) async {
    emit(GetWeatherCubitLoadingState());
    try {
      weatherModel = await WeatherService().getCurrentWeather(name: cityName!);
      emit(GetWeatherCubitSuccessState(weatherModel:weatherModel!));
    } catch (e) {
      emit(GetWeatherCubitFailureState(e.toString()));
    }
  }
}
