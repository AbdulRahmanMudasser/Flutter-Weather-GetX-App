class CloudModel {
  int? all;

  CloudModel({this.all});

  // from json
  factory CloudModel.fromJson(Map<String, dynamic> json) {
    return CloudModel(
      all: json['all'],
    );
  }

  // to json
  Map<String, dynamic> toJson() {
    return {'all': all};
  }
}
