import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';
import 'package:google_fonts/google_fonts.dart';

class VegetativeFertilizersPage extends StatefulWidget {
  VegetativeFertilizersPage({Key key}) : super(key: key);

  @override
  _VegetativeFertilizersPageState createState() =>
      _VegetativeFertilizersPageState();
}

class _VegetativeFertilizersPageState extends State<VegetativeFertilizersPage> {
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
              // Image.asset('assets/images/irrigation_methods.jpg'),
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
                    'Nitrogen Split Fertilization at 6 Leaves',
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
                    'Once your maize plants have developed 6 leaves, apply 33kg per acre of urea. It will be more efficient if you apply side dressing. If not possible, broadcast the fertilizer.',
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
                    'Rapid nitrogen uptake by maize begins about 5 weeks after germination(30 - 40 days) for about 4-6 weeks. Nitrogen Fertilizer needs to be available during these stages.',
                    style: GoogleFonts.aBeeZee(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
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
                    'Nitrogen Split Fertilization at 10 Leaves',
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
                    'Once your Maize has developed 10 leaves, apply 39 kg of Urea per acre. You can either apply side dressing or broadcast the fertilizer.',
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
