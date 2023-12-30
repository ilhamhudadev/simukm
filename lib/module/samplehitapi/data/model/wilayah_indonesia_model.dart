class WilayahIndonesiaModel {
  String? id;
  String? propinsi;
  String? kota;
  String? kecamatan;
  String? lat;
  String? lon;

  WilayahIndonesiaModel(
      {this.id, this.propinsi, this.kota, this.kecamatan, this.lat, this.lon});

  WilayahIndonesiaModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    propinsi = json['propinsi'];
    kota = json['kota'];
    kecamatan = json['kecamatan'];
    lat = json['lat'];
    lon = json['lon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['propinsi'] = propinsi;
    data['kota'] = kota;
    data['kecamatan'] = kecamatan;
    data['lat'] = lat;
    data['lon'] = lon;
    return data;
  }
}

List<WilayahIndonesiaModel> wilayahIndonesiaListFromJson(
    List<dynamic> jsonList) {
  List<WilayahIndonesiaModel> list = [];
  for (var item in jsonList) {
    list.add(WilayahIndonesiaModel.fromJson(item));
  }
  return list;
}
