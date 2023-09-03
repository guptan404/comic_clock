class JokeModel {
  String? id;
  String? joke;
  String? status;

  JokeModel({this.id, this.joke, this.status});

  Map toJson() => {
    'id': id,
    'joke': joke,
    'status': status,
  };

  JokeModel.fromJson(Map<String, dynamic> json) {
    id = DateTime.now().millisecondsSinceEpoch.toString();
    joke = json['joke'];
    status = "new";
  }
}