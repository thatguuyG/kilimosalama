import 'package:flutter/material.dart';
// import 'package:kilimosalama/src/authentication.dart';
import 'package:kilimosalama/src/firestore.dart';
import 'package:kilimosalama/src/main/models/Chat.dart';
import 'package:kilimosalama/src/main/models/user_model.dart';
// import 'package:kilimosalama/src/root_page.dart';
import 'package:kilimosalama/src/welcomePage.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
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
          child: MaterialApp(
          home: 
          // RootPage(), 
          WelcomePage(),
      ),
        );
  }
}




