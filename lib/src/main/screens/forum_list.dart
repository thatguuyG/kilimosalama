import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
// import 'package:getflutter/getflutter.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:kilimosalama/src/authentication.dart';
import 'package:kilimosalama/src/firestore.dart';
// import 'package:kilimosalama/src/main/models/user_model.dart';
// import 'package:provider/provider.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kilimosalama/src/main/models/Forum.dart';
import 'package:kilimosalama/src/main/screens/forum_screen.dart';
import 'package:kilimosalama/src/main/widgets/forum.dart';

class ForumListPage extends StatefulWidget {
  @override
  _ForumListPageState createState() => _ForumListPageState();
}

class _ForumListPageState extends State<ForumListPage> {


  var listForum;

   Widget _forumButton() {
    return Positioned(
      bottom: 5.0,
      right: 4.0,
      child: FloatingActionButton.extended(
        label: Text('Ask  \nCommunity'),
        icon: Icon(Icons.edit),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        tooltip: 'Forum',
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ForumPage()));
        },
      ),
    );
  }


   Widget _buildForumCard() {
    return  StreamBuilder<List<Forum>>(
      stream: FirestoreService(uid:uid).forums,
      builder: (context, snapshot) {
        if(snapshot.hasData){
          List<Forum> forums = snapshot.data;
          // forums.forEach((forum) {
          //   print(forum.description);
          //    });
        return ListView.builder(
          itemCount: forums.length ,
          itemBuilder: (context, index) =>
                   InkWell(
                      onTap: (){
                                 Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                  builder: (context) => ForumScreenPage(currentforum: forums[index])));
                                },
                                        child: Card(
                                    elevation: 5,
                                    child: Padding(
                                      padding: EdgeInsets.all(2),
                                      child: Column(
                                        children: <Widget>[
                                          new Stack(
                                            children: <Widget>[                         
                                                        Column(
                                                          children: <Widget>[
                                                            forums[index].imageUrl == ""
                                                            ? Container(
                                                              width: 0.0,
                                                              height: 0.0,
                                                            )
                                                            :
                                                            Container( 
                                                              child: 
                                                              Image(
                                                                      height: 120.0,
                                                                      width: double.maxFinite,
                                                                      image:  CachedNetworkImageProvider(
                                                                                forums[index].imageUrl
                                                                                // 'https://firebasestorage.googleapis.com/v0/b/kilimo-salama.appspot.com/o/images%2Fsoil.jpg?alt=media&token=503a3936-53cc-44d0-938c-e91959033155'
                                                                              ),
                                                                      fit: BoxFit.cover,
                                                                          ),
                                                                      ),
                                                            Container(
                                                              margin: EdgeInsets.fromLTRB(5,5,0,10),
                                                                  child: Row(
                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                  children: <Widget>[
                                                                    CircleAvatar(
                                                                      radius: 12.0,
                                                                      backgroundImage:  
                                                                        CachedNetworkImageProvider(
                                                                          forums[index].avatarUrl
                                                                          // 'https://firebasestorage.googleapis.com/v0/b/kilimo-salama.appspot.com/o/images%2Ffarmer_2.jpg?alt=media&token=52c10a79-983f-4760-b12d-f7bbb7236cb8'
                                                                        ),
                                                                    ),
                                                                    SizedBox(
                                                                      width: 5.0,
                                                                    ),
                                                                  Column(
                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                    children: <Widget>[
                                                                      Text(
                                                                          forums[index].username,
                                                                          textAlign: TextAlign.start,
                                                                          maxLines: 1,
                                                                          style: TextStyle(
                                                                            fontSize: 15.0, 
                                                                            fontWeight: FontWeight.bold,
                                                                            color: Colors.greenAccent[700]
                                                                            ),
                                                                        ),
                                                                        Text(
                                                                          DateFormat('dd MMM kk:mm')
                                                                            .format(
                                                                              DateTime.fromMillisecondsSinceEpoch(int.parse(forums[index].timestamp,)
                                                                              )
                                                                              ),
                                                                          
                                                                          textAlign: TextAlign.start,
                                                                          maxLines: 1,
                                                                          style: TextStyle(
                                                                            fontSize: 10.0, 
                                                                            color: Colors.grey,
                                                                            ),
                                                                        ),
                                                                    ],
                                                                  )
                                                              ]
                                                            ),
                                                                ),
                                                                Container(
                                                                  padding: EdgeInsets.all(5),
                                                                  child: Row(
                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                    children: <Widget>[
                                                                          Expanded(
                                                                                                                                                      child: Text(
                                                                                      forums[index].question,
                                                                                      textAlign: TextAlign.start,
                                                                                      maxLines: 3,
                                                                                      overflow: TextOverflow.ellipsis,
                                                                                      style: TextStyle(
                                                                                            fontWeight: FontWeight.bold,
                                                                                        ),
                                                                                    ),
                                                                          ),
                                                                        
                                                                    ],
                                                                  ),
                                                                ),
                                                                Container(
                                                                  padding: EdgeInsets.all(5),
                                                                  child: Row(
                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                    children: <Widget>[
                                                                                   Expanded(
                                                                                                                                                                        child: Text(
                                                                                      forums[index].description,
                                                                                      textAlign: TextAlign.start,
                                                                                      maxLines: 3,
                                                                                      overflow: TextOverflow.ellipsis,
                                                                                  ),
                                                                                   ),
                                                                    ],
                                                                  ),
                                                                ),
                                                          ],
                                                        ),
                                                               
                                            ],
                                          ),
                                        ],
                                      ),
                                    ) 
                                ),
                   ),
        );
                           
      }
      else{
        return Center(
                      child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.greenAccent[700])));
      }
      }
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
              body:
                  Stack(
                    children:<Widget>[
                        Container(
                      padding: EdgeInsets.fromLTRB(10,10,10,0),
                      child: 
                      _buildForumCard(),
                      ),
                      _forumButton(),
                    ] 
                  ),
                );
          }
        }