import 'package:flutter/material.dart';
import 'package:getflutter/components/avatar/gf_avatar.dart';
import 'package:getflutter/components/image/gf_image_overlay.dart';
import 'package:getflutter/components/list_tile/gf_list_tile.dart';
import 'package:getflutter/shape/gf_avatar_shape.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';


class CharcoalPage extends StatefulWidget {
  CharcoalPage({Key key}) : super(key: key);

  @override
  _CharcoalPageState createState() => _CharcoalPageState();
}

class _CharcoalPageState extends State<CharcoalPage> {
  Widget _about() {
    return Column(children: <Widget>[
      Center(
          child: GFImageOverlay(
              height: 200,
              width: 200,
              shape: BoxShape.circle,
              image: CachedNetworkImageProvider('https://firebasestorage.googleapis.com/v0/b/kilimo-salama.appspot.com/o/images%2Fcharcoal.jpg?alt=media&token=ad285c83-321b-46ee-8dc5-f37330f99470'),)),
      SizedBox(
        height: 20.0,
      ),
      Center(
        child: Text(
          'Charcoal Rot',
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
              'Charcoal rot is prevalent in comparatively drier maize growing areas.The disease development is maximum during grain filling stage and is favoured by warm temperature (30-400C) and low soil moisture.',
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
              'Management Measures',
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
              backgroundImage: CachedNetworkImageProvider('https://firebasestorage.googleapis.com/v0/b/kilimo-salama.appspot.com/o/images%2Fintercropping.jpg?alt=media&token=f9b76584-e38b-49cd-ac63-e4a04275da24'),
            ),
            subtitleText: 'Crop rotation  can sometimes decrease the amount of the pathogen in the soil. To prevent the pathogen increasing crops used in rotation shouldn’t be hosts of the pathogen,',
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
            subtitleText: 'increasing planting densities. This creates an unfavourable environment for the pathogen by producing more shade, keeping soil temperatures low ',
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

          Container(
              width: 320,
              child: Center(
                child: Column(
              children: <Widget>[
                Text(
                    '⏺ Regular irrigations particularly during flowering time should be provided.',style: GoogleFonts.aBeeZee(
                  fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                ),),
                SizedBox(
                  height: 4.0,
                ),
                Text('⏺ Use resistant varieties like DHM 103, Ganga Safed - 2 and avoid sowing of suceptable varieties like DHM 105.', style: GoogleFonts.aBeeZee(
                  fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                ),),
                SizedBox(
                  height: 4.0,
                ),
                Text(
                    '⏺ Seed treatment with Carbendazim or Thiram 3g/kg seed is effective.', style: GoogleFonts.aBeeZee(
                  fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                ),),
                SizedBox(
                  height: 4.0,
                ),
                Text('⏺ Field sanitation, crop rotation should be followed.', style: GoogleFonts.aBeeZee(
                  fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                ),),
              ],
            )),
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
            'Charcoal Rot',
          ),
          centerTitle: true,
          bottom: TabBar(indicatorColor: Colors.greenAccent, tabs: <Widget>[
            Tab(
              text: 'About',
            ),
            Tab(
              text: 'Management',
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