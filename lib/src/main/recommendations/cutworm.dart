import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';
import 'package:google_fonts/google_fonts.dart';

class CutWormPage extends StatefulWidget {
  CutWormPage({Key key}) : super(key: key);

  @override
  _CutWormPageState createState() => _CutWormPageState();
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

class _CutWormPageState extends State<CutWormPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent[700],
        title: Text(
          'Prevent Cutworms ',
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
                    child: Center(
                      child:Column(
                      children: <Widget>[
                        GFImageOverlay(
                          height: 200,
                          width: 350,
                          image: CachedNetworkImageProvider(
                              'https://firebasestorage.googleapis.com/v0/b/kilimo-salama.appspot.com/o/images%2Fcutworm.jpg?alt=media&token=ecadba3b-db63-4e7e-985a-2365acd33429'),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Container(
                          width: 320,
                          child: Center(
                            child: Text(
                              'About',
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
                              'Cutworms are sporadic early-season pests that can reduce plant populations in a field. They often go unnoticed until after a significant number of plants have been damaged. Larger stages of cutworms cut entirely through the plant or tunnel into the plants below or above the soil line, whereas small-stage cutworms climb plants and chew small holes in the leaves.',
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
                              'Contributing Factors',
                              style: GoogleFonts.aBeeZee(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: 320,
                          child: Center(
                            child: Container(
                              child: new ListTile(
                              leading: new MyBullet(),
                              title: new Text('Late planting. '),
                            )),
                          ),
                        ),
                        Container(
                          width: 320,
                          child: Center(
                            child: Container(
                              child: new ListTile(
                              leading: new MyBullet(),
                              title: new Text('Low-damp areas of the field that drain poorly. '),
                            )),
                          ),
                        ),
                        Container(
                          width: 320,
                          child: Center(
                            child: Container(
                              child: new ListTile(
                              leading: new MyBullet(),
                              title: new Text('Early season weed growth. '),
                            )),
                          ),
                        ),
                        Container(
                          width: 320,
                          child: Center(
                            child: Text(
                              'Management',
                              style: GoogleFonts.aBeeZee(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 320,
                          child: Center(
                            child: Container(
                              child: new ListTile(
                              leading: new MyBullet(),
                              title: new Text('Early land preparation and good weed control will help to reduce cutworm problems because infestations usually develop on early season weed growth. '),
                            )),
                          ),
                        ),
                         Container(
                          width: 320,
                          child: Center(
                            child: Container(
                              child: new ListTile(
                              leading: new MyBullet(),
                              title: new Text('Fields should be cultivated at least two weeks before planting. '),
                            )),
                          ),
                        ),
                         Container(
                          width: 320,
                          child: Center(
                            child: Container(
                              child: new ListTile(
                              leading: new MyBullet(),
                              title: new Text('Insecticides applied at planting time solely for cutworm control are not recommended. Any insecticide applied at planting may not provide acceptable control of heavy cutworm infestations, and a rescue treatment may be necessary anyway.  '),
                            )),
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
