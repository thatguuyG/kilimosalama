import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'cutworm.dart';

class EarlyPestsPage extends StatefulWidget {
  EarlyPestsPage({Key key}) : super(key: key);

  @override
  _EarlyPestsPageState createState() => _EarlyPestsPageState();
}

class _EarlyPestsPageState extends State<EarlyPestsPage> {
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
        child: Column(
          children: <Widget>[
            Column(
              children: <Widget>[
                SizedBox(
                  
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
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
                              'Monitor your Farm for pests and diseases',
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
                              'Diseases and pests are largely responsible for the low maize yields, however, the incidence and severity vary between seasons. Integrated pest and disease management is recommended',
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
                              'Monitor for the following',
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
                            child: Text(
                              'At this early stage of germination, you might be faced with the following pests and diseases;',
                              style: GoogleFonts.aBeeZee(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        GFListTile(
                          avatar: GFAvatar(
                            size: GFSize.LARGE,
                            backgroundImage: CachedNetworkImageProvider(
                                'https://firebasestorage.googleapis.com/v0/b/kilimo-salama.appspot.com/o/images%2Fcutworm.jpg?alt=media&token=ecadba3b-db63-4e7e-985a-2365acd33429'),
                            shape: GFAvatarShape.standard,
                          ),
                          titleText: 'Cutworm',
                          subtitleText:
                              'View Control and Treatment',
                          icon: IconButton(
                            icon: Icon(Icons.arrow_forward_ios),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          CutWormPage()));
                            },
                          ),
                        ),
                      ],
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
