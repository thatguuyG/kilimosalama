// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:kilimosalama/src/firestore.dart';
import 'package:kilimosalama/src/main/models/Chat.dart';
import 'package:kilimosalama/src/main/models/user_model.dart';
import './Profile.dart';
import './Chats.dart';
import './Home.dart';
import './Recommendations.dart';
import '../authentication.dart';
import 'package:provider/provider.dart';
// import 'dart:async';
// import 'package:kilimo/src/signup.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:kilimo/src/loginPage.dart';


class MainPage extends StatefulWidget {
  MainPage({Key key, this.auth, this.userId, this.logoutCallback}): super(key: key);

  final BaseAuth auth;
  final VoidCallback logoutCallback;
  final String userId;
  @override
  _MainPageState createState() => _MainPageState();
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Hey'),
      ),
    );
  }
}

class _MainPageState extends State<MainPage> {
  int _selectedPage = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();
  final _pageOptions = [
    HomePage(),
    ChatsPage(),
    RecommendationsPage(),
    ProfilePage(),
  ];

  signOut() async {
    try {
      await widget.auth.signOut();
      widget.logoutCallback();
    } catch (e) {
      print(e);
    }
  }


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // StreamProvider<User>.value(
        //   value: Auth().user,
        // ),
        StreamProvider<List<User>>.value(
          value: FirestoreService().users,
        ),
          StreamProvider<List<Chat>>.value(
          value: FirestoreService().chats,
        ),
         StreamProvider<User>.value(
          value: FirestoreService().userData,
        )
      ],
    child:MaterialApp(
      title: 'Kilimo Salama',
      home: Scaffold(
        // appBar: PreferredSize(
        //     preferredSize: Size.fromHeight(20.0),
        //     child: AppBar(
        //       actions: <Widget>[
        //         _logout(),
        //       ],
        //     )
        //     ),
        body: Container(
          color: Colors.white,
          child: Center(
            child: _pageOptions[_selectedPage],
          ),
        ),
        
        bottomNavigationBar: SizedBox(
          height: 65,
          child: CurvedNavigationBar(
            backgroundColor: Colors.greenAccent[700],
            key: _bottomNavigationKey,
            //currentIndex : _selectedPage,
            index: 0,
            height: 50.0,
            onTap: (int index) {
              setState(() {
                _selectedPage = index;
              });
            },
            items: <Widget>[
              Icon(Icons.home, size: 25),
              Icon(Icons.chat, size: 25),
              Icon(Icons.list, size: 25),
              Icon(Icons.account_circle, size: 25),
              // Icon(Icons.perm_identity, size: 30),
            ],
          ),
        ),
      ),
    )
    );
  }
}
