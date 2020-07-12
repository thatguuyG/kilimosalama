import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:getflutter/getflutter.dart';
import 'result.dart';

class InstrucPage extends StatefulWidget {
  InstrucPage({Key key}) : super(key: key);

  @override
  _InstrucPageState createState() => _InstrucPageState();
}

class _InstrucPageState extends State<InstrucPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent[700],
        title: Text(
          'Instructions',
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
                child: Text(
              'This consists of 3 steps',
              style: GoogleFonts.aBeeZee(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            )),

            //instruction 1 here
            GFCard(
              boxFit: BoxFit.cover,
              imageOverlay: CachedNetworkImageProvider('https://firebasestorage.googleapis.com/v0/b/kilimo-salama.appspot.com/o/images%2Finstructions1.jpg?alt=media&token=f9c4c676-601b-4f44-b5d7-3c10377c8d8a'),
              title: GFListTile(
                title: Text(
                  'Step 1',
                  style: GoogleFonts.aBeeZee(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
              content: Text(
                "Take a picture of Your Plant ",
                style: GoogleFonts.aBeeZee(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),

            //instruction 2 here
            GFCard(
              boxFit: BoxFit.cover,
              imageOverlay: CachedNetworkImageProvider('https://firebasestorage.googleapis.com/v0/b/kilimo-salama.appspot.com/o/images%2Finstruction2.jpg?alt=media&token=d1557bb3-5506-4480-af84-51d07e77ce72'),
              title: GFListTile(
                title: Text(
                  'Step 2',
                  style: GoogleFonts.aBeeZee(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
              content: Text(
                "Upload your Image",
                style: GoogleFonts.aBeeZee(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),

            //instruction 3 here
            GFCard(
              boxFit: BoxFit.cover,
              imageOverlay: CachedNetworkImageProvider('https://firebasestorage.googleapis.com/v0/b/kilimo-salama.appspot.com/o/images%2Finstruction3.jpg?alt=media&token=b7bdb8ed-3acf-4aec-9918-9f1a465971ca'),
              title: GFListTile(
                title: Text(
                  'Step 3',
                  style: GoogleFonts.aBeeZee(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
              content: Text(
                "Find out the health status of your Plants. Get Recommendations",
                style: GoogleFonts.aBeeZee(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),

            Container(
              height: 50,
              child: GFButton(
                color: Colors.greenAccent[700],
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ResultPage()));
                },
                text: "Get Plant Health",
                size: GFSize.LARGE,
                blockButton: true,
                icon: Icon(Icons.camera_enhance),
              ),
            ),

            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
