import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'widgets/Weather.dart';
// import 'widgets/WeatherItem.dart';
import 'models/ForecastData.dart';
import 'models/WeatherData.dart';
// import 'package:getflutter/getflutter.dart';

class WeatherTodayPage extends StatefulWidget {
  WeatherTodayPage({Key key}) : super(key: key);

  @override
  _WeatherTodayPageState createState() => _WeatherTodayPageState();
}

class _WeatherTodayPageState extends State<WeatherTodayPage> {
  bool isLoading = false;
  WeatherData weatherData;
  WeatherData weather;
  ForecastData forecastData;

  @override
  void initState() {
    super.initState();
    loadWeather();
  }

  loadWeather() async {
    setState(() {
      isLoading = true;
    });

    // final lat = 40.730610;
    // final lon = -73.935242;

    final weatherResponse = await http.get(
        'https://api.openweathermap.org/data/2.5/weather?q=Nairobi&units=metric&appid=f3239c6ebca237aea77f9bd5f78d47ab');
    final forecastResponse = await http.get(
        'https://api.openweathermap.org/data/2.5/forecast?q=Nairobi&units=metric&appid=f3239c6ebca237aea77f9bd5f78d47ab');

    if (weatherResponse.statusCode == 200 &&
        forecastResponse.statusCode == 200) {
      return setState(() {
        weatherData =
            new WeatherData.fromJson(jsonDecode(weatherResponse.body));
        forecastData =
            new ForecastData.fromJson(jsonDecode(forecastResponse.body));
        isLoading = false;
      });
    }

    setState(() {
      isLoading = false;
    });
  }

  // Widget _goodCondition() {
  //   return GFCard(
  //     elevation: 5.0,
  //     color: Colors.green[50],
  //     content: GFListTile(
  //       padding: EdgeInsets.all(12.0),
  //       color: Colors.green[50],
  //       titleText: 'Good Condition for',
  //       subtitleText: 'This is the best time to start preparing your farm',
  //       // icon: Icon(Icons.favorite)
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // backgroundColor: Colors.blueGrey[50],
        body: SingleChildScrollView(
          child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
            SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.all(0.5),
              child: weatherData != null
                  ? Weather(weather: weatherData)
                  : Container(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: isLoading
                  ? CircularProgressIndicator(
                      strokeWidth: 2.0,
                      valueColor: new AlwaysStoppedAnimation(Colors.black),
                    )
                  : IconButton(
                      icon: new Icon(Icons.refresh),
                      tooltip: 'Refresh',
                      onPressed: loadWeather,
                      color: Colors.black,
                    ),
            ),
            // _goodCondition(),
          ]),
        ),
      ),
    );
  }
}
