// import 'package:kilimosalama/src/main/models/Responses.dart';

class Forum {
  final String uid;
  final String username;
  final String question;
  final String description;
  final String timestamp; // Would usually be type DateTime or Firebase Timestamp in production apps
  final String imageUrl;
  final String avatarUrl;

  Forum({
    this.uid,
    this.username,
    this.question,
    this.description,
    this.timestamp,
    this.imageUrl,
    this.avatarUrl,
  });
}