import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';
import 'package:google_fonts/google_fonts.dart';

class IrrigationEarlyPage extends StatefulWidget {
  IrrigationEarlyPage({Key key}) : super(key: key);

  @override
  _IrrigationEarlyPageState createState() => _IrrigationEarlyPageState();
}



class _IrrigationEarlyPageState extends State<IrrigationEarlyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent[700],
        title: Text(
          'Early Stage Irrigation',
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // Image.asset('assets/images/irrigation_methods.jpg'),
            GFImageOverlay(
              height: 200,
              width: 350,
              image: CachedNetworkImageProvider(
                  'https://firebasestorage.googleapis.com/v0/b/kilimo-salama.appspot.com/o/images%2Firrigation_methods.jpg?alt=media&token=56811758-8926-468f-9d8e-42d1853ca909'),
            ),
            SizedBox(
              height: 20.0,
            ),

            Container(
              width: 320,
              child: Center(
                child: Text(
                  'Based on Your Soil Status, we recommend the following actions',
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

            SizedBox(height: 30),

            Center(
              child: Text(
                'Best Measures',
                style: GoogleFonts.aBeeZee(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
            ),

            SizedBox(
              height: 20,
            ),

            Container(
              width: 320,
              child: Center(
                child: Text(
                  'Growing maize on a large scale while facing unpredictable weather conditions or water scarcity is challenging.However, with drip irrigation, you can take full control of when water and nutrients are delivered to your crop.',
                  style: GoogleFonts.aBeeZee(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
            ),

            SizedBox(
              height: 20,
            ),

            Center(
              child: Text(
                'Drip Irrigation allows you to;',
                style: GoogleFonts.aBeeZee(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
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
                    '⏺ Maintain control over soil moisture and nutrient levels.',style: GoogleFonts.aBeeZee(
                  fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                ),),
                SizedBox(
                  height: 4.0,
                ),
                Text('⏺ Long lasting performance A subsurface drip irrigation system can last for up to 20 years.', style: GoogleFonts.aBeeZee(
                  fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                ),),
                SizedBox(
                  height: 4.0,
                ),
                Text(
                    '⏺ Increase the number of irrigated hectares which leads to a significant increase in annual yields.', style: GoogleFonts.aBeeZee(
                  fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                ),),
                SizedBox(
                  height: 4.0,
                ),
                Text('⏺ Effective Weed Control.Precise water delivery ensures minimal weed growth, reducing herbicide application costs.', style: GoogleFonts.aBeeZee(
                  fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                ),),
              ],
            )),
            ),


             Center(
              child: Text(
                'Maize Water Requirements',
                style: GoogleFonts.aBeeZee(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
            ),

            // DefaultTabController(
            //     length: 2,
            //     initialIndex: 0,
            //     child: Column(
            //       children: [
            //         TabBar(
            //             indicatorColor: Colors.greenAccent[700],
            //             labelColor: Colors.greenAccent[700],
            //             indicator: UnderlineTabIndicator(
            //                 borderSide: BorderSide(width: 5.0),
            //                 insets: EdgeInsets.symmetric(
            //                     horizontal: 16.0)),
            //             tabs: [
            //               Tab(
            //                 child: Text(
            //                   'PH Based',
            //                   style: GoogleFonts.aBeeZee(
            //                     fontSize: 18,
            //                     fontWeight: FontWeight.w700,
            //                     color: Colors.black,
            //                   ),
            //                 ),
            //               ),
            //               Tab(
            //                 child: Text(
            //                   ' Moisture Based',
            //                   style: GoogleFonts.aBeeZee(
            //                     fontSize: 18,
            //                     fontWeight: FontWeight.w700,
            //                     color: Colors.black,
            //                   ),
            //                 ),
            //               )
            //             ]),
            //         Container(
            //             height: 300.0,
            //             child: TabBarView(
            //               children: [
            //                 GFCard(
            //                   boxFit: BoxFit.cover,
            //                   content: Column(
            //                     children: <Widget>[
            //                       Text(
            //                           'Your Soil PH appears to be very acidic. We therefore recommend the following actions:'),
            //                       Container(
            //                           child: new ListTile(
            //                         leading: new MyBullet(),
            //                         title: new Text(
            //                             'First Recommendation. '),
            //                       )),
            //                       Container(
            //                           child: new ListTile(
            //                         leading: new MyBullet(),
            //                         title: new Text(
            //                             'Second Recommendation'),
            //                       )),
            //                       Container(
            //                           child: new ListTile(
            //                         leading: new MyBullet(),
            //                         title: new Text(
            //                             'First Recommendation'),
            //                       )),
            //                     ],
            //                   ),
            //                 ),
            //                 GFCard(
            //                   boxFit: BoxFit.cover,
            //                   content: Column(
            //                     children: <Widget>[
            //                       Text(
            //                           'Your Soil PH appears to be very acidic. We therefore recommend the following actions:'),
            //                       Container(
            //                           child: new ListTile(
            //                         leading: new MyBullet(),
            //                         title: new Text(
            //                             'First Recommendation. '),
            //                       )),
            //                       Container(
            //                           child: new ListTile(
            //                         leading: new MyBullet(),
            //                         title: new Text(
            //                             'Second Recommendation'),
            //                       )),
            //                       Container(
            //                           child: new ListTile(
            //                         leading: new MyBullet(),
            //                         title: new Text(
            //                             'First Recommendation'),
            //                       )),
            //                     ],
            //                   ),
            //                 ),
            //               ],
            //             ))
            //       ],
            //     )),
          ],
        ),
      ),
    );
  }
}
