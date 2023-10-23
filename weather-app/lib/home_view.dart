import 'package:flutter/material.dart';
import 'package:weatherapp/serach_view.dart';
import 'package:weatherapp/widgets/no_weather_body.dart';
import 'package:weatherapp/widgets/weather_info_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wateher App'),
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
      body: const WeatherInfoBody(),
    );
  }
}
