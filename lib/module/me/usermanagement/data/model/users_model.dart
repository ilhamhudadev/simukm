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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    data['statusMessage'] = this.statusMessage;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? organizationName;
  int? userId;
  String? shortName;
  String? contactNumber;
  String? email;
  String? instagram;
  String? youtube;
  String? twitter;
  String? username;
  String? password;
  String? history;
  String? imageUrl;

  Data(
      {this.id,
      this.organizationName,
      this.userId,
      this.shortName,
      this.contactNumber,
      this.email,
      this.instagram,
      this.youtube,
      this.twitter,
      this.username,
      this.password,
      this.history,
      this.imageUrl});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    organizationName = json['organization_name'];
    userId = json['user_id'];
    shortName = json['short_name'];
    contactNumber = json['contact_number'];
    email = json['email'];
    instagram = json['instagram'];
    youtube = json['youtube'];
    twitter = json['twitter'];
    username = json['username'];
    password = json['password'];
    history = json['history'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['organization_name'] = this.organizationName;
    data['user_id'] = this.userId;
    data['short_name'] = this.shortName;
    data['contact_number'] = this.contactNumber;
    data['email'] = this.email;
    data['instagram'] = this.instagram;
    data['youtube'] = this.youtube;
    data['twitter'] = this.twitter;
    data['username'] = this.username;
    data['password'] = this.password;
    data['history'] = this.history;
    data['image_url'] = this.imageUrl;
    return data;
  }
}
