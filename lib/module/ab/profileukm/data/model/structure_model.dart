class StructureModel {
  int? statusCode;
  String? statusMessage;
  String? message;
  List<DataStructure>? data;

  StructureModel(
      {this.statusCode, this.statusMessage, this.message, this.data});

  StructureModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    statusMessage = json['statusMessage'];
    message = json['message'];
    if (json['data'] != null) {
      data = <DataStructure>[];
      json['data'].forEach((v) {
        data!.add(new DataStructure.fromJson(v));
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

class DataStructure {
  String? id;
  String? userId;
  String? managementYear;
  String? adviser;
  String? president;
  String? vicePresident;
  String? member;
  String? organizationName;
  String? shortName;

  DataStructure(
      {this.id,
      this.userId,
      this.managementYear,
      this.adviser,
      this.president,
      this.vicePresident,
      this.member,
      this.organizationName,
      this.shortName});

  DataStructure.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    managementYear = json['management_year'];
    adviser = json['adviser'];
    president = json['president'];
    vicePresident = json['vice_president'];
    member = json['member'];
    organizationName = json['organization_name'];
    shortName = json['short_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['management_year'] = this.managementYear;
    data['adviser'] = this.adviser;
    data['president'] = this.president;
    data['vice_president'] = this.vicePresident;
    data['member'] = this.member;
    data['organization_name'] = this.organizationName;
    data['short_name'] = this.shortName;
    return data;
  }
}
