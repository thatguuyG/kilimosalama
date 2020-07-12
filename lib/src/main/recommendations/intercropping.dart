import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:getflutter/getflutter.dart';
import 'package:google_fonts/google_fonts.dart';

class IntercroppingPage extends StatefulWidget {
  IntercroppingPage({Key key}) : super(key: key);

  @override
  _IntercroppingPageState createState() => _IntercroppingPageState();
}

class _IntercroppingPageState extends State<IntercroppingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent[700],
        title: Text(
          'Intercropping',
        ),
        centerTitle: true,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              GFImageOverlay(
                height: 200,
                width: 350,
                image: CachedNetworkImageProvider(
                    'https://firebasestorage.googleapis.com/v0/b/kilimo-salama.appspot.com/o/images%2Fintercropping.jpg?alt=media&token=f9b76584-e38b-49cd-ac63-e4a04275da24'),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                width: 320,
                child: Center(
                  child: Text(
                    'Choose the correct Crops to Intercrop with your maize',
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
                    'If intercropping, the choice of the legume intercrop should be based on presence of soil and climatic conditions that meet the requirements of both maize and the legume of choice. ',
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
                    'What to do for your Maize',
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
                  child: Text(
                    'Legumes are an Important part of smallholder farming. They provide a highly nutritious source of high-protein food, have higher value than maize, and increase the fertility of your soil.',
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
              Container(
                width: 320,
                child: Center(
                  child: Text(
                    'Mbili Mbili System',
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
                  child: Text(
                    'This is where two rows of maize are followed by two rows of the legume species. This increased spacing reduces amount of shading on the legume rows. Utilizing the Mbili mbili system increases productivity.',
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
              Container(
                width: 400,
                child: Center(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: SingleChildScrollView(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: DataTable(
                          sortColumnIndex: 0,
                          sortAscending: true,
                          columns: [
                            DataColumn(
                              label: Text(
                                'Selection\n Criteria',
                                style: GoogleFonts.aBeeZee(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.green[900],
                                ),
                              ),
                              numeric: true,
                            ),
                            DataColumn(
                              label: Text(
                                  'Yield',
                                  style: GoogleFonts.aBeeZee(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.green[900],
                                  ),
                                ),
                              numeric: true,
                            ),
                          ],
                          rows: [
                            DataRow(selected: true, cells: [
                              DataCell(Text('Common bean')),
                              DataCell(Text('800	kg/acre')),
                            ]),
                            DataRow(selected: true, cells: [
                              DataCell(Text('Soybean')),
                              DataCell(Text('2000kg/acre')),
                            ]),
                            DataRow(selected: true, cells: [
                              DataCell(Text('Groundnuts')),
                              DataCell(Text('1000ks/acre')),
                            ]),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
