import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';
import 'package:google_fonts/google_fonts.dart';

class PreparationPage extends StatefulWidget {
  PreparationPage({Key key}) : super(key: key);

  @override
  _PreparationPageState createState() => _PreparationPageState();
}

class _PreparationPageState extends State<PreparationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent[700],
        title: Text(
          'Maize Preparation',
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              // Image.asset('assets/images/irrigation_methods.jpg'),
              GFImageOverlay(
                height: 200,
                width: 350,
                image: CachedNetworkImageProvider(
                    'https://firebasestorage.googleapis.com/v0/b/kilimo-salama.appspot.com/o/images%2Fdrying_maize.jpg?alt=media&token=2533a07f-880c-4c1e-b12a-d406b159dcc4'),
              ),
              SizedBox(
                height: 20.0,
              ),

              Container(
                width: 320,
                child: Center(
                  child: Text(
                    'Dry and Shell your maize Cobs',
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
                child: Column(
              children: <Widget>[
                Text(
                    '⏺ Harvested cobs are brought and dried on the floor',style: GoogleFonts.aBeeZee(
                  fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                ),),
                SizedBox(
                  height: 4.0,
                ),
                Text('⏺ Keep them for a few days to lower the moisture content of your maize.', style: GoogleFonts.aBeeZee(
                  fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                ),),
                SizedBox(
                  height: 4.0,
                ),
                Text(
                    '⏺ The maize must be kept around less humid air.', style: GoogleFonts.aBeeZee(
                  fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                ),),
                SizedBox(
                  height: 4.0,
                ),
                Text('⏺ Protect the drying cobs from any insects and animals', style: GoogleFonts.aBeeZee(
                  fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                ),),
              ],
            )),
            ),


             

            ],
          ),
        ),
      ),
    );
  }
}