import 'package:flutter/material.dart';
import 'package:kilimosalama/src/authentication.dart';
// import 'package:kilimosalama/src/firestore.dart';
// import 'package:kilimosalama/src/main/models/Chat.dart';
// import 'package:kilimosalama/src/main/models/message_model.dart';
import 'package:kilimosalama/src/main/models/user_model.dart';
import 'package:kilimosalama/src/main/screens/chat_screen.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';

class RecentChats extends StatelessWidget {

    String createChatId(String peerId)  {
      var groupChatId;
      if (uid.hashCode <= peerId.hashCode) {
        groupChatId = '$uid-$peerId';
      } else {
        groupChatId = '$peerId-$uid';
      }
      return groupChatId;
    // firestoreService.usersCollection.document(uid).updateData({'chattingWith' : peerId});

  }
  @override
  Widget build(BuildContext context) {
    var listChats;
    final users = Provider.of<List<User>>(context);
    //   users.forEach((user) {
    //   // print(chat.idTo);
    //   print(user.name);
    //   // print(chat.user.uid);
    // });
    if (users!=null){
       return  Container(
                    decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25.0),
                      topRight: Radius.circular(25.0),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25.0),
                      topRight: Radius.circular(25.0),
                    ),
                      child: 
                        // StreamBuilder(
                        //   stream: FirestoreService()
                        //       .chatsCollection
                        //       .document(createChatId())
                        //       .collection(groupChatId)
                        //       .orderBy('timestamp', descending: true)
                        //       .limit(20)
                        //       .snapshots(),
                        //   builder: (context, snapshot) {
                      ListView.builder(
                      itemCount: users.length,
                      itemBuilder: (BuildContext context, int index){
                        // final Message chat = chats[index];
                        return GestureDetector(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ChatScreen(
                                peerId: users[index].uid,
                                peerName: users[index].name,
                                peerImageUrl: users[index].imageUrl,
                              )
                              ),
                              ),
                            child: Container(
                            margin: EdgeInsets.only(top: 5.0, bottom: 5.0, right: 20.0),
                            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                            decoration: BoxDecoration(
                              color:Color(0xFFFFEFEE)  ,
                              // color: chat.unread ? Color(0xFFFFEFEE) : Colors.white,
                               borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(20.0),
                                topRight: Radius.circular(20.0),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    CircleAvatar(
                                      radius: 35.0,
                                      backgroundImage:  CachedNetworkImageProvider(users[index].imageUrl),
                                    ),
                                    SizedBox(width: 10.0),
                                    Column(
                                      // left justified
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          // "Senders Name",
                                          users[index].name,
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(height: 5.0),
                                        Container(
                                          width: MediaQuery.of(context).size.width * 0.45,
                                          child: Text(
                                            // "Message",
                                            "From: " + " " + users[index].location,
                                            style: TextStyle(
                                              color: Colors.blueGrey,
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                      //           StreamBuilder(
                      //             stream: FirestoreService()
                      //             .chatsCollection
                      //             .document(createChatId(users[index].uid))
                      //             .collection(createChatId(users[index].uid))
                      //             .snapshots(),
                      //             builder: (context, snapshot) {
                      //               if (snapshot.hasData){
                      //                 listChats = snapshot.data.documents;
                      //                 // print(listChats.length.toString());
                                      
                      //               return 
                      //                   // users[index].uid == listChats[index].idTo
                      //                   // ?
                      //                   //       Column(
                      //                   //       children: <Widget>[
                      //                   //       SizedBox(height: 5.0),
                      //                   //     listChats[index].unread 
                      //                   //     ?
                      //                   //      Container(
                      //                   //       width: 40.0,
                      //                   //       height: 20.0,
                      //                   //       decoration: BoxDecoration(
                      //                   //         color: Colors.blue,
                      //                   //         borderRadius: BorderRadius.circular(30.0),
                      //                   //       ),
                      //                   //       alignment: Alignment.center,
                      //                   //       child: Text('NEW', 
                      //                   //       style: TextStyle(
                      //                   //         color: Colors.white, 
                      //                   //         fontSize: 12.0, 
                      //                   //         fontWeight: FontWeight.bold
                      //                   //         ),
                      //                   //         ),
                      //                   //         )
                      //                   //          : Text('')
                      //                   //   ]
                      //                   // )
                      //                   // :
                      //                   Container(
                      //                     height: 0.0,
                      //                     width: 0.0
                      //                   );
                                                                      
                      //               }
                      //               else{
                      //                 return Center(
                      // child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.greenAccent[700])));
                      //               }
                      //             }
                      //           )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  );
    } else{
      return Center(child: CircularProgressIndicator());
    }
   
  }
}