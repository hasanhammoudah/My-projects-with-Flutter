part of 'get_weather_cubit.dart';

@immutable
sealed class GetWeatherCubitState {}

final class GetWeatherCubitInitialState extends GetWeatherCubitState {}

final class GetWeatherCubitLoadingState extends GetWeatherCubitState {
  final WeatherModel? weatherModel;
  GetWeatherCubitLoadingState(this.weatherModel);
}

final class GetWeatherCubitSuccessState extends GetWeatherCubitState {}

final class GetWeatherCubitFailureState extends GetWeatherCubitState {
  final String errorMessage;
  GetWeatherCubitFailureState(this.errorMessage);
}
