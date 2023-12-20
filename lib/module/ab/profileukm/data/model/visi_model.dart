class VisiModel {
  int? statusCode;
  String? statusMessage;
  String? message;
  List<DataVisi>? data;

  VisiModel({this.statusCode, this.statusMessage, this.message, this.data});

  VisiModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    statusMessage = json['statusMessage'];
    message = json['message'];
    if (json['data'] != null) {
      data = <DataVisi>[];
      json['data'].forEach((v) {
        data!.add(new DataVisi.fromJson(v));
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

class DataVisi {
  String? id;
  String? userId;
  String? vision;
  String? mission;

  DataVisi({this.id, this.userId, this.vision, this.mission});

  DataVisi.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    vision = json['vision'];
    mission = json['mission'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['vision'] = this.vision;
    data['mission'] = this.mission;
    return data;
  }
}
