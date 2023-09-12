class WindModel {
  double? speed;

  WindModel({this.speed});

  // from json
  factory WindModel.fromJson(Map<String, dynamic> json) {
    return WindModel(
      speed: json['speed'],
    );
  }

  // to json
  Map<String, dynamic> toJson() {
    return {
      'speed': speed,
    };
  }
}
