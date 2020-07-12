// import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kilimosalama/src/main/models/Chat.dart';
import 'package:kilimosalama/src/main/models/Forum.dart';
import 'package:kilimosalama/src/main/models/Responses.dart';
import 'package:kilimosalama/src/main/models/user_model.dart';

class FirestoreService {

  final String uid;
  FirestoreService({this.uid});

  // user collection reference
  final CollectionReference usersCollection = Firestore.instance.collection('users');
  // chat collection reference
  final CollectionReference chatsCollection = Firestore.instance.collection('chats');
   // forum collection reference
  final CollectionReference forumCollection = Firestore.instance.collection('forum');
 // responses collection reference
  final CollectionReference responsesCollection = Firestore.instance.collection('responses');

  Future updateUserData(String username, String email, String phoneNumber, String location, String photoUrl) async {
    return await usersCollection.document(uid).setData({
      'uid': uid,
      'username': username,
      'email': email,
      'phoneNumber': phoneNumber,
      'location': location,
      'photoUrl': photoUrl
    });
  }

   Future updateChatData(String groupChatId, String idFrom, String idTo, String idToName, int type, String timestamp, String content, bool unread) async {
    return await chatsCollection.document(groupChatId)
      .collection(groupChatId).document(timestamp).setData({
      'idFrom': idFrom,
      'idTo': idTo,
      'idToName': idToName,
      'type': type,
      'timestamp': timestamp,
      'content': content,
      'unread': unread,
    });
  }

   Future updateForumData(String question, String username, String description, String timestamp, String imageUrl, String avatarUrl) async {
    return await forumCollection.document(timestamp)
      .setData({
      'uid': uid,
      'username': username,
      'question': question,
      'description': description,
      'timestamp': timestamp,
      'imageUrl': imageUrl,
      'avatarUrl': avatarUrl,
    });
  }

  
   Future updateResponsesData(String name,  String avatarUrl, String forumId, String timestamp, String response, int type) async {
    return await responsesCollection.document(uid)
      .setData({
      'uid': uid,
      'name': name,
      'avatarUrl': avatarUrl,
      'forumId': forumId,
      'response' : response,
      'timestamp' : timestamp,
      'type': type
    });
  }

  // user list from snapshot
  List<User> _userListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc){
      return User(
        uid: doc.documentID,
        name: doc.data['username'] ?? '',
        email: doc.data['email'] ?? '',
        phoneNumber: doc.data['phoneNumber'] ?? '',
        location: doc.data['location'] ?? '',
        imageUrl: doc.data['photoUrl'] ?? '',
      );
    }).toList();
  }

   // chat list from snapshot
  List<Chat> _chatListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc){
      return Chat(
        idTo: doc.data['idTo'] ?? '',
        idFrom: uid,
        idToName: doc.data['idToName'] ?? '',
        type: doc.data['type'] ?? '',
        timestamp: doc.data['timestamp'] ?? '',
        content: doc.data['content'] ?? '',
        unread: doc.data['unread'] ?? ''
      );
    }).toList();
  }

     // forum list from snapshot
  List<Forum> _forumListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc){
      return Forum(
        uid: uid,
        username: doc.data['username'] ?? '',
        question: doc.data['question'] ?? '',
        description: doc.data['description'] ?? '',
        timestamp: doc.data['timestamp'] ?? '',
        imageUrl: doc.data['imageUrl'] ?? '',
        avatarUrl: doc.data['avatarUrl'] ?? '',
      );
    }).toList();
  }

       // response list from snapshot
  List<Responses> _responseListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc){
      return Responses(
        uid: doc.documentID,
        name: doc.data['name'] ?? '',
        avatarUrl: doc.data['avatarUrl'] ?? '',
        forumId: doc.data['forumId'] ?? '',
        response : doc.data['response'] ?? '',
        timestamp : doc.data['timestamp'] ?? '',
        type : doc.data['type'] ?? '',
      );
    }).toList();
  }

  // current userData from snapshot
  User _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return User(
        uid: uid,
        name: snapshot.data['username'],
        email: snapshot.data['email'],
        phoneNumber: snapshot.data['phoneNumber'],
        location: snapshot.data['location'],
        imageUrl: snapshot.data['photoUrl']
         );
  }

  // get users stream
  Stream<List<User>> get users {
    return usersCollection.snapshots()
    .map(_userListFromSnapshot);
  }

  // get chat stream
  Stream<List<Chat>> get chats {
    // return chatsCollection
    return chatsCollection.snapshots()
    .map(_chatListFromSnapshot);
  }

 // get forum stream
  Stream<List<Forum>> get forums {
    return forumCollection
    .orderBy('timestamp', descending:true)
    .snapshots()
    .map(_forumListFromSnapshot);
  }

   // get response stream
  Stream<List<Responses>> get responses {
    return responsesCollection.orderBy('timestamp', descending:true)
    .snapshots()
    .map(_responseListFromSnapshot);
  }

  // get current User
  Stream<User> get userData {
    return usersCollection.document(uid).snapshots()
    .map(_userDataFromSnapshot);
  }
}