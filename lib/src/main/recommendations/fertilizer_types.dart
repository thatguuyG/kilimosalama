import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';

class FertilizerTypesPage extends StatefulWidget {
  FertilizerTypesPage({Key key}) : super(key: key);

  @override
  _FertilizerTypesPageState createState() => _FertilizerTypesPageState();
}

class _FertilizerTypesPageState extends State<FertilizerTypesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent[700],
        title: Text(
          'Fertilizer Types',
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            GFCard(
              elevation: 5.0,
              content: Column(
                children: <Widget>[
                  SizedBox(
                    height: 500.0,
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          Center(
                            child: Image(
                              image: CachedNetworkImageProvider(
                                  'https://firebasestorage.googleapis.com/v0/b/kilimosalama-1.appspot.com/o/images%2Ffertilizer_types.png?alt=media&token=b9fb5570-b749-4b9d-a4e2-32616982bdb2'),
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Text(
                              'Based on Your Soil Status, we recommend the following actions;')
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
