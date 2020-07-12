import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';
import 'package:google_fonts/google_fonts.dart';

class StoragePage extends StatefulWidget {
  StoragePage({Key key}) : super(key: key);

  @override
  _StoragePageState createState() => _StoragePageState();
}

class _StoragePageState extends State<StoragePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent[700],
        title: Text(
          'Maize Storage',
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
                    'https://firebasestorage.googleapis.com/v0/b/kilimo-salama.appspot.com/o/images%2Fmaize_storage.jpg?alt=media&token=0119ea48-b3d6-4407-833d-719460c5ca7a'),
              ),
              SizedBox(
                height: 20.0,
              ),

              Container(
                width: 320,
                child: Center(
                  child: Text(
                    'Cleaning and storing grain',
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
                      '⏺ Separate your maize for consumption, and excess for sale or other intended uses.',
                      style: GoogleFonts.aBeeZee(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 4.0,
                    ),
                    Text(
                      '⏺ Your dried and cleaned Maize should be stored in super green bags, metal tins or moisture proof ones.',
                      style: GoogleFonts.aBeeZee(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 4.0,
                    ),
                    Text(
                      '⏺ Mix your maize with Neem to protect it from insects and fungus while in storage. Neem has properties that prevent attacks from pests. ',
                      style: GoogleFonts.aBeeZee(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                   
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
