class WindModel {
  double? speed;

  WindModel({this.speed});

  // from json
  factory WindModel.fromJson(Map<String, dynamic> json) {
    return WindModel(
      speed: json['speed'].toDouble(),
    );
  }

  // to json
  Map<String, dynamic> toJson() {
    return {
      'speed': speed,
    };
  }
}
