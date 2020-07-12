import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';
import 'package:google_fonts/google_fonts.dart';


// import 'package:geolocator/geolocator.dart';

class MaizeVarietiesPage extends StatefulWidget {
  MaizeVarietiesPage({Key key}) : super(key: key);

  @override
  _MaizeVarietiesPageState createState() => _MaizeVarietiesPageState();
}

class MyBullet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 5.0,
      width: 5.0,
      decoration: new BoxDecoration(
        color: Colors.black,
        shape: BoxShape.circle,
      ),
    );
  }
}

class _MaizeVarietiesPageState extends State<MaizeVarietiesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent[700],
        title: Text(
          'Maize Varieties',
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            GFImageOverlay(
              height: 200,
              width: 350,
              image: CachedNetworkImageProvider(
                  'https://firebasestorage.googleapis.com/v0/b/kilimo-salama.appspot.com/o/images%2Fcrop_breed.jpg?alt=media&token=4f0f1b52-9b02-409c-8c63-a78ab44f1007'),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              width: 320,
              child: Center(
                child: Text(
                  'Get the right variety for your farm',
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
                  'Each and every year, farmers get poor harvests because they planted the wrong varieties in their regions. Many farmers plant the wrong maize seed varieties, ending up with poor yields for lack of correct information.',
                  style: GoogleFonts.aBeeZee(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Container(
              width: 320,
              child: Center(
                child: Text(
                  'Below, we provide you with some of the new and alternative maize seed varieties:',
                  style: GoogleFonts.aBeeZee(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            //maize varieties  data here
            //datatable here too
            Card(
              elevation: 3.0,
              child: ExpansionTile(
                trailing: Icon(Icons.arrow_drop_down),
                title: Text(
                  'High altitude varieties: Trans Nzoia, Uasin Gishu, West Pokot, Keiyo, Marakwet Laikipia, Nakuru, Kisii, Kiambu',
                  style: GoogleFonts.aBeeZee(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                children: <Widget>[
                  Text(
                    'Variety: ADC 600-23A – Company: Agricultural Development Corporation (ADC)',
                    style: GoogleFonts.aBeeZee(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                  Container(
                    width: 320,
                    child: Center(
                      child: Container(
                          child: new ListTile(
                        title: new Text(
                            '⏺  Average yield 43- 68 bags per acre.'),
                      )),
                    ),
                  ),
                  Container(
                    width: 320,
                    child: Center(
                      child: Container(
                          child: new ListTile(
                        title: new Text(
                            '⏺  Sweet in taste.'),
                      )),
                    ),
                  ),
                   Container(
                    width: 320,
                    child: Center(
                      child: Container(
                          child: new ListTile(
                        title: new Text(
                            '⏺  It produces a double cob.'),
                      )),
                    ),
                  ),
                  Container(
                    width: 320,
                    child: Center(
                      child: Container(
                          child: new ListTile(
                        title: new Text(
                            '⏺   Resistant to Grey Leaf Spot,Leaf blight and Rust.'),
                      )),
                    ),
                  ),
                ],
              ),
            ),

            //medium altitude varieties
             Card(
              elevation: 3.0,
              child: ExpansionTile(
                trailing: Icon(Icons.arrow_drop_down),
                title: Text(
                  'Medium altitude varieties:Kericho, Bomet, Narok, Sotik, Trans-Mara; Central Province- Muranga, Kiambu, Kirinyaga; Eastern Province-Embu, Meru, Machakos, Kitui',
                  style: GoogleFonts.aBeeZee(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                children: <Widget>[
                  SizedBox(height: 8),
                  Text(
                    '(i) Variety: WH507 – Company: Western Seed Co.',
                    style: GoogleFonts.aBeeZee(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                  
                  Container(
                    width: 320,
                    child: Center(
                      child: Container(
                          child: new ListTile(
                        title: new Text(
                            '⏺  Average yield 35–40 bags per acre.'),
                      )),
                    ),
                  ),
                  Container(
                    width: 320,
                    child: Center(
                      child: Container(
                          child: new ListTile(
                        title: new Text(
                            '⏺  Matures in 4 months (120–140 days).'),
                      )),
                    ),
                  ),
                   Container(
                    width: 320,
                    child: Center(
                      child: Container(
                          child: new ListTile(
                        title: new Text(
                            '⏺  Large cob and stalk.'),
                      )),
                    ),
                  ),
                  Container(
                    width: 320,
                    child: Center(
                      child: Container(
                          child: new ListTile(
                        title: new Text(
                            '⏺   Good taste as green maize when roasted.'),
                      )),
                    ),
                  ),
                ],
              ),
            ),

            //dryland varieties
             Card(
              elevation: 3.0,
              child: ExpansionTile(
                trailing: Icon(Icons.arrow_drop_down),
                title: Text(
                  'Dryland varieties',
                  style: GoogleFonts.aBeeZee(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                children: <Widget>[
                  SizedBox(height: 8),
                  Text(
                    'DH01, DH02, DH03, and DH04 (Kenya Seed Company).',
                    style: GoogleFonts.aBeeZee(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                  
                  Container(
                    width: 320,
                    child: Center(
                      child: Container(
                          child: new ListTile(
                        title: new Text(
                            '⏺  Dryland varieties mature within 90-120 days. '),
                      )),
                    ),
                  ),
                  Container(
                    width: 320,
                    child: Center(
                      child: Container(
                          child: new ListTile(
                        title: new Text(
                            '⏺   perform well in arid and marginal areas with a mean annual rainfall of 200mm – 500mm'),
                      )),
                    ),
                  ),
                  
                  
                ],
              ),
            ),

            
          ],
        ),
      ), 
    );
  }
}
