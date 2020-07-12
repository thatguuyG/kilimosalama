import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kilimosalama/src/authentication.dart';
import 'package:kilimosalama/src/firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:kilimosalama/src/main/models/user_model.dart';

class ForumPage extends StatefulWidget {
  @override
  _ForumPageState createState() => _ForumPageState();
}

class _ForumPageState extends State<ForumPage> {

  final _formKey = new GlobalKey<FormState>();
  bool _isLoading;
  String _question;
  String _name;
  String _description;
  String _imageUrl;
  String _errorMessage;
  File imageFile;

   void initState() {
    _errorMessage = "";
    _isLoading = false;
    _question ="";
    _description="";
    _imageUrl="";
    _name="";
    super.initState();
  }

  Future getImage() async {
    imageFile = await ImagePicker.pickImage(source: ImageSource.gallery);

    if (imageFile != null) {
      setState(() {
        _isLoading = true;
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
      setState(() {
        _isLoading = false;
        _imageUrl=downloadUrl;
      });
    }, onError: (err) {
      setState(() {
        _isLoading = false;
      });
      Fluttertoast.showToast(msg: 'This file is not an image');
    });
  }

  bool validateAndSave() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

    Widget showQuestionInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      child: new TextFormField(
        // maxLines: null,
        keyboardType: TextInputType.multiline,
        autofocus: false,
        decoration: new InputDecoration(
            labelText: 'Your question to the community',
            labelStyle: TextStyle(

            ),
            helperMaxLines: 2,
            helperText: 'Add a question indicating what\'s wrong on your farm. ',
            icon: new Icon(
              Icons.edit,
              color: Colors.grey,
            )
            ),
        validator: (value) => value.isEmpty ? 'Please enter some text' : null,
          onChanged: (text) {
            setState(() {
                   _question = text;
                       });
                        },
      ),
    );
  }

  Widget showDescriptionInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
      child: new TextFormField(
        maxLines: null,
        keyboardType: TextInputType.multiline,
        autofocus: false,
        decoration: new InputDecoration(
            labelText: 'Describe the problem',
            helperMaxLines: 2,
            helperText: 'Describe your problem e.g. changes of leaves, color, insects, tears...',
            icon: new Icon(
              Icons.description,
              color: Colors.grey,
            )),
        validator: (value) => value.isEmpty ? 'Please enter some text' : null,
        onChanged: (text) {
            setState(() {
                   _description = text;
                       });
                        },
      ),
    );
  }


    Widget showImageInput() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
          child: new IconButton(
            tooltip: 'Camera',
            iconSize: 50.0,
            icon: Icon(
              Icons.add_a_photo
              ), 
            onPressed: () async {
              imageFile = await ImagePicker.pickImage(source: ImageSource.camera);

                  if (imageFile != null) {
                    setState(() {
                      _isLoading = true;
                    });
                    uploadFile();
                  }
            }
            )
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
          child: new IconButton(
            tooltip: 'Gallery',
            iconSize: 50.0,
            icon: Icon(
              Icons.add_photo_alternate
              ), 
            onPressed: () async {
              imageFile = await ImagePicker.pickImage(source: ImageSource.gallery);

                  if (imageFile != null) {
                    setState(() {
                      _isLoading = true;
                    });
                    uploadFile();
                  }
            }
            )
        ),
      ],
    );
  }

  Widget showPostButton(){
    return StreamBuilder<User>(
      stream: FirestoreService(uid:uid).userData,
      builder: (context, snapshot) {
            // print(user.name);
        return new Padding(
            padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  'Post',
                    style: new TextStyle(
                      fontSize: 20.0, 
                      color: Colors.greenAccent[700]
                    )
                    ),
                IconButton(
                  iconSize: 30.0,
                  color: Colors.greenAccent[700],
                  icon: Icon(
                  Icons.attach_file
                  ),  
                  onPressed: () async { 
                          if(_formKey.currentState.validate()){
                            await FirestoreService(uid:uid)
                            .updateForumData(
                              _question,
                              snapshot.data.name, 
                              _description, 
                              DateTime.now().millisecondsSinceEpoch.toString(),  
                              _imageUrl,
                              snapshot.data.imageUrl
                              );
                              setState(() {
                                _isLoading = false;
                                _question = '';
                                _description = '';
                                _imageUrl = '';
                                });
                              }
                                },
                  ),
              ],
            )
        );
      }
        ); 
  }

  Widget showPrimaryButton() {
    return StreamBuilder<User>(
      stream: FirestoreService(uid:uid).userData,
      builder: (context, snapshot) {
            // print(user.name);
        return new Padding(
            padding: EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
            child: SizedBox(
              height: 30.0,
              child: new RaisedButton(
                elevation: 5.0,
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0)),
                color: Colors.greenAccent[700],
                child: new Text('Post',
                    style: new TextStyle(fontSize: 20.0, color: Colors.white)),
                onPressed: () async { 
                      if(_formKey.currentState.validate()){
                        await FirestoreService(uid:uid)
                        .updateForumData(
                          _question,
                          snapshot.data.name, 
                          _description, 
                          DateTime.now().millisecondsSinceEpoch.toString(),  
                          _imageUrl,
                          snapshot.data.imageUrl
                          );
                          setState(() {
                            _isLoading = false;
                            _question = '';
                            _description = '';
                            _imageUrl = '';
                            });
                          }
                            },
              ),
            ));
      }
    );
  }

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: 'Add an image to your post',
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w700,
          color: Colors.grey,
        ),
      ),
    );
  }

    Widget _displayImage(String imageUrl) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
            height: 100.0,
            width: 100.0,
            child: Image(
                  image:  CachedNetworkImageProvider(
                    imageUrl
                    //  'https://firebasestorage.googleapis.com/v0/b/kilimo-salama.appspot.com/o/images%2Fsoil.jpg?alt=media&token=503a3936-53cc-44d0-938c-e91959033155'
                          ),
                        fit: BoxFit.cover,
                 ),
      ),
    );
  }

    Widget _showForm() {
    return new Container(
        padding: EdgeInsets.all(16.0),
        child: new Form(
          key: _formKey,
          child: new ListView(
            shrinkWrap: true,
            children: <Widget>[
              // showPrimaryButton(),
              showPostButton(),
              showQuestionInput(),
              showDescriptionInput(),
              SizedBox(
                height: 20.0,
              ),
              _title(),
              showImageInput(),

        _imageUrl != "" ?
        _displayImage(_imageUrl)
        : Container(
          width: 0.0,
          height: 0.0,
        ),
              showErrorMessage(),   
            ],
          ),
        ));
  }

   Widget showCircularProgress() {
    if (_isLoading) {
      return Center(child: CircularProgressIndicator());
    }
    return Container(
      height: 0.0,
      width: 0.0,
    );
  }

  Widget showErrorMessage() {
    if (_errorMessage.length > 0 && _errorMessage != null) {
      return new Text(
        _errorMessage,
        style: TextStyle(
            fontSize: 13.0,
            color: Colors.red,
            height: 1.0,
            fontWeight: FontWeight.w300),
      );
    } else {
      return new Container(
        height: 0.0,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
                return Scaffold(
                      appBar: AppBar(
                        backgroundColor: Colors.greenAccent[700],
                      ),
                      body: SingleChildScrollView(
                      child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 0.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          _showForm(),
                          SizedBox(
                            height: 50.0,
                          ),
                          showCircularProgress(),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
          ),
                  ),
                );
              }
  }
