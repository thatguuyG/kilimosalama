import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';
import 'package:google_fonts/google_fonts.dart';

class FieldPreparationPage extends StatefulWidget {
  FieldPreparationPage({Key key}) : super(key: key);

  @override
  _FieldPreparationState createState() => _FieldPreparationState();
}

class MyBullet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 20.0,
      width: 10.0,
      decoration: new BoxDecoration(
        color: Colors.black,
        shape: BoxShape.circle,
      ),
    );
  }
}

class _FieldPreparationState extends State<FieldPreparationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent[700],
        title: Text(
          'Field Preparation',
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Column(
              children: <Widget>[
                SizedBox(
                  child: SingleChildScrollView(
                    child:  Center(
                      child:Column(
                      children: <Widget>[
                        GFImageOverlay(
                          height: 200,
                          width: 350,
                          image: CachedNetworkImageProvider(
                              'https://firebasestorage.googleapis.com/v0/b/kilimo-salama.appspot.com/o/images%2Ffield_preparation.jpg?alt=media&token=52f09daf-93c5-40ea-92d9-cf38b0d0bd52'),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Container(
                          width: 320,
                          child: Center(
                            child: Text(
                              'Be precise with your field preparation',
                              style: GoogleFonts.aBeeZee(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          width: 320,
                          child: Center(
                            child: Text(
                              'Poorly prepared land leads to low yields. It is important to prepare the soil properly to ensure good germination of your maize. Digging exposes harmful pests and diseases to the heat of the sun.',
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
                              'How to prepare your land for maize planting',
                              style: GoogleFonts.aBeeZee(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Container(
                          width: 320,
                          child: Center(
                            child: Column(
                              children: <Widget>[
                                Text(
                                  'Land preparation can be done by hand digging, using an ox-plough or a disc plough. Depending on the condition of the ground, dig once or twice, to a depth of at least 20 cm during the dry season.\n',
                                  style: GoogleFonts.aBeeZee(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  'At the start of rains, harrow(soften) the soil. Avoid digging or harrowing the soil when it is too wet because this can cause big lumps especially in clay soils. Harrowing involves breaking up large lumps of soil to get a good seedbed.\n',
                                  style: GoogleFonts.aBeeZee(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  'A good seedbed makes planting easier and ensures maize germinates well. Planting should start a few days after the start of the rains when the soil is moist.',
                                  style: GoogleFonts.aBeeZee(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        
                       
                      ],
                    ),
                  ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
