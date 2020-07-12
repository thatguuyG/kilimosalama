class Chat {
  final String idTo;
  final String idFrom;
  final String idToName;
  final int type;
  final String timestamp; // Would usually be type DateTime or Firebase Timestamp in production apps
  final String content;
  final bool unread;

  Chat({
    this.idTo,
    this.idFrom,
    this.idToName,
    this.type,
    this.timestamp,
    this.content,
    this.unread,
  });
}