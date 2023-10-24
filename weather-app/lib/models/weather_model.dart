class WeatherModel {
  final int? code;
  final String name;
  DateTime date;
  final String? image;
  final double temp;
  final double maxTemp;
  final double minTemp;
  final String weatherCondition;

  WeatherModel(
      {this.code,
      required this.name,
      required this.date,
      this.image,
      required this.temp,
      required this.maxTemp,
      required this.minTemp,
      required this.weatherCondition});

  factory WeatherModel.fromJson(dynamic json) {
    return WeatherModel(
      code: json['code'],
      name: json['location']['name'],
      date: DateTime.parse(json['current']['last_updated']),
      temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
      maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      weatherCondition: json['forecast']['forecastday'][0]['day']['condition']
          ['text'],
      image: json['forecast']['forecastday'][0]['day']['condition']['icon'],
    );
  }
  @override
  String toString() {
    return 'tem = $temp  minTemp = $minTemp  date = $date';
  }
}
