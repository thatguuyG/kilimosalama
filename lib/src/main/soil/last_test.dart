import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';
import 'package:google_fonts/google_fonts.dart';


class LastTestPage extends StatefulWidget {
  LastTestPage({Key key}) : super(key: key);

  @override
  _LastTestPageState createState() => _LastTestPageState();
}

class _LastTestPageState extends State<LastTestPage> {
  @override
  Widget build(BuildContext context) {
 return Container(
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[

              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: SingleChildScrollView(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
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
                          DataCell(Text('4')),
                        ]),
                        DataRow(selected: true, cells: [
                          DataCell(Text('Moisture(%)')),
                          DataCell(Text('6')),
                        ]),
                        DataRow(selected: true, cells: [
                          DataCell(Text('Location')),
                          DataCell(Text('Machakos')),
                        ]),
                        DataRow(selected: true, cells: [
                          DataCell(Text('Breed')),
                          DataCell(Text('H627')),
                        ]),
                        DataRow(selected: true, cells: [
                          DataCell(Text('Maturity(Months)')),
                          DataCell(Text('7')),
                        ]),
                        DataRow(selected: true, cells: [
                          DataCell(Text('Predicted Yields(Bags)')),
                          DataCell(Text('22')),
                        ]),
                      ],
                    ),
                  ),
                ),
              ),
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
                        style: TextStyle(color: Colors.black, fontSize: 30),
                      ),
                    ]),
              ),
              GFCard(
                content: Table(
                  border: TableBorder.all(width: 1.0, color: Colors.black),
                  children: [
                    TableRow(children: [
                      TableCell(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
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
        ),
      ),
    );
  }
}