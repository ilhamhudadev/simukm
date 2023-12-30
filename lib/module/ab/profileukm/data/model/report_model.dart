class ReportModel {
  int? statusCode;
  String? statusMessage;
  String? message;
  List<DataReport>? data;

  ReportModel({this.statusCode, this.statusMessage, this.message, this.data});

  ReportModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    statusMessage = json['statusMessage'];
    message = json['message'];
    if (json['data'] != null) {
      data = <DataReport>[];
      json['data'].forEach((v) {
        data!.add(new DataReport.fromJson(v));
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

class DataReport {
  String? id;
  String? userId;
  String? reportDate;
  String? reportTitle;
  String? responsibleParty;
  String? reportContent;
  String? attachment;
  String? organizationName;
  String? shortName;

  DataReport(
      {this.id,
      this.userId,
      this.reportDate,
      this.reportTitle,
      this.responsibleParty,
      this.reportContent,
      this.attachment,
      this.organizationName,
      this.shortName});

  DataReport.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    reportDate = json['report_date'];
    reportTitle = json['report_title'];
    responsibleParty = json['responsible_party'];
    reportContent = json['report_content'];
    attachment = json['attachment'];
    organizationName = json['organization_name'];
    shortName = json['short_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['report_date'] = reportDate;
    data['report_title'] = reportTitle;
    data['responsible_party'] = responsibleParty;
    data['report_content'] = reportContent;
    data['attachment'] = attachment;
    data['organization_name'] = organizationName;
    data['short_name'] = shortName;
    return data;
  }
}
