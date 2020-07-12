// import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:getflutter/getflutter.dart';
import 'package:kilimosalama/src/authentication.dart';
import 'package:kilimosalama/src/firestore.dart';
import 'package:kilimosalama/src/main/models/user_model.dart';
import 'package:kilimosalama/src/main/profile/profile_cards.dart';
import 'package:kilimosalama/src/welcomePage.dart';
// import 'package:provider/provider.dart';
import 'package:path/path.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ProfilePage extends StatefulWidget {
   ProfilePage({Key key, this.auth, this.logoutCallback})
      : super(key: key);

  final BaseAuth auth;
  final VoidCallback logoutCallback;
  

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final Auth _auth = Auth();
  final currentuser = FirestoreService();
  final _formKey = GlobalKey<FormState>();
  String currentUid;
  String _currentUsername;
  String _currentPhoneNumber;
  String _currentPhotoUrl;
  String _currentEmail;
  String _currentLocation;
  bool _isLoading = false;
  File _avatarImageFile;

  // loading indicator
    Widget showCircularProgress() {
    if (_isLoading) {
      return Center(child: CircularProgressIndicator());
    }
    return Container(
      height: 0.0,
      width: 0.0,
    );
  }

  @override
  Widget build(BuildContext context)  {

    
    Future uploadImage() async {
      String fileName = "images/" + basename(_avatarImageFile.path);
      StorageReference firebaseStorageRef = FirebaseStorage.instance.ref().child(fileName);
      StorageUploadTask uploadTask = firebaseStorageRef.putFile(_avatarImageFile);
      StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
      // setState(() {
      //   _currentPhotoUrl= _avatarImageFile.path;
      //   print('Image Path: $_avatarImageFile');
      // });
    }

    Future getImage() async {
      var image = await ImagePicker.pickImage(source: ImageSource.gallery);

      setState(() {
        _avatarImageFile= image;
        _currentPhotoUrl= _avatarImageFile.path;
        print('Image Path: $_avatarImageFile');
        print('Image Path: $_currentPhotoUrl');
      });
      uploadImage();
    }

        // final user = Provider.of<User>(context);
        // print("Provider: " + user.uid);

    return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.greenAccent[700],
            title: Text('Profile'),
            centerTitle: true,
            actions: <Widget>[
                  FlatButton.icon(
                  onPressed: () async {
                  await _auth.signOut()
                  .whenComplete(() {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return  WelcomePage();
                          },
                        ),
                      );
                      widget.logoutCallback();
                    });
                    
                  },
                    icon: Icon(Icons.person_outline), 
                    label: Text('Logout'))
                ],
          ), 
          body:
           StreamBuilder<User>(
            stream: FirestoreService(uid:uid).userData,
            builder: (context, snapshot) {
            if(snapshot.hasData){

            User user = snapshot.data;
            // print(user.uid);

            return 
            SingleChildScrollView(
                      child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Container(
            padding: EdgeInsets.all(10.0),
            child: 
            new Form(
              key: _formKey,
              child: new ListView(
                shrinkWrap: true,
                children: <Widget>[
                  IconButton(
                    icon: 
                    (_avatarImageFile!=null)
                    ?
                    // (user.imageUrl != "")
                    // ?
                     Container(
                       child: 
                      ClipOval(
                        child:
                        Align(
                          heightFactor: 0.9,
                          widthFactor: 0.5,
                          child: Image.file(_avatarImageFile))  
                          ) ,
                    )
                    :
                    (user.imageUrl != "")
                    ?
                    Container(
                       child: 
                      ClipOval(
                        child:
                        Align(
                          heightFactor: 0.9,
                          widthFactor: 0.4,
                          child: Image.network(user.imageUrl)
                          )   
                          ) ,
                    )
                    :
                    Icon(
                      Icons.account_circle,
                      color: Colors.grey,
                    ),
                   
                    iconSize: 150.0,
                    onPressed: () {
                      getImage();
                                          },
                                        ),
                                      
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                  ProfileCard(
                                  // text: "Username", 
                                  text: user.name != "" ? user.name : "Username",
                                  icon: Icons.account_circle,
                                  onChanged: (text) {
                                    setState(() {
                                      _currentUsername = text;
                                    });
                                  },
                                  ),
                                  ProfileCard(
                                  // text: "Phone Number", 
                                  text: user.phoneNumber != "" ? user.phoneNumber : "Phone Number",
                                  icon: Icons.phone,
                                  onChanged: (text) {
                                    setState(() {
                                      _currentPhoneNumber = text;
                                    });
                                  },
                                  ),
                                  ProfileCard(
                                  // text: "Email",
                                  text: user.email != "" ? user.email : "Email", 
                                  icon: Icons.email,
                                  onChanged: (text) {
                                    setState(() {
                                      _currentEmail = text;
                                    });
                                  },
                                  ),
                                  ProfileCard(
                                  // text: "Location",
                                  text: user.location != "" ? user.location : "Location", 
                                  icon: Icons.location_city,
                                  onChanged: (text) {
                                    setState(() {
                                      _currentLocation = text;
                                    });
                                  },
                                  ),
                                
                                  ]
                                    ),
                                  )
                              ),
                                          SizedBox(
                                            height: 10.0,
                                          ),
                                          GFButton(
                                            elevation: 10.0,
                                            color: Colors.greenAccent[700],
                                            // onPressed: () {},
                                            onPressed: () async {  
                                              if(_formKey.currentState.validate()){
                                                await FirestoreService(uid: user.uid)
                                              .updateUserData(
                                                _currentUsername ?? user.name, 
                                                _currentEmail ?? user.email,
                                                _currentPhoneNumber ?? user.phoneNumber, 
                                                _currentLocation ?? user.location, 
                                                _currentPhotoUrl ?? user.imageUrl
                                                );
                                              }
                                              
                                                print('Updated Profile');
                                                      },
                                            text: "Update"
                                            ),
                                        ]
                                        )
                                        )
    ;
            
            }
            else{
                                return Center(child: CircularProgressIndicator());
                              }
            }
           )
    );
  }
}