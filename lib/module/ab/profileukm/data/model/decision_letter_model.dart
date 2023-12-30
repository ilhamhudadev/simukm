class DecisionModel {
  int? statusCode;
  String? statusMessage;
  String? message;
  List<DataDecision>? data;

  DecisionModel({this.statusCode, this.statusMessage, this.message, this.data});

  DecisionModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    statusMessage = json['statusMessage'];
    message = json['message'];
    if (json['data'] != null) {
      data = <DataDecision>[];
      json['data'].forEach((v) {
        data!.add(new DataDecision.fromJson(v));
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

class DataDecision {
  String? id;
  String? userId;
  String? decisionNumber;
  String? decisionTitle;
  String? decisionDate;
  String? letterAttachment;
  String? organizationName;
  String? shortName;

  DataDecision(
      {this.id,
      this.userId,
      this.decisionNumber,
      this.decisionTitle,
      this.decisionDate,
      this.letterAttachment,
      this.organizationName,
      this.shortName});

  DataDecision.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    decisionNumber = json['decision_number'];
    decisionTitle = json['decision_title'];
    decisionDate = json['decision_date'];
    letterAttachment = json['letter_attachment'];
    organizationName = json['organization_name'];
    shortName = json['short_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['decision_number'] = this.decisionNumber;
    data['decision_title'] = this.decisionTitle;
    data['decision_date'] = this.decisionDate;
    data['letter_attachment'] = this.letterAttachment;
    data['organization_name'] = this.organizationName;
    data['short_name'] = this.shortName;
    return data;
  }
}
