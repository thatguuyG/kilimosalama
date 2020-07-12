import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:getflutter/components/avatar/gf_avatar.dart';
// import 'package:getflutter/components/card/gf_card.dart';
import 'package:getflutter/components/list_tile/gf_list_tile.dart';
import 'package:getflutter/getflutter.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/WeatherData.dart';
// import 'package:condition/condition.dart';

class Weather extends StatelessWidget {
  final WeatherData weather;

  Weather({Key key, @required this.weather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          weather.name,
          style: GoogleFonts.aBeeZee(
            fontSize: 35,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 10,),
        Text(weather.main,
            style: new TextStyle(color: Colors.black, fontSize: 29.0)),
           SizedBox(height: 10,), 
        Text('${weather.temp.toString()}°C',
            style: new TextStyle(color: Colors.black)),
        Image.network('https://openweathermap.org/img/w/${weather.icon}.png'),
        Text(new DateFormat.yMMMd().format(weather.date),
            style: new TextStyle(color: Colors.black)),
            SizedBox(height: 7,),
        Text(new DateFormat.Hm().format(weather.date),
            style: new TextStyle(color: Colors.black)),
        SizedBox(
          height: 20,
        ),
        _cloudyAdvice(),
        _dryAdvice(),
        _rainAdvice()
      ],
    );
  }

  Widget _cloudyAdvice() {
    if (weather.main == "Clouds") {
      return GFListTile(
        avatar: GFAvatar(
          size: GFSize.LARGE,
          backgroundImage: CachedNetworkImageProvider(
              'https://firebasestorage.googleapis.com/v0/b/kilimo-salama.appspot.com/o/images%2Fmaize_transplanting.jpeg?alt=media&token=6d199855-8e24-408e-8191-d5179c6c45d9'),
          shape: GFAvatarShape.standard,
        ),
        
        subtitleText: 'Its best to do your transplanting when cooler weather is in the forecast as the plants will lose less water .',
      );
    }
    return Text('');
  }

  Widget _dryAdvice(){
    if (weather.main == "Clear") {
      return GFListTile(
        avatar: GFAvatar(
          size: GFSize.LARGE,
          backgroundImage: CachedNetworkImageProvider(
              'https://firebasestorage.googleapis.com/v0/b/kilimo-salama.appspot.com/o/images%2Ftillage.jpg?alt=media&token=c2657df8-6df8-4a70-929a-ac5ed468e348'),
          shape: GFAvatarShape.standard,
        ),
        
        subtitleText: 'Its best to wait for dry weather to till your land.Its also the best time to dry your maize after a harvest .',
      );
    }
    return Text('');
  }

  Widget _rainAdvice(){
    if (weather.main == "Rain" && weather.main == "Drizzle") {
      return GFListTile(
        avatar: GFAvatar(
          size: GFSize.LARGE,
          backgroundImage: CachedNetworkImageProvider(
              'https://firebasestorage.googleapis.com/v0/b/kilimo-salama.appspot.com/o/images%2Fmaize_rain.jpg?alt=media&token=ee18b71f-5def-4779-bed1-d6d9f29b8362'),
          shape: GFAvatarShape.standard,
        ),
        
        subtitleText: 'Its best to start planting your seeds if you can.Also remember to start weeding after the rains stop.',
      );
    }
    return Text('');
  }






}
