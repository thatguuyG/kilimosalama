import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';
import 'package:google_fonts/google_fonts.dart';

class FloweringIrrigationPage extends StatefulWidget {
  FloweringIrrigationPage({Key key}) : super(key: key);

  @override
  _FloweringIrrigationPageState createState() =>
      _FloweringIrrigationPageState();
}

class _FloweringIrrigationPageState extends State<FloweringIrrigationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent[700],
        title: Text(
          'Irrigation at Flowering',
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              GFImageOverlay(
                height: 200,
                width: 350,
                image: CachedNetworkImageProvider(
                    'https://firebasestorage.googleapis.com/v0/b/kilimo-salama.appspot.com/o/images%2Firrigation_methods.jpg?alt=media&token=56811758-8926-468f-9d8e-42d1853ca909'),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                width: 320,
                child: Center(
                  child: Text(
                    'Irrigation at Flowering Stage',
                    style: GoogleFonts.aBeeZee(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                width: 320,
                child: Center(
                  child: Text(
                    'At this stage, your maize has  has began to produce flowers, and this is when it would need large amounts of water to thrive.',
                    style: GoogleFonts.aBeeZee(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                width: 320,
                child: Center(
                  child: Text(
                    'Flowering and post-flowering are the most susceptible stages for moisture stress. Irrigate your crops with approximately 5-7.5cm of water.',
                    style: GoogleFonts.aBeeZee(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
