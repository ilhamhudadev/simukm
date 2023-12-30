class EventModel {
  int? statusCode;
  String? statusMessage;
  String? message;
  List<DataEvent>? data;

  EventModel({this.statusCode, this.statusMessage, this.message, this.data});

  EventModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    statusMessage = json['statusMessage'];
    message = json['message'];
    if (json['data'] != null) {
      data = <DataEvent>[];
      json['data'].forEach((v) {
        data!.add(new DataEvent.fromJson(v));
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

class DataEvent {
  String? id;
  String? userId;
  String? eventDate;
  String? eventName;
  String? eventDescription;
  String? eventAttachment;
  String? organizationName;
  String? shortName;

  DataEvent(
      {this.id,
      this.userId,
      this.eventDate,
      this.eventName,
      this.eventDescription,
      this.eventAttachment,
      this.organizationName,
      this.shortName});

  DataEvent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    eventDate = json['event_date'];
    eventName = json['event_name'];
    eventDescription = json['event_description'];
    eventAttachment = json['event_attachment'];
    organizationName = json['organization_name'];
    shortName = json['short_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['event_date'] = this.eventDate;
    data['event_name'] = this.eventName;
    data['event_description'] = this.eventDescription;
    data['event_attachment'] = this.eventAttachment;
    data['organization_name'] = this.organizationName;
    data['short_name'] = this.shortName;
    return data;
  }
}
