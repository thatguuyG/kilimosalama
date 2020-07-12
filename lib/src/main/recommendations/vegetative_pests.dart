import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';
import 'package:google_fonts/google_fonts.dart';
import '../plant_disease/advice/blight.dart';
import '../plant_disease/advice/rust.dart';


class VegetativePestsPage extends StatefulWidget {
  VegetativePestsPage({Key key}) : super(key: key);

  @override
  _VegetativePestsPageState createState() => _VegetativePestsPageState();
}

class _VegetativePestsPageState extends State<VegetativePestsPage> {
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
                  'The following diseases may appear during vegetative stage of growth of your maize',
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
                  'Rapid, uniform germination and emergence of maize help set the stage for maximum grain yield at the end of the season.\nUneven soil moisture at seed depth is the most frequent cause of uneven emergence, the results of which can easily be yield losses of 8 to 10 percent',
                  style: GoogleFonts.aBeeZee(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
            ),

            SizedBox(height: 20.0,),
             GFListTile(
                avatar: GFAvatar(
                  size: GFSize.LARGE,
                  backgroundImage:
                     CachedNetworkImageProvider('https://firebasestorage.googleapis.com/v0/b/kilimo-salama.appspot.com/o/images%2Fcommon_rust.jpg?alt=media&token=3d63a5a8-aadb-42c4-92e3-c2981904cc12'),
                  shape: GFAvatarShape.standard,
                ),
                titleText: 'Common Rust',
                icon: IconButton(
                  icon: Icon(Icons.arrow_forward_ios),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RustPage()));
                  },
                ),
              ),

              SizedBox(height: 20.0,),
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