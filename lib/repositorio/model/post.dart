class ModeloPost {
  int? id;
  String? title;
  String? body;

  ModeloPost({this.id, this.title, this.body});

  factory ModeloPost.fromJson(Map<String, dynamic> json) {
    return ModeloPost(
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}
