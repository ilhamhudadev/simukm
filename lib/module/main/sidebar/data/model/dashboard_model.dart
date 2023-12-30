class DashboardModel {
  int? statusCode;
  String? statusMessage;
  String? message;
  Data? data;

  DashboardModel(
      {this.statusCode, this.statusMessage, this.message, this.data});

  DashboardModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    statusMessage = json['statusMessage'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['statusCode'] = statusCode;
    data['statusMessage'] = statusMessage;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  TotalEvent? totalEvent;
  TotalEvent? totalLPJ;
  TotalEvent? totalOrganisasi;
  TotalEvent? totalProposal;
  TotalEvent? totalSK;

  Data(
      {this.totalEvent,
      this.totalLPJ,
      this.totalOrganisasi,
      this.totalProposal,
      this.totalSK});

  Data.fromJson(Map<String, dynamic> json) {
    totalEvent = json['totalEvent'] != null
        ? TotalEvent.fromJson(json['totalEvent'])
        : null;
    totalLPJ =
        json['totalLPJ'] != null ? TotalEvent.fromJson(json['totalLPJ']) : null;
    totalOrganisasi = json['totalOrganisasi'] != null
        ? TotalEvent.fromJson(json['totalOrganisasi'])
        : null;
    totalProposal = json['totalProposal'] != null
        ? TotalEvent.fromJson(json['totalProposal'])
        : null;
    totalSK =
        json['totalSK'] != null ? TotalEvent.fromJson(json['totalSK']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (totalEvent != null) {
      data['totalEvent'] = totalEvent!.toJson();
    }
    if (totalLPJ != null) {
      data['totalLPJ'] = totalLPJ!.toJson();
    }
    if (totalOrganisasi != null) {
      data['totalOrganisasi'] = totalOrganisasi!.toJson();
    }
    if (totalProposal != null) {
      data['totalProposal'] = totalProposal!.toJson();
    }
    if (totalSK != null) {
      data['totalSK'] = totalSK!.toJson();
    }
    return data;
  }
}

class TotalEvent {
  String? tableName;
  int? rowCount;

  TotalEvent({this.tableName, this.rowCount});

  TotalEvent.fromJson(Map<String, dynamic> json) {
    tableName = json['table_name'];
    rowCount = json['row_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['table_name'] = tableName;
    data['row_count'] = rowCount;
    return data;
  }
}
