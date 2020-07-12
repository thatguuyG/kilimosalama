import 'dart:convert';
// import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kilimosalama/src/authentication.dart';
import 'package:kilimosalama/src/firestore.dart';
import 'package:kilimosalama/src/main/models/message_model.dart';
import 'package:kilimosalama/src/main/models/user_model.dart';
// import 'package:kilimosalama/src/main/screens/chat_screen.dart';
import 'package:kilimosalama/src/main/screens/forum_list.dart';
// import 'package:kilimosalama/src/main/widgets/favorite_contacts.dart';
import 'package:kilimosalama/src/main/widgets/recent_chats.dart';
// import 'package:provider/provider.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:cached_network_image/cached_network_image.dart';

class ChatsPage extends StatefulWidget {
  @override
  _ChatsPageState createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {
  final FirebaseMessaging firebaseMessaging = FirebaseMessaging();
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  List<Messages> _messages;



 @override
  void initState() {
    super.initState();
    _messages = List<Messages>();
    registerNotification();
    configLocalNotification();
  }

   void registerNotification() {
      // unique identifier for device
  firebaseMessaging.getToken().then((token) {
    print('Device token: $token');
        FirestoreService()
        .usersCollection
        .document(uid)
        .updateData({'pushToken': token});
  }).catchError((err) {
    Fluttertoast.showToast(msg: err.message.toString());
  });
    // configure listeners
  firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
      print('onMessage: $message');
      setMessage(message);
        showNotification(message);
      }, onResume: (Map<String, dynamic> message) async {
    print('onResume: $message');
      showNotification(message);
    setMessage(message);
      }, onLaunch: (Map<String, dynamic> message) async {
    print('onLaunch: $message');
      showNotification(message);
    setMessage(message);
  });
  }


  void showNotification(message) async {
    var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
      'com.example.kilimosalama',
      'Kilimo Salama',
      'Take charge of your farm',
      playSound: true,
      enableVibration: true,
      importance: Importance.Max,
      priority: Priority.High,
      icon: 'app_icon',
      // autoCancel: true
    );
    var platformChannelSpecifics =
        new NotificationDetails(androidPlatformChannelSpecifics, null);

    print(message);

    await flutterLocalNotificationsPlugin.show(
        0, message['notification']['title'].toString(), message['notification']['body'].toString(), 
        platformChannelSpecifics,
        payload: json.encode(message));
  }

   void configLocalNotification() {
    var initializationSettingsAndroid = new AndroidInitializationSettings('app_icon');
    // var initializationSettingsIOS = new IOSInitializationSettings();
    var initializationSettings = new InitializationSettings(initializationSettingsAndroid, null);
    flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  void setMessage(Map<String, dynamic> message){
    final notification = message['notification'];
    final data = message['data'];
    final String title = notification['title'];
    final String body = notification['body'];
    final String mMessage = data['message'];
    setState(() {
      Messages m = Messages(title, body, mMessage);
      _messages.add(m);
    });
    // print(_messages);
  
  }
  
  @override
  Widget build(BuildContext context) {
    return  StreamBuilder<List<User>>(
      stream: FirestoreService(uid:uid).users,
      builder: (context, snapshot) {
        return DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.greenAccent[700],
              title: Text(
                'Community',
              ),
              centerTitle: true,
              bottom: TabBar(indicatorColor: Colors.greenAccent, 
              // isScrollable: true,
              tabs: <Widget>[
                Tab(
                  text: 'Ask Community',
                ),
                Tab(
                  text: 'Chat',
                ),
              ]),
            ),
            body: TabBarView(
                  children: 
                  <Widget>[
                    Container(child: ForumListPage()),
                    Container(child: RecentChats()),
                  ],
                )
          )
        );
              }
    );
      }
  }