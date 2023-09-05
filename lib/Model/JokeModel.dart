class JokeModel {
  String? id;
  String? joke;
  String? status;
  int? time;
  bool? isFavourite;

  JokeModel({this.id, this.joke, this.status, this.time, this.isFavourite = false,});

  Map toJson() => {
        'id': id,
        'joke': joke,
        'status': status,
        'time': time,
      };

  JokeModel.fromJson(Map<String, dynamic> json) {
    id = json.containsKey("id")
        ? json["id"]
        : DateTime.now().millisecondsSinceEpoch.toString();
    joke = json['joke'];
    status = json.containsKey("status") ? json["status"] : "new";
    time = json.containsKey("time") ? json["time"] : 60;
  }
}
