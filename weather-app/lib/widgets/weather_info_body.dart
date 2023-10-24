import 'package:flutter/material.dart';
import 'package:weather/main.dart';
import 'package:weather/models/weather_model.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({
    super.key,
    required this.weatherModel,
  });
  final WeatherModel weatherModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            getThemeColor(weatherModel.weatherCondition),
            getThemeColor(weatherModel.weatherCondition)[300]!,
            getThemeColor(weatherModel.weatherCondition)[50]!,
          ])),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              weatherModel.name,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
            ),
            Text(
              'updated at ${weatherModel.date.hour}:${weatherModel.date.minute}',
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.network("https:${weatherModel.image!}"),
                Text(
                  weatherModel.temp.toString(),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 32),
                ),
                Column(
                  children: [
                    /* Can I use 'toStringAsFixed' instead -> use 'round()' */
                    Text(
                      'Maxtemp:  ${weatherModel.maxTemp.toStringAsFixed(0)}',
                      style: const TextStyle(fontSize: 16),
                    ),
                    Text(
                      'Mintemp: ${weatherModel.minTemp.toStringAsFixed(0)}',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                )
              ],
            ),
            Text(
              weatherModel.weatherCondition,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
            ),
          ],
        ),
      ),
    );
  }
}
