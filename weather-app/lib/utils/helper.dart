import 'package:flutter/material.dart';

MaterialColor getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }
  switch (condition.toLowerCase()) {
    // Clear or few clouds
    case 'clear':
    case 'sunny':
      return Colors.orange;

    // Cloudy
    case 'cloudy':
      return Colors.lightBlue;

    // Rainy
    case 'rain':
    case 'showers':
    case 'drizzle':
      return Colors.grey;

    default:
      return Colors.grey; // Default color for unknown conditions
  }
}
