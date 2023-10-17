class UserModel {
  int? count;
  String? name;
  int? age;

  UserModel({this.count, this.name, this.age});

  UserModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    name = json['name'];
    age = json['age'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['name'] = this.name;
    data['age'] = this.age;
    return data;
  }
}

List<UserModel> userFromJson(List<dynamic> jsonList) {
  List<UserModel> list = [];
  for (var item in jsonList) {
    list.add(UserModel.fromJson(item));
  }
  return list;
}
