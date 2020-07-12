import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kilimosalama/src/firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kilimosalama/src/main/models/user_model.dart';

String email;
String uid;
String name;
String avatarUrl;
String location;
String phoneNumber;
User authenticatedUser;

abstract class BaseAuth {
  Future<String> signIn(String email, String password);

  Future<String> signUp(String email, String password);

  Future<String> getCurrentUser();

  Future<void> sendEmailVerification();

  Future<void> signOut();

  Future<bool> isEmailVerified();

}

class Auth implements BaseAuth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  // create user object based on firebase user
  User _userFromFirebaseUser(FirebaseUser user) {
    return user!= null ? User(
      uid: user.uid,
      name: user.displayName,
      imageUrl: user.photoUrl,
      email: user.email,
      phoneNumber: user.phoneNumber,
      ) 
      : 
      null;
  }

  
    //  auth change user stream
  Stream<User> get user {
    return _firebaseAuth.onAuthStateChanged
      .map(_userFromFirebaseUser);
  }

  Future<String> signIn(String email, String password) async {
    AuthResult result = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    FirebaseUser user = result.user;

    email = user.email;
    uid = user.uid;
    name = user.displayName;
    return user.uid;
  }

  Future<String> signUp(String email, String password) async {
    AuthResult result = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    FirebaseUser user = result.user;
    email = user.email;
    uid = user.uid;
     // create a new document for the user using uid
        await FirestoreService(uid: user.uid).updateUserData('username', email, '07xxxxxxxx', 'location', 'profilephoto');
    return user.uid;
  }


  Future<String> getCurrentUser() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    return user!= null
            ? user.uid
            : null ;
  }


  Future<void> signOut() async {
    return _firebaseAuth.signOut();
  }

  Future<void> sendEmailVerification() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    user.sendEmailVerification();
  }

  Future<bool> isEmailVerified() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    return user.isEmailVerified;
  }
}