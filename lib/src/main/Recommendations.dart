import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:getflutter/components/avatar/gf_avatar.dart';
import 'package:getflutter/getflutter.dart';
import 'recommendations/irrigation_early.dart';
import 'recommendations/field_preparation.dart';
import 'recommendations/maize_varieties_early.dart';
import 'recommendations/intercropping.dart';
import 'recommendations/early_pests.dart';
import 'recommendations/vegetative_pests.dart';
import 'recommendations/vegetative_fertilizers.dart';
import 'recommendations/flowering_fertilizer.dart';
import 'recommendations/flowering_irrigation.dart';
import 'recommendations/flowering_diseases.dart';
import 'recommendations/preparation.dart';
import 'recommendations/storage.dart';


class RecommendationsPage extends StatefulWidget {
  RecommendationsPage({Key key}) : super(key: key);

  @override
  _RecommendationsPageState createState() => _RecommendationsPageState();
}

class _RecommendationsPageState extends State<RecommendationsPage> {
  // List<Widget> containers = [

  // ];

  Widget _earlyStages() {
    return Container(
      child: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
               GFListTile(
                avatar: GFAvatar(
                  size: GFSize.LARGE,
                  backgroundImage:
                      CachedNetworkImageProvider('https://firebasestorage.googleapis.com/v0/b/kilimo-salama.appspot.com/o/images%2Ffield_preparation.jpg?alt=media&token=52f09daf-93c5-40ea-92d9-cf38b0d0bd52'),
                  shape: GFAvatarShape.standard,
                ),
                titleText: 'Field Preparation',
                subtitleText: 'Prepare your land for maximum yields.',
                icon: IconButton(
                  icon: Icon(Icons.arrow_forward_ios),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FieldPreparationPage()));
                  },
                ),
              ),
               SizedBox(
                height: 20.0,
              ),
              GFListTile(
                avatar: GFAvatar(
                  size: GFSize.LARGE,
                  backgroundImage:
                     CachedNetworkImageProvider('https://firebasestorage.googleapis.com/v0/b/kilimo-salama.appspot.com/o/images%2Firrigation_methods.jpg?alt=media&token=56811758-8926-468f-9d8e-42d1853ca909'),
                  shape: GFAvatarShape.standard,
                ),
                titleText: 'Irrigation',
                subtitleText: 'Learn how best to irrigate your plants.',
                icon: IconButton(
                  icon: Icon(Icons.arrow_forward_ios),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => IrrigationEarlyPage()));
                  },
                ),
              ),     
              SizedBox(
                height: 20.0,
              ),
              GFListTile(
                avatar: GFAvatar(
                  size: GFSize.LARGE,
                  backgroundImage:
                      CachedNetworkImageProvider('https://firebasestorage.googleapis.com/v0/b/kilimo-salama.appspot.com/o/images%2Fintercropping.jpg?alt=media&token=f9b76584-e38b-49cd-ac63-e4a04275da24'),
                  shape: GFAvatarShape.standard,
                ),
                titleText: 'Intercropping',
                subtitleText: 'Maximize your outputs by intercropping.',
                icon: IconButton(
                  icon: Icon(Icons.arrow_forward_ios),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => IntercroppingPage()));
                  },
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              GFListTile(
                avatar: GFAvatar(
                  size: GFSize.LARGE,
                  backgroundImage:
                      CachedNetworkImageProvider('https://firebasestorage.googleapis.com/v0/b/kilimo-salama.appspot.com/o/images%2Fcrop_breed.jpg?alt=media&token=4f0f1b52-9b02-409c-8c63-a78ab44f1007'),
                  shape: GFAvatarShape.standard,
                ),
                titleText: 'Maize Varieties',
                subtitleText: 'Get the best varieties for your land.',
                icon: IconButton(
                  icon: Icon(Icons.arrow_forward_ios),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MaizeVarietiesPage()));
                  },
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              GFListTile(
                avatar: GFAvatar(
                  size: GFSize.LARGE,
                  backgroundImage:
                      CachedNetworkImageProvider('https://firebasestorage.googleapis.com/v0/b/kilimo-salama.appspot.com/o/images%2Fpests_and_diseases.jpg?alt=media&token=3e2ebc90-4724-472d-93ea-be46b11dd01b'),
                  shape: GFAvatarShape.standard,
                ),
                titleText: 'Pests and Diseases',
                subtitleText: 'Find the best treatments for early pests and diseases.',
                icon: IconButton(
                  icon: Icon(Icons.arrow_forward_ios),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EarlyPestsPage()));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _vegetativeStage() {
    return Container(
      child: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              GFListTile(
                avatar: GFAvatar(
                  size: GFSize.LARGE,
                  backgroundImage:
                     CachedNetworkImageProvider('https://firebasestorage.googleapis.com/v0/b/kilimo-salama.appspot.com/o/images%2Ffertilizer_types.png?alt=media&token=f403ad7d-7a48-42fc-9155-847df8529626'),
                  shape: GFAvatarShape.standard,
                ),
                titleText: 'Fertilization',
                subtitleText: 'Nitrogen Split Fertilization at 6 and 10 leaves.',
                icon: IconButton(
                  icon: Icon(Icons.arrow_forward_ios),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => VegetativeFertilizersPage()));
                  },
                ),
              ), 
              SizedBox(
                height: 20.0,
              ),
              GFListTile(
                avatar: GFAvatar(
                  size: GFSize.LARGE,
                  backgroundImage:
                     CachedNetworkImageProvider('https://firebasestorage.googleapis.com/v0/b/kilimo-salama.appspot.com/o/images%2Fpests_and_diseases.jpg?alt=media&token=3e2ebc90-4724-472d-93ea-be46b11dd01b'),
                  shape: GFAvatarShape.standard,
                ),
                titleText: 'Pests and Diseases',
                subtitleText: 'Look out for pests and diseases at this stage',
                icon: IconButton(
                  icon: Icon(Icons.arrow_forward_ios),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => VegetativePestsPage()));
                  },
                ),
              ), 
            ],
          ),
        ),
      ),
    );
  }

  Widget _floweringStage() {
    return Container(
      child: Container(
          child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            GFListTile(
                avatar: GFAvatar(
                  size: GFSize.LARGE,
                  backgroundImage:
                     CachedNetworkImageProvider('https://firebasestorage.googleapis.com/v0/b/kilimo-salama.appspot.com/o/images%2Ffertilizer_types.png?alt=media&token=f403ad7d-7a48-42fc-9155-847df8529626'),
                  shape: GFAvatarShape.standard,
                ),
                titleText: 'Fertilization',
                subtitleText: 'Give your plants the nutrients it needs to flower',
                icon: IconButton(
                  icon: Icon(Icons.arrow_forward_ios),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FloweringFertilizerPage()));
                  },
                ),
              ),
            SizedBox(
              height: 20.0,
            ),
             GFListTile(
                avatar: GFAvatar(
                  size: GFSize.LARGE,
                  backgroundImage:
                     CachedNetworkImageProvider('https://firebasestorage.googleapis.com/v0/b/kilimo-salama.appspot.com/o/images%2Firrigation_methods.jpg?alt=media&token=56811758-8926-468f-9d8e-42d1853ca909'),
                  shape: GFAvatarShape.standard,
                ),
                titleText: 'Irrigation ',
                subtitleText: 'Water your plants during flowering.',
                icon: IconButton(
                  icon: Icon(Icons.arrow_forward_ios),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FloweringIrrigationPage()));
                  },
                ),
              ),
            SizedBox(
              height: 20.0,
            ),
            GFListTile(
                avatar: GFAvatar(
                  size: GFSize.LARGE,
                  backgroundImage:
                     CachedNetworkImageProvider('https://firebasestorage.googleapis.com/v0/b/kilimo-salama.appspot.com/o/images%2Fpests_and_diseases.jpg?alt=media&token=3e2ebc90-4724-472d-93ea-be46b11dd01b'),
                  shape: GFAvatarShape.standard,
                ),
                titleText: 'Diseases',
                subtitleText: 'Look out for pests and diseases during flowering.',
                icon: IconButton(
                  icon: Icon(Icons.arrow_forward_ios),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FloweringDiseasesPage()));
                  },
                ),
              ), 
          ],
        ),
      )),
    );
  }

  Widget _postHarvestStage(){
     return Container(
      child: Container(
          child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            GFListTile(
                avatar: GFAvatar(
                  size: GFSize.LARGE,
                  backgroundImage:
                     CachedNetworkImageProvider('https://firebasestorage.googleapis.com/v0/b/kilimo-salama.appspot.com/o/images%2Fdrying_maize.jpg?alt=media&token=2533a07f-880c-4c1e-b12a-d406b159dcc4'),
                  shape: GFAvatarShape.standard,
                ),
                titleText: 'Preparation',
                subtitleText: 'Prepare your harvest well for storage.',
                icon: IconButton(
                  icon: Icon(Icons.arrow_forward_ios),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PreparationPage()));
                  },
                ),
              ),
            SizedBox(
              height: 20.0,
            ),
             GFListTile(
                avatar: GFAvatar(
                  size: GFSize.LARGE,
                  backgroundImage:
                     CachedNetworkImageProvider('https://firebasestorage.googleapis.com/v0/b/kilimo-salama.appspot.com/o/images%2Fmaize_storage.jpg?alt=media&token=0119ea48-b3d6-4407-833d-719460c5ca7a'),
                  shape: GFAvatarShape.standard,
                ),
                titleText: 'Storage',
                subtitleText: 'Learn the best maize storage conditions.',
                icon: IconButton(
                  icon: Icon(Icons.arrow_forward_ios),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => StoragePage()));
                  },
                ),
              ),
            SizedBox(
              height: 20.0,
            ),
          ],
        ),
      )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.greenAccent[700],
          title: Text(
            'Recommendations',
          ),
          centerTitle: true,
          bottom: TabBar(indicatorColor: Colors.greenAccent, 
          isScrollable: true,
          tabs: <Widget>[
            Tab(
              text: 'Early Stages',
            ),
            Tab(
              text: 'Vegetative Stage',
            ),
            Tab(
              text: 'Flowering Stage',
            ),
            Tab(
              text: 'Post Harvest',
            ),
          ]),
        ),
        body: TabBarView(
          children: <Widget>[
            Container(child: _earlyStages()),
            Container(child: _vegetativeStage()),
            Container(child: _floweringStage()),
            Container(child: _postHarvestStage()),
          ],
        ),
      ),
    );
  }
}
