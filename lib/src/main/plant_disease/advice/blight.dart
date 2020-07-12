import 'package:flutter/material.dart';
import 'package:getflutter/components/avatar/gf_avatar.dart';
import 'package:getflutter/components/image/gf_image_overlay.dart';
import 'package:getflutter/components/list_tile/gf_list_tile.dart';
import 'package:getflutter/shape/gf_avatar_shape.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';

class NorthernBlight extends StatefulWidget {
  NorthernBlight({Key key}) : super(key: key);

  @override
  _NorthernBlightState createState() => _NorthernBlightState();
}




class _NorthernBlightState extends State<NorthernBlight> {

  Widget _about() {
    return Column(children: <Widget>[
      Center(
          child: GFImageOverlay(
              height: 200,
              width: 200,
              shape: BoxShape.circle,
              image: CachedNetworkImageProvider('https://firebasestorage.googleapis.com/v0/b/kilimo-salama.appspot.com/o/images%2Fnorthern_leaf_blight.jpg?alt=media&token=d90c9822-1435-47e3-91f4-96c9701980a6'),)),
      SizedBox(
        height: 20.0,
      ),
      Center(
        child: Text(
          'Northern Leaf Blight',
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
              'Northern Leaf Blight  is a Fungal disease caused by Exserohilum turcicum pathogen. It is favored by   heavy dews, frequent showers, high humidity and moderate temperatures.',
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
            subtitleText: 'Treating northern leaf blight involves using fungicides. For most home gardeners this step isn’t needed, but if you have a bad infection, you may want to try this chemical treatment. The infection usually begins around the time of silking, and this is when the fungicide should be applied.'
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
            'Northern Leaf Blight',
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