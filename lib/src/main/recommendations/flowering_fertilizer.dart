import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';
import 'package:google_fonts/google_fonts.dart';


class FloweringFertilizerPage extends StatefulWidget {
  FloweringFertilizerPage({Key key}) : super(key: key);

  @override
  _FloweringFertilizerPageState createState() => _FloweringFertilizerPageState();
}

class _FloweringFertilizerPageState extends State<FloweringFertilizerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent[700],
        title: Text(
          'Nitrogen Split Fertilization',
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              GFImageOverlay(
                height: 300,
                width: 350,
                image: CachedNetworkImageProvider(
                    'https://firebasestorage.googleapis.com/v0/b/kilimo-salama.appspot.com/o/images%2Ffertilizer_types.png?alt=media&token=f403ad7d-7a48-42fc-9155-847df8529626'),
              ),
              SizedBox(
                height: 20.0,
              ),

              Container(
                width: 320,
                child: Center(
                  child: Text(
                    'Nitrogen Split Fertilization at Tasseling',
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
                    'At this stage, your maize has  reached its full height and will begin to shed its pollen.  Hail damage is more serious at this time than any other growth period.',
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
                    'It is necessary to apply 26kg of urea oer acre at this time in your cropping cycle. You can either apply side dressing or broadcasr the fertilizers.',
                    style: GoogleFonts.aBeeZee(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),

              SizedBox(height:20),

              Container(
                width: 320,
                child: Center(
                  child: Text(
                    'Nitrogen Split Fertilization at Grain Filling',
                    style: GoogleFonts.aBeeZee(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),

              SizedBox(height:10),
               Container(
                width: 320,
                child: Center(
                  child: Text(
                    'Apply 7kg of Urea per acre. This application is optional. You can either apply side dressing or broadcast the fertilizers.',
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