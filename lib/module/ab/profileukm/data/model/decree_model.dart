class DecreeModel {
  String? id;
  String? propinsi;
  String? kota;
  String? kecamatan;
  String? lat;
  String? lon;

  DecreeModel(
      {this.id, this.propinsi, this.kota, this.kecamatan, this.lat, this.lon});

  DecreeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    propinsi = json['propinsi'];
    kota = json['kota'];
    kecamatan = json['kecamatan'];
    lat = json['lat'];
    lon = json['lon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['propinsi'] = this.propinsi;
    data['kota'] = this.kota;
    data['kecamatan'] = this.kecamatan;
    data['lat'] = this.lat;
    data['lon'] = this.lon;
    return data;
  }
}

List<DecreeModel> DecreeListFromJson(List<dynamic> jsonList) {
  List<DecreeModel> list = [];
  for (var item in jsonList) {
    list.add(DecreeModel.fromJson(item));
  }
  return list;
}