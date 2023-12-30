class ProposalModel {
  int? statusCode;
  String? statusMessage;
  String? message;
  List<DataProposal>? data;

  ProposalModel({this.statusCode, this.statusMessage, this.message, this.data});

  ProposalModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    statusMessage = json['statusMessage'];
    message = json['message'];
    if (json['data'] != null) {
      data = <DataProposal>[];
      json['data'].forEach((v) {
        data!.add(new DataProposal.fromJson(v));
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

class DataProposal {
  String? id;
  String? userId;
  String? date;
  String? title;
  String? location;
  String? description;
  String? documentation;
  String? organizationName;
  String? shortName;

  DataProposal(
      {this.id,
      this.userId,
      this.date,
      this.title,
      this.location,
      this.description,
      this.documentation,
      this.organizationName,
      this.shortName});

  DataProposal.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    date = json['date'];
    title = json['title'];
    location = json['location'];
    description = json['description'];
    documentation = json['documentation'];
    organizationName = json['organization_name'];
    shortName = json['short_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['date'] = this.date;
    data['title'] = this.title;
    data['location'] = this.location;
    data['description'] = this.description;
    data['documentation'] = this.documentation;
    data['organization_name'] = this.organizationName;
    data['short_name'] = this.shortName;
    return data;
  }
}
