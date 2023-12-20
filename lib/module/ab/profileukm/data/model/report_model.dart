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

class DataReport {
  String? id;
  String? userId;
  String? reportDate;
  String? reportTitle;
  String? responsibleParty;
  String? reportContent;
  String? attachment;

  DataReport(
      {this.id,
      this.userId,
      this.reportDate,
      this.reportTitle,
      this.responsibleParty,
      this.reportContent,
      this.attachment});

  DataReport.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    reportDate = json['report_date'];
    reportTitle = json['report_title'];
    responsibleParty = json['responsible_party'];
    reportContent = json['report_content'];
    attachment = json['attachment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['report_date'] = this.reportDate;
    data['report_title'] = this.reportTitle;
    data['responsible_party'] = this.responsibleParty;
    data['report_content'] = this.reportContent;
    data['attachment'] = this.attachment;
    return data;
  }
}
