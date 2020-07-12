import 'package:flutter/material.dart';
// import 'package:kilimosalama/src/authentication.dart';
import 'package:kilimosalama/src/firestore.dart';
// import 'package:kilimosalama/src/main/models/Chat.dart';
// import 'package:kilimosalama/src/main/models/message_model.dart';
import 'package:kilimosalama/src/main/models/user_model.dart';
import 'package:kilimosalama/src/main/screens/chat_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:provider/provider.dart';

class FavoriteContacts extends StatelessWidget {
  // final Auth _auth = Auth();
   
  @override
  Widget build(BuildContext context) {
    final currentuser = Provider.of<User>(context);
    print("current user" + currentuser.uid);
    return 
    StreamBuilder<List<User>>(
            stream: FirestoreService().users,
            builder: (context, snapshot) {
            if(snapshot.hasData){
              // print (snapshot);

            List<User> users = snapshot.data;
            // print("Length" + " " + chats.length.toString());
            users.forEach((user) { 
              print(user.uid);
            });

            return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                          Text(
                            'Favorite Contacts',
                            style: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.0,
                            ) ,
                            ),
                          IconButton(
                            icon: Icon(
                              Icons.more_horiz,
                            ), 
                            iconSize: 30.0,
                            color: Colors.blueGrey,
                            onPressed: () {},
                          ),
                        ],
                        ),
          ),
          Container(
            height: 120.0,
            child: ListView.builder(
              padding: EdgeInsets.only(left: 10.0),
              scrollDirection: Axis.horizontal,
              itemCount: users.length,
              itemBuilder: (BuildContext context, int index) {
               
                 return 
                //  (users[index].uid != uid)
                //  ?
                 GestureDetector(
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
                                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 35.0,
                          backgroundImage: users[index].imageUrl.isNotEmpty
                          ? CachedNetworkImageProvider(users[index].imageUrl)
                          : null,
                        ),
                        SizedBox(
                          height: 6.0,
                        ),
                        Text(
                          users[index].name,
                          style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                          ),
                          ),
                      ],
                    ),
                  ),
                );
                // : 
                //  Center(child: CircularProgressIndicator());
                
              }
              ),
          ),
        ],
      ),
    );
            }
      else{
                                return Center(child: CircularProgressIndicator());
                              }
            });
            
    }
}