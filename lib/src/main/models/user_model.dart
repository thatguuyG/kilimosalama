import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final int id;
  final String uid;
  final String name;
  final String imageUrl;
  final String email;
  final String phoneNumber;
  final String location;

  User({
    this.id,
    this.uid,
    this.name,
    this.imageUrl,
    this.email, 
    this.phoneNumber, 
    this.location,
  });

   factory User.fromFirestore(DocumentSnapshot doc) {
    // Map data = doc.data;
      return User(
        uid: doc.documentID,
        name: doc.data['username'] ?? '',
        email: doc.data['email'] ?? '',
        phoneNumber: doc.data['phoneNumber'] ?? '',
        location: doc.data['location'] ?? '',
        imageUrl: doc.data['photoUrl'] ?? '',
      );
    }
  }

