import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:weather/models/weather_model.dart';

/* 'Dio' don't use to check status code because its provides me status code by defult*/

class WeatherService {
  final Dio dio;
  WeatherService(this.dio);

  final String baseUrl = 'http://api.weatherapi.com/v1';
  final String apiKey = '0d8e14dfcc724747a3f82000232310';

  Future<WeatherModel> getCurrentWeather({required String name}) async {
    try {
      Response response = await dio
          .get('$baseUrl/forecast.json?key=$apiKey&q=$name&days=1');

      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String erorrMessage = e.response!.data['error']['message'] ??
          'oops there was an error, try later!';
      throw Exception(erorrMessage);
    } catch (e) {
      log(e.toString());
      throw Exception('oops there was an error, try later!');
    }
  }
}
