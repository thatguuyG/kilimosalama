import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:getflutter/components/avatar/gf_avatar.dart';
import 'package:getflutter/components/list_tile/gf_list_tile.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';
import 'dart:io';
import 'advice/blight.dart';
import 'advice/rust.dart';
import 'advice/gray_leaf.dart';

class ResultPage extends StatefulWidget {
  ResultPage({Key key}) : super(key: key);

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  List _outputs;
  File _image;
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    _loading = true;

    loadModel().then((value) {
      setState(() {
        _loading = false;
      });
    });
  }

  loadModel() async {
    await Tflite.loadModel(
      model: "assets/model_unquant.tflite",
      labels: "assets/labels.txt",
      numThreads: 1,
    );
  }

  classifyImage(File image) async {
    var output = await Tflite.runModelOnImage(
        path: image.path,
        imageMean: 0.0,
        imageStd: 255.0,
        numResults: 2,
        threshold: 0.2,
        asynch: true);
    setState(() {
      _loading = false;
      _outputs = output;
    });
  }

  @override
  void dispose() {
    Tflite.close();
    super.dispose();
  }

  pickImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (image == null) return null;
    setState(() {
      _loading = true;
      _image = image;
    });
    classifyImage(_image);
  }

  Widget _healthCheck() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Click below to Upload your Image',
            style: GoogleFonts.aBeeZee(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          _loading
              ? Container(
                  height: 300,
                  width: 50,
                )
              : Container(
                  margin: EdgeInsets.all(20),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      _image == null ? Container() : Image.file(_image),
                      SizedBox(
                        height: 20,
                      ),
                      _image == null
                          ? Container()
                          : _outputs != null
                              ? Text(
                                  _outputs[0]["label"],
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 20),
                                )
                              : Container(child: Text(""))
                    ],
                  ),
                ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          FloatingActionButton(
            tooltip: 'Pick Image',
            onPressed: pickImage,
            child: Icon(
              Icons.add_a_photo,
              size: 20,
              color: Colors.white,
            ),
            backgroundColor: Colors.greenAccent[700],
          ),
        ],
      ),
    );
  }

  Widget _advicePage() {
    return Column(
      children: <Widget>[
        Container(
            child: GFListTile(
          avatar: GFAvatar(
            radius: 35,
            backgroundImage: CachedNetworkImageProvider('https://firebasestorage.googleapis.com/v0/b/kilimo-salama.appspot.com/o/images%2Fcommon_rust.jpg?alt=media&token=3d63a5a8-aadb-42c4-92e3-c2981904cc12'),
          ),
          subtitleText: 'Common Rust',
          icon: IconButton(
            icon: Icon(Icons.arrow_forward),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => RustPage()));
            },
          ),
        )),
        Container(
            child: GFListTile(
          avatar: GFAvatar(
            radius: 35,
            backgroundImage:CachedNetworkImageProvider('https://firebasestorage.googleapis.com/v0/b/kilimo-salama.appspot.com/o/images%2Fgray_leaf_spot.jpg?alt=media&token=c554aea9-8e3d-4e9f-a3f6-0ca38e5fff51')
          ),
          subtitleText: 'Gray Leaf Spot',
          icon: IconButton(
            icon: Icon(Icons.arrow_forward),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => GrayLeaf()));
            },
          ),
        )),
        Container(
            child: GFListTile(
          avatar: GFAvatar(
            radius: 35,
            backgroundImage:
                CachedNetworkImageProvider('https://firebasestorage.googleapis.com/v0/b/kilimo-salama.appspot.com/o/images%2Fnorthern_leaf_blight.jpg?alt=media&token=d90c9822-1435-47e3-91f4-96c9701980a6')
          ),
          subtitleText: 'Northern Leaf Blight',
          icon: IconButton(
            icon: Icon(Icons.arrow_forward),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => NorthernBlight()));
            },
          ),
        )),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.greenAccent[700],
          title: Text(
            'Plant Health',
          ),
          centerTitle: true,
          bottom: TabBar(indicatorColor: Colors.greenAccent, tabs: <Widget>[
            Tab(
              text: 'Get status',
            ),
            Tab(
              text: 'Advice',
            ),
          ]),
        ),
        body: TabBarView(
          children: <Widget>[
            Container(child: _healthCheck()),
            Container(child: _advicePage()),
          ],
        ),
      ),
    );
  }
}
