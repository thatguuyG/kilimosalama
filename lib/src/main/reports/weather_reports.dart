
import 'package:flutter/material.dart';
import '../weather/weather_today.dart';
import '../weather/weather_forecast.dart';
// import '../weather/Weather.dart';
// import '../weather/WeatherItem.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import '../weather/WeatherData.dart';
// import '../weather/ForecastData.dart';


// import 'package:getflutter/getflutter.dart';

class WeatherReportsPage extends StatefulWidget {
  WeatherReportsPage({Key key}) : super(key: key);

  @override
  _SoilReportState createState() => _SoilReportState();
}

class _SoilReportState extends State<WeatherReportsPage> {


  Widget _today() {
      return Container(
      child: WeatherTodayPage(),
    );

  }

  Widget _forecast() {
    return Container(
      child: WeatherForecastPage()
    );
  }


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.greenAccent[700],
            title: Text(
              'Weather Condition',
            ),
            centerTitle: true,
            bottom: TabBar(indicatorColor: Colors.greenAccent, tabs: <Widget>[
              Tab(
                text: 'Today',
              ),
              Tab(
                text: 'Forecast',
              ),
            ]),
          ),
          body: TabBarView(
            children: <Widget>[
              _today(),
              _forecast(),
            ],
          ),
        ));
  }
}


