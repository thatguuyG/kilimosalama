import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';
import 'package:google_fonts/google_fonts.dart';
import '../plant_disease/advice/charcoal.dart';
import '../plant_disease/advice/blight.dart';

class FloweringDiseasesPage extends StatefulWidget {
  FloweringDiseasesPage({Key key}) : super(key: key);

  @override
  _FloweringDiseasesPageState createState() => _FloweringDiseasesPageState();
}

class _FloweringDiseasesPageState extends State<FloweringDiseasesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent[700],
        title: Text(
          'Pests and Diseases',
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
                    'https://firebasestorage.googleapis.com/v0/b/kilimo-salama.appspot.com/o/images%2Fpests_and_diseases.jpg?alt=media&token=3e2ebc90-4724-472d-93ea-be46b11dd01b'),
              ),
              SizedBox(
                height: 20.0,
              ),

              Container(
                width: 320,
                child: Center(
                  child: Text(
                    'The following diseases may appear during Flowering stage of growth of your maize.',
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
              GFListTile(
                avatar: GFAvatar(
                  size: GFSize.LARGE,
                  backgroundImage: CachedNetworkImageProvider(
                      'https://firebasestorage.googleapis.com/v0/b/kilimo-salama.appspot.com/o/images%2Fcharcoal.jpg?alt=media&token=ad285c83-321b-46ee-8dc5-f37330f99470'),
                  shape: GFAvatarShape.standard,
                ),
                titleText: 'Charcoal Rot ',
                icon: IconButton(
                  icon: Icon(Icons.arrow_forward_ios),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CharcoalPage()));
                  },
                ),
              ),

              SizedBox(height: 20,),

              GFListTile(
                avatar: GFAvatar(
                  size: GFSize.LARGE,
                  backgroundImage:
                     CachedNetworkImageProvider('https://firebasestorage.googleapis.com/v0/b/kilimo-salama.appspot.com/o/images%2Fnorthern_leaf_blight.jpg?alt=media&token=d90c9822-1435-47e3-91f4-96c9701980a6'),
                  shape: GFAvatarShape.standard,
                ),
                titleText: 'Northern Leaf Blight',
                icon: IconButton(
                  icon: Icon(Icons.arrow_forward_ios),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NorthernBlight()));
                  },
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
