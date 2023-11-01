part of 'get_weather_cubit.dart';

@immutable
sealed class GetWeatherCubitState {}

final class GetWeatherCubitInitialState extends GetWeatherCubitState {}

final class GetWeatherCubitLoadingState extends GetWeatherCubitState {}

final class GetWeatherCubitSuccessState extends GetWeatherCubitState {
  /* another step */
  final WeatherModel weatherModel;
  GetWeatherCubitSuccessState({required this.weatherModel});
}

final class GetWeatherCubitFailureState extends GetWeatherCubitState {
  final String errorMessage;
  GetWeatherCubitFailureState(this.errorMessage);
}
