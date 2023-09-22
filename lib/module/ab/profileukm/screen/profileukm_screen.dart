import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:standard_project/core/style/app_color.dart';
import 'package:standard_project/core/style/app_size.dart';
import 'package:standard_project/module/ab/profileukm/controller/profileukm_controller.dart';

class ProfileukmScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppSize().init(context);
    return GetBuilder<ProfileukmController>(
        init: ProfileukmController(),
        builder: (ProfileukmController controller) {
          return Scaffold(
            backgroundColor: Color(0x6BE9E7E7),
            body: SingleChildScrollView(
                child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 15, left: 15, top: 15),
                  padding: EdgeInsets.all(20),
                  height: AppSize.screenHeight * 1,
                  width: AppSize.screenWidth * 3,
                  decoration: BoxDecoration(color: Colors.white,
                  borderRadius: BorderRadius.circular(5)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sejarah ukm',
                        style: TextStyle(
                            fontSize: 35, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '- 2 Novenber 2017 -',
                        style: TextStyle(color: AppColors.bilu),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                          'Berdirinya Himpunan Mahasiswa Islam (HMI) diprakasai oleh Lafran Pane, seorang mahasiswa STI (Sekolah Tinggi Islam), kini UII (Universitas Islam Indonesia) yang masih duduk ditingkat I yang ketika itu genap berusia 25 tahun. Tentang sosok Lafran Pane, dapat diceritakan secara garis besarnya antara lain bahwa Pemuda Lafran Pane lahir di Sipirok-Tapanuli Selatan, Sumatera Utara. Beliau adalah anak seorang Sutan Pangurabaan Pane –tokoh pergerakan nasional “serba komplit” dari Sipirok, Tapanuli Selatan.'),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                          'Lafaran Pane adalah sosok yang tidak mengenal lelah dalam proses pencarian jati dirinya, dan secara kritis mencari kebenaran sejati. Lafran Pane kecil, remaja dan menjelang dewasa yang nakal, pemberontak, dan “bukan anak sekolah yang rajin” adalah identitas fundamental Lafran sebagai ciri paling menonjol dari Independensinya. Sebagai figur pencarai sejati, independensi Lafran terasah, terbentuk, dan sekaligus teruji, di lembaga-lembaga pendidikan yang tidak Ia lalui dengan “Normal” dan “lurus” itu (Walau Pemuda Lafran Pane yang tumbuh dalam lingkungan nasionalis-muslim terpelajar pernah juga menganyam pendidikan di Pesantren Ibtidaiyah, Wusta dan sekolah Muhammadiyah) ; pada hidup berpetualang di sepanjang jalanan kota Medan, terutama di kawasan Jalan Kesawan; pada kehidupan dengan tidur tidak menentu; pada kaki-kaki lima dan emper pertokoan; juga pada kehidupan yang Ia jalani dengan menjual karcis bioskop, menjual es lilin, dll.'),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                          'Dari perjalanan hidup Lafran dapat diketahui bahwa struktur fundamental independensi diri Lafran terletak pada kesediaan dan keteguhan Dia untuk terus secara kritis mencari kebenaran sejati dengan tanpa lelah, dimana saja, kepada saja, dan kapan saja.'),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                          'Adapun latar belakang pemikirannya dalam pendirian HMI adalah: “Melihat dan menyadari keadaan kehidupan mahasiswa yang beragama Islam pada waktu itu, yang pada umumnya belum memahami dan mengamalkan ajaran agamanya. Keadaan yang demikian adalah akibat dari sitem pendidikan dan kondisi masyarakat pada waktu itu. Karena itu perlu dibentuk organisasi untuk merubah keadaan tersebut. Organisasi mahasiswa ini harus mempunyai kemampuan untuk mengikuti alam pikiran mahasiswa yang selalu menginginkan inovasi atau pembaharuan dalam segala bidang, termasuk pemahaman dan penghayatan ajaran agamanya, yaitu agama Islam. Tujuan tersebut tidak akan terlaksana kalau NKRI tidak merdeka, rakyatnya melarat. Maka organisasi ini harus turut mempertahankan Negara Republik Indonesia kedalam dan keluar, serta ikut memperhatikan dan mengusahakan kemakmuran rakyat”'),
                    ],
                  ),
                )
              ],
            )),
          );
        });
  }
}
