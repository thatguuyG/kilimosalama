import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:getflutter/components/image/gf_image_overlay.dart';
import 'package:getflutter/components/list_tile/gf_list_tile.dart';
import 'package:getflutter/getflutter.dart';
import 'package:google_fonts/google_fonts.dart';

class RustPage extends StatefulWidget {
  RustPage({Key key}) : super(key: key);

  @override
  _RustPageState createState() => _RustPageState();
}

class _RustPageState extends State<RustPage> {
  Widget _about() {
    return Column(children: <Widget>[
      Center(
          child: GFImageOverlay(
              height: 200,
              width: 200,
              shape: BoxShape.circle,
              image: CachedNetworkImageProvider('https://firebasestorage.googleapis.com/v0/b/kilimo-salama.appspot.com/o/images%2Fcommon_rust.jpg?alt=media&token=3d63a5a8-aadb-42c4-92e3-c2981904cc12'),
              )),
      SizedBox(
        height: 20.0,
      ),
      Center(
        child: Text(
          'Common Rust',
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
              'Common rust is a Fungal disease caused by Puccinia sorghi pathogen. It is favored by  moist, cool conditions (temps in the 60s and 70s) and it spreads by windblown spores from southern corn growing areas',
              style: GoogleFonts.aBeeZee(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            )),
      ),
    ]);
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
              backgroundImage: CachedNetworkImageProvider('https://firebasestorage.googleapis.com/v0/b/kilimo-salama.appspot.com/o/images%2Fresistance.jpg?alt=media&token=2af965ff-0ae0-4968-86d9-6199607c7d9f'),
            ),
            // icon: Icon(Icons.favorite)),
            subtitleText: 'Make use of Plant resistant varieties available locally',
            // icon: Icon(Icons.favorite)),
          ),

          GFListTile(
            avatar: GFAvatar(
              shape: GFAvatarShape.standard,
              backgroundImage: CachedNetworkImageProvider('https://firebasestorage.googleapis.com/v0/b/kilimo-salama.appspot.com/o/images%2Fearly_plant.jpg?alt=media&token=068b3216-312f-4cb4-a90c-76ad2aaf92b6'),
            ),
            // icon: Icon(Icons.favorite)),
            subtitleText: 'Plant early to avoid optimal conditions for infection.',
            // icon: Icon(Icons.favorite)),
          ),

          GFListTile(
            avatar: GFAvatar(
              shape: GFAvatarShape.standard,
              backgroundImage: CachedNetworkImageProvider('https://firebasestorage.googleapis.com/v0/b/kilimo-salama.appspot.com/o/images%2Fmonitor.jpg?alt=media&token=99cc3f17-7438-49ce-8901-0776d3d373bb'),
            ),
            // icon: Icon(Icons.favorite)),
            subtitleText: 'Monitor your crop regularly for signs of the disease, even more so during overcast weather(Cloudy Weather).',
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
              'Treatment',
              style: GoogleFonts.aBeeZee(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),

          GFListTile(
            // icon: Icon(Icons.favorite)),
            subtitleText: 'There are currently no Biological Treatment Controls for this disease. We recommend use of preventive measures together with any available Chemical controls',
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
            'Common Rust',
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
