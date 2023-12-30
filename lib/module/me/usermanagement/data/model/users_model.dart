class UsersModel {
  int? statusCode;
  String? statusMessage;
  String? message;
  List<Data>? data;

  UsersModel({this.statusCode, this.statusMessage, this.message, this.data});

  UsersModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    statusMessage = json['statusMessage'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['statusCode'] = statusCode;
    data['statusMessage'] = statusMessage;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? id;
  String? organizationName;
  String? shortName;
  String? history;
  String? contactNumber;
  String? email;
  String? instagram;
  String? youtube;
  String? twitter;
  String? username;
  String? password;

  Data(
      {this.id,
      this.organizationName,
      this.shortName,
      this.history,
      this.contactNumber,
      this.email,
      this.instagram,
      this.youtube,
      this.twitter,
      this.username,
      this.password});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? "";
    organizationName = json['organization_name'] ?? "";
    shortName = json['short_name'] ?? "";
    history = json['history'] ?? "";
    contactNumber = json['contact_number'] ?? "";
    email = json['email'] ?? "";
    instagram = json['instagram'];
    youtube = json['youtube'] ?? "";
    twitter = json['twitter'] ?? "";
    username = json['username'] ?? "";
    password = json['password'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['organization_name'] = organizationName;
    data['short_name'] = shortName;
    data['history'] = history;
    data['contact_number'] = contactNumber;
    data['email'] = email;
    data['instagram'] = instagram;
    data['youtube'] = youtube;
    data['twitter'] = twitter;
    data['username'] = username;
    data['password'] = password;
    return data;
  }
}
