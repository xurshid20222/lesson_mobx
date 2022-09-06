class Post {
  late String id;
  late String title;
  late String body;
  late String userId;

  Post({required this.id, required this.title, required this.body, required this.userId});

  Post.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        body = json['body'],
        userId = json['userId'];

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'body': body,
    'userId': userId,
  };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Post &&
              runtimeType == other.runtimeType &&
              id == other.id;

  @override
  int get hashCode => userId.hashCode;
}