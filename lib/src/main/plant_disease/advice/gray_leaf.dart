import 'package:flutter/material.dart';
import 'package:getflutter/components/avatar/gf_avatar.dart';
import 'package:getflutter/components/image/gf_image_overlay.dart';
import 'package:getflutter/components/list_tile/gf_list_tile.dart';
import 'package:getflutter/shape/gf_avatar_shape.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';

class GrayLeaf extends StatefulWidget {
  GrayLeaf({Key key}) : super(key: key);

  @override
  _GrayLeafState createState() => _GrayLeafState();
}

class _GrayLeafState extends State<GrayLeaf> {
  Widget _about() {
    return Container(
      child: Column(
        children: <Widget>[
          Center(
              child: GFImageOverlay(
                  height: 200,
                  width: 200,
                  shape: BoxShape.circle,
                  image: CachedNetworkImageProvider('https://firebasestorage.googleapis.com/v0/b/kilimo-salama.appspot.com/o/images%2Fgray_leaf_spot.jpg?alt=media&token=c554aea9-8e3d-4e9f-a3f6-0ca38e5fff51')
                  )),
          SizedBox(
            height: 20.0,
          ),
          Center(
            child: Text(
              'Gray Leaf Spot (GLS)',
              style: GoogleFonts.aBeeZee(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 120.0,
            child: Card(
                elevation: 10.0,
                margin: EdgeInsets.all(5.0),
                child: Text(
                  'Gray leaf spot (GLS) is a common fungal disease  caused by the pathogen Cercospora zeae-maydis in corn. Disease development is favored by warm temperatures(27°C;) and high humidity  for 12 hours or more',
                  style: GoogleFonts.aBeeZee(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                )),
          ),
        ],
      ),
    );
  }

  Widget _preventive() {
    return Container(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 30,
          ),
          Center(
            child: Text(
              'Preventive Measures',
              style: GoogleFonts.aBeeZee(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),
          GFListTile(
            avatar: GFAvatar(
              shape: GFAvatarShape.standard,
              backgroundImage:CachedNetworkImageProvider('https://firebasestorage.googleapis.com/v0/b/kilimo-salama.appspot.com/o/images%2Fhybrid.jpg?alt=media&token=a5ab25b0-ffa1-4a3e-8a6f-25b91ab3aa04')
            ),
            // icon: Icon(Icons.favorite)),
            subtitleText: ' Hybrid tolerance/resistance crops is the best option for management of GLS',
            // icon: Icon(Icons.favorite)),
          ),

          GFListTile(
            avatar: GFAvatar(
              shape: GFAvatarShape.standard,
              backgroundImage: CachedNetworkImageProvider('https://firebasestorage.googleapis.com/v0/b/kilimo-salama.appspot.com/o/images%2Ftillage.jpg?alt=media&token=c2657df8-6df8-4a70-929a-ac5ed468e348'),
            ),
            // icon: Icon(Icons.favorite)),
            subtitleText: 'Make sure to till your Land well before planting to reduce GLS effects.',
            // icon: Icon(Icons.favorite)),
          ),

          GFListTile(
            avatar: GFAvatar(
              shape: GFAvatarShape.standard,
              backgroundImage: CachedNetworkImageProvider('https://firebasestorage.googleapis.com/v0/b/kilimo-salama.appspot.com/o/images%2Fintercropping.jpg?alt=media&token=f9b76584-e38b-49cd-ac63-e4a04275da24')
            ),
            // icon: Icon(Icons.favorite)),
            subtitleText: 'Rotation to crops other than Maize for at least one year in low risk fields may minimize the severity of GLS.',
            // icon: Icon(Icons.favorite)),
          ),
        ],
      ),
    );
  }



    Widget _treatment() {
    return Container(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 30,
          ),
          Center(
            child: Text(
              'Treatment(Chemical)',
              style: GoogleFonts.aBeeZee(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),

          GFListTile(
            // icon: Icon(Icons.favorite)),
            subtitleText: 'Under high disease pressure, timely fungicide applications can greatly minimize impact on yield. These applications are costly and usually only practical when disease pressure is high',
            // icon: Icon(Icons.favorite)),
          ),
        ],
      ),
    );
  }
  

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.greenAccent[700],
          title: Text(
            'Gray Leaf Spot(GLS)',
          ),
          centerTitle: true,
          bottom: TabBar(indicatorColor: Colors.greenAccent, tabs: <Widget>[
            Tab(
              text: 'About',
            ),
            Tab(
              text: 'Prevention',
            ),
            Tab(
              text: 'Treatment',
            ),
          ]),
        ),
        body: TabBarView(
          children: <Widget>[
            Container(child: _about()),
            Container(child: _preventive()),
            Container(child: _treatment()),
          ],
        ),
      ),
    );
  }
}
