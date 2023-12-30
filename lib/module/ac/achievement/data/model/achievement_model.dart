class AchievementModel {
  int? statusCode;
  String? statusMessage;
  String? message;
  List<DataAchievement>? data;

  AchievementModel(
      {this.statusCode, this.statusMessage, this.message, this.data});

  AchievementModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    statusMessage = json['statusMessage'];
    message = json['message'];
    if (json['data'] != null) {
      data = <DataAchievement>[];
      json['data'].forEach((v) {
        data!.add(new DataAchievement.fromJson(v));
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

class DataAchievement {
  String? id;
  String? userId;
  String? achievementDate;
  String? achievementTitle;
  String? achievementDetails;
  String? achievementLocation;
  String? documentation;
  String? organizationName;
  String? shortName;

  DataAchievement(
      {this.id,
      this.userId,
      this.achievementDate,
      this.achievementTitle,
      this.achievementDetails,
      this.achievementLocation,
      this.documentation,
      this.organizationName,
      this.shortName});

  DataAchievement.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    achievementDate = json['achievement_date'];
    achievementTitle = json['achievement_title'];
    achievementDetails = json['achievement_details'];
    achievementLocation = json['achievement_location'];
    documentation = json['documentation'];
    organizationName = json['organization_name'];
    shortName = json['short_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['achievement_date'] = this.achievementDate;
    data['achievement_title'] = this.achievementTitle;
    data['achievement_details'] = this.achievementDetails;
    data['achievement_location'] = this.achievementLocation;
    data['documentation'] = this.documentation;
    data['organization_name'] = this.organizationName;
    data['short_name'] = this.shortName;
    return data;
  }
}
