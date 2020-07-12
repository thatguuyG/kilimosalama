

import 'package:flutter/material.dart';
// import 'package:getflutter/components/card/gf_card.dart';
// import 'package:getflutter/getflutter.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:getflutter/types/gf_button_type.dart';
import '../soil/today_page.dart';
import '../soil/last_test.dart';

class SoilReportPage extends StatefulWidget {
  SoilReportPage({Key key}) : super(key: key);

  @override
  _SoilReportState createState() => _SoilReportState();
}

class _SoilReportState extends State<SoilReportPage> {
List list = List();
var isLoading = false;

  
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.greenAccent[700],
            title: Text(
              'Soil Reports',
            ),
            centerTitle: true,
            bottom: TabBar(indicatorColor: Colors.greenAccent, tabs: <Widget>[
              Tab(
                text: 'Today',
              ),
              Tab(
                text: 'Last Test',
              ),
            ]),
          ),
          body: TabBarView(
            children: <Widget>[
              //1st page(Today)
              TodayPage(),
              LastTestPage(),
            ],
          ),
        ));
  }
}
