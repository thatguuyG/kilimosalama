import 'package:flutter/material.dart';

class Soil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
