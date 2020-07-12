import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';
import 'package:http/http.dart' as http;
// import 'widgets/Weather.dart';
import 'widgets/WeatherItem.dart';
import 'models/ForecastData.dart';
import 'models/WeatherData.dart';

class WeatherForecastPage extends StatefulWidget {
  WeatherForecastPage({Key key}) : super(key: key);

  @override
  _WeatherForecastPageState createState() => _WeatherForecastPageState();
}

class _WeatherForecastPageState extends State<WeatherForecastPage> {
  bool isLoading = false;
  WeatherData weatherData;
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

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: GFCard(
          boxFit: BoxFit.cover,
         image: Image(image: CachedNetworkImageProvider('https://firebasestorage.googleapis.com/v0/b/kilimo-salama.appspot.com/o/images%2Fweather.gif?alt=media&token=8e98564c-bec9-4f44-8a28-b62561cc082a')),
             title: GFListTile(
        title: Text('View Forecast Weather Reports'),
    ),
          content: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 170.0,
                child: forecastData != null
                    ? ListView.builder(
                        itemCount: forecastData.list.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => WeatherItem(
                            weather: forecastData.list.elementAt(index)))
                    : Container(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
