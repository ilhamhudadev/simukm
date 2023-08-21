import 'package:get/get.dart';
import 'package:standard_project/module/ab/profileukm/data/model/profileukm.dart';

import 'package:standard_project/module/ab/profileukm/data/repo/profileukm_repo.dart';

class ProfileukmController extends GetxController with ProfileukmRepo {
  List<profileukmmodel> profileUkmList = [
    profileukmmodel(
        Year: '2020/2021',
        Chairman: 'rifqi',
        ViceChairman: 'sabyan',
        Visi:
            'Menjadi wadah pengembangan potensi mahasiswa bidang Teknologi Informasi yang unggul dan berdaya saing globa',
        Misi:
            '1. Meningkatkan Kualitas Akademik 2.Pengembangan Soft Skills dan Kepemimpinan')
  ];
}
