import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kilimosalama/src/authentication.dart';
import 'package:kilimosalama/src/firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ChatScreen extends StatefulWidget {
//  will be farmers unique id/ unique chat room id
  final String peerId;
  final String peerName;
  final String peerImageUrl;

  ChatScreen({Key key, @required this.peerId, @required this.peerName, @required this.peerImageUrl}) : super(key: key);

  @override
  State createState() => _ChatScreenState(peerId: peerId, peerName: peerName, peerImageUrl: peerImageUrl);
}

class _ChatScreenState extends State<ChatScreen> {
  _ChatScreenState({Key key, @required this.peerId, @required this.peerName, @required this.peerImageUrl});
  final firestoreService = FirestoreService();

  String peerId;
  String peerName;
  String peerImageUrl;

  var listMessage;
  String groupChatId;

  File imageFile;
  bool isLoading;
  bool isShowSticker;
  String imageUrl;
  bool unread;

  final TextEditingController textEditingController = TextEditingController();
  final ScrollController listScrollController = ScrollController();
  final FocusNode focusNode = FocusNode();

  
  @override
  void initState() {
    super.initState();
    focusNode.addListener(onFocusChange);

    groupChatId = '';

    isLoading = false;
    isShowSticker = false;
    unread = true;
    imageUrl = '';

    createChatId();
  }


   void onFocusChange() {
    if (focusNode.hasFocus) {
      // Hide sticker when keyboard appear
      setState(() {
        isShowSticker = false;
      });
    }
  }

  createChatId() async {
    if (uid.hashCode <= peerId.hashCode) {
      groupChatId = '$uid-$peerId';
    } else {
      groupChatId = '$peerId-$uid';
    }

    firestoreService.usersCollection.document(uid).updateData({'chattingWith' : peerId});

    setState(() {});
  }

    bool isLastMessageLeft(int index) {
    if ((index > 0 && listMessage != null && listMessage[index - 1]['idFrom'] == uid) || index == 0) {
      return true;
    } else {
      return false;
    }
  }

  bool isLastMessageRight(int index) {
    if ((index > 0 && listMessage != null && listMessage[index - 1]['idFrom'] != uid) || index == 0) {
      return true;
    } else {
      return false;
    }
  }

    Future getImage() async {
    imageFile = await ImagePicker.pickImage(source: ImageSource.gallery);

    if (imageFile != null) {
      setState(() {
        isLoading = true;
      });
      uploadFile();
    }
  }

  Future uploadFile() async {
    String fileName = "images/" + DateTime.now().millisecondsSinceEpoch.toString();
    StorageReference reference = FirebaseStorage.instance.ref().child(fileName);
    StorageUploadTask uploadTask = reference.putFile(imageFile);
    StorageTaskSnapshot storageTaskSnapshot = await uploadTask.onComplete;
    storageTaskSnapshot.ref.getDownloadURL().then((downloadUrl) {
      print(downloadUrl);
      imageUrl = downloadUrl;
      setState(() {
        isLoading = false;
        onSendMessage(imageUrl, 1);
      });
    }, onError: (err) {
      setState(() {
        isLoading = false;
      });
      Fluttertoast.showToast(msg: 'This file is not an image');
    });
  }

    void onSendMessage(String content, int type) async {
    // type: 0 = text, 1 = image, 2 = sticker
    if (content.trim() != '') {
      textEditingController.clear();

      await FirestoreService(uid:uid)
      .updateChatData(
        groupChatId, 
        uid, 
        peerId,
        peerName, 
        type, 
        DateTime.now().millisecondsSinceEpoch.toString(), 
        content,
        unread
        );
      listScrollController.animateTo(0.0, duration: Duration(milliseconds: 300), curve: Curves.easeOut);
    } else {
      Fluttertoast.showToast(msg: 'Nothing to send');
    }
  }

    _buildItem(int index, DocumentSnapshot document) {
      // type: 0 = text, 1 = image, 2 = sticker
    if (document['idFrom'] == uid) {
      // Right (my message)
      return Container(
        child: Column(
          children:<Widget>[(
              Row(
          children: <Widget>[
            document['type'] == 0
                // Text
                ? Column(
                  children: <Widget>[
                    Container(
                        child:
                            Text(
                              document['content'],
                              style: TextStyle(color: Colors.black),
                            ),
                        padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                        width: 200.0,
                        decoration: BoxDecoration(color: Colors.grey[50], borderRadius: BorderRadius.circular(8.0)),
                        margin: EdgeInsets.only(bottom: isLastMessageRight(index) ? 10.0 : 5.0, right: 10.0),
                        
                      ),
                      Container(
                    child: Text(
                      DateFormat('dd MMM kk:mm')
                          .format(DateTime.fromMillisecondsSinceEpoch(int.parse(document['timestamp']))),
                      style: TextStyle(color: Colors.grey, fontSize: 12.0, fontStyle: FontStyle.italic),
                    ),
                    margin: EdgeInsets.only(left: 100.0, bottom: 5.0),
                  )
                  ],
                )
                : 
                    // Image
                     Column(
                       children: <Widget>[
                         Container(
                            child: FlatButton(
                              child: Material(
                                child: CachedNetworkImage(
                                  placeholder: (context, url) => Container(
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(Colors.greenAccent[700]),
                                    ),
                                    width: 200.0,
                                    height: 200.0,
                                    padding: EdgeInsets.all(70.0),
                                    decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(8.0),
                                      ),
                                    ),
                                  ),
                                  errorWidget: (context, url, error) => Material(
                                    child: Image.asset(
                                      'assets/img_not_available.jpeg',
                                      width: 200.0,
                                      height: 200.0,
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8.0),
                                    ),
                                    clipBehavior: Clip.hardEdge,
                                  ),
                                  imageUrl: document['content'],
                                  width: 200.0,
                                  height: 200.0,
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                clipBehavior: Clip.hardEdge,
                              ),
                              onPressed: () {
                                // Navigator.push(
                                //     context, MaterialPageRoute(builder: (context) => FullPhoto(url: document['content'])));
                              },
                              padding: EdgeInsets.all(0),
                            ),
                            margin: EdgeInsets.only(bottom: isLastMessageRight(index) ? 20.0 : 10.0, right: 10.0),
                          ),
                             Container(
                    child: Text(
                      DateFormat('dd MMM kk:mm')
                          .format(DateTime.fromMillisecondsSinceEpoch(int.parse(document['timestamp']))),
                      style: TextStyle(color: Colors.grey, fontSize: 12.0, fontStyle: FontStyle.italic),
                    ),
                    margin: EdgeInsets.only(left: 100.0, bottom: 5.0),
                  )
                       ],
                     ) 
                                 
          ],
          
              mainAxisAlignment: MainAxisAlignment.end,
              
              )
             
              ),                
          ],
          
          // crossAxisAlignment: CrossAxisAlignment.end,
      ),
      );
    } else {
      // Left (peer message)
      return 
      Container(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                isLastMessageLeft(index)
                    ? Material(
                        child: CachedNetworkImage(
                          placeholder: (context, url) => Container(
                            child: CircularProgressIndicator(
                              strokeWidth: 1.0,
                              valueColor: AlwaysStoppedAnimation<Color>(Colors.greenAccent[700]),
                            ),
                            width: 35.0,
                            height: 35.0,
                            padding: EdgeInsets.all(10.0),
                          ),
                          imageUrl: peerImageUrl,
                          width: 35.0,
                          height: 35.0,
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(18.0),
                        ),
                        clipBehavior: Clip.hardEdge,
                      )
                    : Container(width: 35.0),

                document['type'] == 0
                    ? Column(
                      children: <Widget>[
                        Container(
                            child: Text(
                              document['content'],
                              style: TextStyle(color: Colors.black),
                            ),
                            padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                            width: 200.0,
                            decoration: BoxDecoration(color: Color(0xFFFEF9EB), borderRadius: BorderRadius.circular(8.0)),
                            margin: EdgeInsets.only(left: 10.0),
                          ),
                          Container(
                    child: Text(
                      DateFormat('dd MMM kk:mm')
                          .format(DateTime.fromMillisecondsSinceEpoch(int.parse(document['timestamp']))),
                      style: TextStyle(color: Colors.grey, fontSize: 12.0, fontStyle: FontStyle.italic),
                    ),
                    margin: EdgeInsets.only(top: 5.0, right:100.0, bottom: 0.0),
                  )
                      ],
                    )
                    :  Column(
                      children: <Widget>[
                        Container(
                                child: FlatButton(
                                  child: Material(
                                    child: CachedNetworkImage(
                                      placeholder: (context, url) => Container(
                                        child: CircularProgressIndicator(
                                          valueColor: AlwaysStoppedAnimation<Color>(Colors.greenAccent[700]),
                                        ),
                                        width: 200.0,
                                        height: 200.0,
                                        padding: EdgeInsets.all(70.0),
                                        decoration: BoxDecoration(
                                          color: Colors.grey[50],
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(8.0),
                                          ),
                                        ),
                                      ),
                                      errorWidget: (context, url, error) => Material(
                                        child: Image.asset(
                                          'assets/img_not_available.jpeg',
                                          width: 200.0,
                                          height: 200.0,
                                          fit: BoxFit.cover,
                                        ),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(8.0),
                                        ),
                                        clipBehavior: Clip.hardEdge,
                                      ),
                                      imageUrl: document['content'],
                                      width: 200.0,
                                      height: 200.0,
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                    clipBehavior: Clip.hardEdge,
                                  ),
                                  onPressed: () {
                                    // Navigator.push(context,
                                    //     MaterialPageRoute(builder: (context) => FullPhoto(url: document['content'])));
                                  },
                                  padding: EdgeInsets.all(0),
                                ),
                                margin: EdgeInsets.only(left: 10.0),
                              ),
                               Container(
                    child: Text(
                      DateFormat('dd MMM kk:mm')
                          .format(DateTime.fromMillisecondsSinceEpoch(int.parse(document['timestamp']))),
                      style: TextStyle(color: Colors.grey, fontSize: 12.0, fontStyle: FontStyle.italic),
                    ),
                    margin: EdgeInsets.only(top: 5.0, right:100.0, bottom: 0.0),
                  )
                      ],
                    )
              ],
            ),
          ],
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
        margin: EdgeInsets.only(bottom: 10.0),
      );
    }
  }

   _buildListMessage() {
    return Flexible(
      child: groupChatId == ''
          ? Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.greenAccent[700])))
          : StreamBuilder(
              stream: Firestore.instance
                  .collection('chats')
                  .document(groupChatId)
                  .collection(groupChatId)
                  .orderBy('timestamp', descending: true)
                  .limit(20)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                      child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.greenAccent[700])));
                } else {
                  listMessage = snapshot.data.documents;
                  return ListView.builder(
                    padding: EdgeInsets.all(10.0),
                    itemBuilder: (context, index) => _buildItem(index, listMessage[index]),
                    itemCount: listMessage.length,
                    reverse: true,
                    controller: listScrollController,
                  );
                }
              },
            ),
    );
  }

  _buildMessageComposer(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      height: 70.0,
      color: Colors.white,
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.photo),
            iconSize: 25.0,
            color: Colors.greenAccent[300],
            onPressed: () {
              getImage();
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
              onSendMessage(textEditingController.text, 0);
            }
            ),
        ],
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    print("Chat Screen: " + uid);
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        backgroundColor:  Colors.greenAccent[700],
        title: Text(
          // "Sender Name",
          widget.peerName,
          style: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_horiz),
            iconSize: 30.0,
            color: Colors.white,
            onPressed: () {},
            ),
        ],
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
              child: Column(
          children: <Widget>[
                    _buildListMessage(),
               
            _buildMessageComposer()
          ],
        ),
      ),
    );
  }
}