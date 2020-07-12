import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';
// import 'widgets/Soil.dart';

class TodayPage extends StatefulWidget {
  TodayPage({Key key}) : super(key: key);

  @override
  _TodayPageState createState() => _TodayPageState();
}

class _TodayPageState extends State<TodayPage> {
  List data;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: new FutureBuilder //*To get the data and display
            (
          future: DefaultAssetBundle.of(context).loadString(
              'local_json/person.json'), //*Data available in local storage
          builder: (context, snapshot) {
            var myData = json.decode(snapshot.data.toString());
            return new ListView.builder(
              //*Takes two inputs viz., itemBuilder and itemCount
              itemBuilder: (BuildContext context, int index) {
                return new Card(
                  child: new Column(
                    //?Should we display in a column?
                    crossAxisAlignment: CrossAxisAlignment
                        .stretch, //*Takes the right amount of screen to display
                    children: <Widget>[
                      DataTable(
                        sortColumnIndex: 0,
                        sortAscending: true,
                        columns: [
                          DataColumn(
                            label: Text('Attribute'),
                            numeric: true,
                          ),
                          DataColumn(
                            label: Text('Value'),
                            numeric: true,
                          ),
                        ],
                        rows: [
                          DataRow(selected: true, cells: [
                            DataCell(Text('Ph')),
                            DataCell(
                              new Text(myData[index]['ph']),
                            ),
                          ]),
                          DataRow(selected: true, cells: [
                            DataCell(Text('Moisture(%)')),
                            DataCell(
                              Text(myData[index]['moisture']),
                            ),
                          ]),
                          DataRow(selected: true, cells: [
                            DataCell(Text('Location')),
                            DataCell(Text('Machakos')),
                          ]),
                          DataRow(selected: true, cells: [
                            DataCell(Text('Breed')),
                            DataCell(
                              Text(myData[index]['breed']),
                            ),
                          ]),
                          DataRow(selected: true, cells: [
                            DataCell(Text('Maturity(Months)')),
                            DataCell(
                              Text(myData[index]['maturity']),
                            ),
                          ]),
                          DataRow(selected: true, cells: [
                            DataCell(Text('Predicted Yields(Bags)')),
                            DataCell(Text(myData[index]['predictedyield'])),
                          ]),
                        ],
                      ),

                      SizedBox(height: 15.0),
                      // GFButton(
                      //     color: Colors.greenAccent[700],
                      //     onPressed: () {},
                      //     text: "Fetch data"),

                      SizedBox(
                        height: 30.0,
                      ),
                      //title here
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                            text: '',
                            style: GoogleFonts.robotoSlab(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                            children: [
                              TextSpan(
                                text: 'Soil Status',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 30),
                              ),
                            ]),
                      ),
                      GFCard(
                        content: Table(
                          border:
                              TableBorder.all(width: 1.0, color: Colors.black),
                          children: [
                            TableRow(children: [
                              TableCell(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    new Text('PH'),
                                    new GFButton(
                                        onPressed: null,
                                        text: "Adequate",
                                        color: Colors.green,
                                        shape: GFButtonShape.pills,
                                        type: GFButtonType.solid)
                                  ],
                                ),
                              )
                            ]),
                            TableRow(children: [
                              TableCell(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    new Text('Organic Carbon'),
                                    new GFButton(
                                        onPressed: null,
                                        text: "High",
                                        color: Colors.red,
                                        shape: GFButtonShape.pills,
                                        type: GFButtonType.solid)
                                  ],
                                ),
                              )
                            ]),
                            TableRow(children: [
                              TableCell(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    new Text('Organic Nitrogen'),
                                    new GFButton(
                                        onPressed: null,
                                        text: "Adequate",
                                        color: Colors.green,
                                        shape: GFButtonShape.pills,
                                        type: GFButtonType.solid)
                                  ],
                                ),
                              )
                            ]),
                            TableRow(children: [
                              TableCell(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    new Text('Total Phosphorus'),
                                    new GFButton(
                                        onPressed: null,
                                        text: "High",
                                        color: Colors.red,
                                        shape: GFButtonShape.pills,
                                        type: GFButtonType.solid)
                                  ],
                                ),
                              )
                            ]),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
              itemCount: myData == null ? 0 : myData.length,
            );
          },
        ),
      ),
    );
  }
}
