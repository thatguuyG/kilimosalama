import 'dart:io';
import 'package:intl/intl.dart';
import 'package:kilimosalama/src/main/models/Responses.dart';
// import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kilimosalama/src/authentication.dart';
import 'package:kilimosalama/src/firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:kilimosalama/src/main/models/Forum.dart';
import 'package:kilimosalama/src/main/models/user_model.dart';

class ForumScreenPage extends StatefulWidget {
  final Forum currentforum;

  const ForumScreenPage({Key key, @required this.currentforum}) : super(key: key);

  @override
  _ForumScreenPageState createState() => _ForumScreenPageState(currentforum:currentforum);
}

class _ForumScreenPageState extends State<ForumScreenPage> {
  _ForumScreenPageState({Key key, @required this.currentforum});

    final firestoreService = FirestoreService(uid:uid);
    final Auth auth = Auth();
    Forum currentforum;
    File imageFile;
    bool isLoading;
    bool isShowSticker;
    String imageUrl;
    final TextEditingController textEditingController = TextEditingController();
    final ScrollController listScrollController = ScrollController();
    final FocusNode focusNode = FocusNode();


    void onSendMessage(String content, int type, String name, String avatarUrl) async {
    // type: 0 = text, 1 = image
    if (content.trim() != '') {
      textEditingController.clear();

      await firestoreService
      .updateResponsesData(
        name, 
        avatarUrl, 
        currentforum.timestamp, 
        DateTime.now().millisecondsSinceEpoch.toString(), 
        content, 
        type
        );

      // listScrollController.animateTo(0.0, duration: Duration(milliseconds: 300), curve: Curves.easeOut);
    } else {
      Fluttertoast.showToast(msg: 'Nothing to send');
    }
  }


     _buildListResponses() {
    return StreamBuilder<List<Responses>>(
      stream: FirestoreService(uid:uid).responses,
      builder: (context, snapshot) {
        if(snapshot.hasData){
          List<Responses> responses = snapshot.data;
          return  Flexible(
            child: ListView.builder(
            itemCount: responses.length ,
            itemBuilder: (context, index) =>
            responses[index].forumId == currentforum.timestamp
            ?
             Container(
                      color: Colors.blueGrey[200],
                      padding: EdgeInsets.fromLTRB(10,10,10,0),
                      child:Padding(
                        padding: EdgeInsets.all(2),
                        child: Column(
                          children: <Widget>[
                            new Stack(
                                children: <Widget>[                         
                                  Column(
                                    children: <Widget>[
                                      Container(
                                        margin: EdgeInsets.fromLTRB(5,5,0,10),
                                        child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                        CircleAvatar(
                                          radius: 12.0,
                                          backgroundImage:  
                                          CachedNetworkImageProvider(
                                            responses[index].avatarUrl
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
                                           responses[index].name,
                                            textAlign: TextAlign.start,
                                            maxLines: 1,
                                            style: TextStyle(
                                            fontSize: 13.0, 
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey[600]
                                             ),
                                            ),
                                          Text(
                                            DateFormat('dd MMM kk:mm')
                                              .format(
                                                DateTime.fromMillisecondsSinceEpoch(int.parse(responses[index].timestamp)
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
                                            Column(
                                              children: <Widget>[
                                            Text(
                                              responses[index].response,
                                               maxLines: 4,
                                             textAlign: TextAlign.start,
                                          style: TextStyle(
                                          color: Colors.grey[800]
                                               ),
                                            ),
                                              ],
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
                              )
            :
            Container(
              width: 0.0,
              height: 0.0)
        ),
          )
          ;
        }
           else{
            return Center(
                          child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.greenAccent[700])));
          }
      }
    );
  }

    _buildMessageComposer(){
        return StreamBuilder<User>(
          stream: FirestoreService(uid:uid).userData,
          builder: (context, snapshot) {
            if(snapshot.hasData){
              User user = snapshot.data;
              return 
              Container(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              height: 70.0,
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.photo),
                    iconSize: 25.0,
                    color: Colors.greenAccent[300],
                    onPressed: () async {
                        imageFile = await ImagePicker.pickImage(source: ImageSource.gallery);

                        if (imageFile != null) {
                            setState(() {
                              isLoading = true;
                            });
                                String fileName = "images/" + DateTime.now().millisecondsSinceEpoch.toString();
                                StorageReference reference = FirebaseStorage.instance.ref().child(fileName);
                                StorageUploadTask uploadTask = reference.putFile(imageFile);
                                StorageTaskSnapshot storageTaskSnapshot = await uploadTask.onComplete;
                                storageTaskSnapshot.ref.getDownloadURL().then((downloadUrl) {
                                  print(downloadUrl);
                                  imageUrl = downloadUrl;
                                  setState(() {
                                    isLoading = false;
                                    onSendMessage(imageUrl, 1, user.name, user.imageUrl);
                                  });
                                }, onError: (err) {
                                  setState(() {
                                    isLoading = false;
                                  });
                                  Fluttertoast.showToast(msg: 'This file is not an image');
                                });
                          }
                    }
                    ),
                    Expanded(
                      child: TextField(
                      controller: textEditingController,
                      textCapitalization: TextCapitalization.sentences,
                      // onChanged: (value) {},
                      decoration: InputDecoration.collapsed(
                        hintText: 'Send a message...',
                      ),
                      focusNode: focusNode,
                    )),
                    IconButton(
                    icon: Icon(Icons.send),
                    iconSize: 25.0,
                    color: Colors.black,
                    onPressed: () {
                      onSendMessage(textEditingController.text, 0, user.name, user.imageUrl);
                    }
                    ),
                ],
              )
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
    // print(DateTime.now().millisecondsSinceEpoch.toString());
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:Size.fromHeight(170.0), 
              child: AppBar(
          backgroundColor: Colors.greenAccent[700],
          flexibleSpace: 
          widget.currentforum.imageUrl != ""
          ? 
                 Image(
                image:  CachedNetworkImageProvider(
                   widget.currentforum.imageUrl
                        ),
                      fit: BoxFit.cover,
               )
               :
           Image(
                image:  CachedNetworkImageProvider(
                  "https://firebasestorage.googleapis.com/v0/b/kilimo-salama.appspot.com/o/images%2Fno_image.jpg?alt=media&token=28c5d1d8-20a6-4b34-8acd-2c0e63064550"
                //  "https://firebasestorage.googleapis.com/v0/b/kilimo-salama.appspot.com/o/images%2Fno_image1.jpg?alt=media&token=0c1a3cc9-3e84-4c83-9447-bee6b224491c"
         
                 ),
                      fit: BoxFit.cover,
               )
               ,
   
        ),
      ),
              body:
                    Column(
                      children: <Widget>[
                        Container(
                        child:  Padding(
                            padding: EdgeInsets.all(2),
                            child: Column(
                              children: <Widget>[
                                new Stack(
                                  children: <Widget>[                         
                                              Column(
                                                children: <Widget>[
                                                  Container(
                                                    margin: EdgeInsets.fromLTRB(5,5,0,10),
                                                        child: Row(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: <Widget>[
                                                          CircleAvatar(
                                                            radius: 17.0,
                                                            backgroundImage:  
                                                              CachedNetworkImageProvider(
                                                                widget.currentforum.avatarUrl
                                                              ),
                                                          ),
                                                          SizedBox(
                                                            width: 5.0,
                                                          ),
                                                        Column(
                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                          children: <Widget>[
                                                            Text(
                                                              // 6RQKOJsINwOn4g94OuC0UF6i7pD3 - Kilimo Salama - https://lh4.googleusercontent.com/-pScumwo--jI/AAAAAAAAAAI/AAAAAAAAAAA/AAKWJJMsimWITzpQqNA-WxgUc4VqQJJNbQ/s96-c/photo.jpg, 
                                                              // lPf53dPstvab8oJNznrou9Kqaso1 - Test One - https://firebasestorage.googleapis.com/v0/b/kilimo-salama.appspot.com/o/images%2Ffarmer_4.jpg?alt=media&token=2f60da4c-ab21-472c-9cb6-04e379fa4bd2,
                                                              //  r9vTSsGk3qXIrKawgAoT11J0zTQ2 - New Account - https://firebasestorage.googleapis.com/v0/b/kilimo-salama.appspot.com/o/images%2Ffarmer_7.jpg?alt=media&token=91e884e4-0ef6-4104-8656-c49dd2c8960d
                                                                widget.currentforum.username,
                                                                textAlign: TextAlign.start,
                                                                maxLines: 1,
                                                                style: TextStyle(
                                                                  fontSize: 17.0, 
                                                                  fontWeight: FontWeight.bold,
                                                                  color: Colors.black
                                                                  ),
                                                              ),
                                                              Text(
                                                                DateFormat('dd MMM kk:mm')
                                                                  .format(
                                                                    DateTime.fromMillisecondsSinceEpoch(int.parse(widget.currentforum.timestamp)
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
                                                                                      widget.currentforum.question,
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
                                                                                      widget.currentforum.description,
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
                       
                            _buildListResponses(),
                    _buildMessageComposer(),
                      ],
                    ),
                   
                  );
  }
}