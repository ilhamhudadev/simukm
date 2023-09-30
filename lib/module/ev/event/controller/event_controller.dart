import 'package:get/get.dart';
import 'package:standard_project/module/ev/event/data/model/userevent.dart';

import 'package:standard_project/module/ev/event/data/repo/event_repo.dart';

class EventController extends GetxController with EventRepo {
  List<EventOrganization> organizationList = [
    EventOrganization(
        no: "Kegiatan 1",
        nama: "Webminar",
        jenis: "Pendidikan",
        waktu: "2 Januari 2023",
        tempat: "Gedung M",
        jumlah: "179 orang",
        gambar1:
            "https://asset.kompas.com/crops/bnQuJ7Uq0hRex2RLu1Ov9azmPsE=/0x0:780x520/750x500/data/photo/2019/03/27/2893229660.jpg",
        gambar2:
            "https://akcdn.detik.net.id/visual/2019/07/31/f21f3789-9569-48a2-82e7-b80a60f843a0_169.jpeg?w=650"),
    EventOrganization(
        no: "Kegiatan 2",
        nama: "Malam Keakraban",
        jenis: "Pendidikan",
        waktu: "7 Januari 2023",
        tempat: "Lembang",
        jumlah: "50 orang",
        gambar1:
            "https://awsimages.detik.net.id/community/media/visual/2021/08/09/aurora-australis-4.jpeg?w=1200",
        gambar2:
            "https://akcdn.detik.net.id/visual/2019/07/31/f21f3789-9569-48a2-82e7-b80a60f843a0_169.jpeg?w=650"),
    EventOrganization(
        no: "Kegiatan 3",
        nama: "Bengkel IT",
        jenis: "Pendidikan",
        waktu: "22 Februari 2023",
        tempat: "Sekretariat",
        jumlah: "20 orang",
        gambar1:
            "https://asset.kompas.com/crops/2xhHYV53-THKm0QXPhaJz8akknE=/0x0:926x618/1200x800/data/photo/2020/03/25/5e7b65444e677.jpg",
        gambar2:
            "https://www.kalderanews.com/wp-content/uploads/2022/12/Borealis-Basecamp-spot-untuk-menikmati-aurora-di-Alaska.jpg"),
    EventOrganization(
        no: "Kegiatan 4",
        nama: "Berbagi Nasi Bungkus",
        jenis: "Pengabdian Masyarakat",
        waktu: "3 Maret 2023",
        tempat: "Area Kampus",
        jumlah: "25 orang",
        gambar1:
            "https://awsimages.detik.net.id/community/media/visual/2023/03/01/pemandangan-langka-aurora-borealis-terlihat-di-seluruh-inggris.png?w=600&q=90",
        gambar2:
            "https://akcdn.detik.net.id/visual/2019/07/31/f21f3789-9569-48a2-82e7-b80a60f843a0_169.jpeg?w=650"),
    EventOrganization(
        no: "Kegiatan 5",
        nama: "Donor Darah",
        jenis: "Pengabdian Masyarakat",
        waktu: "14 April 2023",
        tempat: "Lapangan Tegalega",
        jumlah: "121 orang",
        gambar1:
            "https://asset.kompas.com/crops/bnQuJ7Uq0hRex2RLu1Ov9azmPsE=/0x0:780x520/750x500/data/photo/2019/03/27/2893229660.jpg",
        gambar2:
            "https://akcdn.detik.net.id/visual/2019/07/31/f21f3789-9569-48a2-82e7-b80a60f843a0_169.jpeg?w=650"),
    EventOrganization(
        no: "Kegiatan 6",
        nama: "Futsal Bersama",
        jenis: "Pengabdian Masyarakat",
        waktu: "22 April 2023",
        tempat: "Gor Binong",
        jumlah: "34 orang",
        gambar1:
            "https://asset.kompas.com/crops/bnQuJ7Uq0hRex2RLu1Ov9azmPsE=/0x0:780x520/750x500/data/photo/2019/03/27/2893229660.jpg",
        gambar2:
            "https://akcdn.detik.net.id/visual/2019/07/31/f21f3789-9569-48a2-82e7-b80a60f843a0_169.jpeg?w=650"),
    EventOrganization(
        no: "Kegiatan 7",
        nama: "Dies Natalies Starting Broadcast",
        jenis: "Pendidikan",
        waktu: "18 Mei 2023",
        tempat: "Bandung",
        jumlah: "39 orang",
        gambar1:
            "https://asset.kompas.com/crops/bnQuJ7Uq0hRex2RLu1Ov9azmPsE=/0x0:780x520/750x500/data/photo/2019/03/27/2893229660.jpg",
        gambar2:
            "https://akcdn.detik.net.id/visual/2019/07/31/f21f3789-9569-48a2-82e7-b80a60f843a0_169.jpeg?w=650"),
    EventOrganization(
        no: "Kegiatan 8",
        nama: "Sharing Bersama Alumni",
        jenis: "Pendidikan",
        waktu: "2 Juni 2023",
        tempat: "Gedung M",
        jumlah: "179 orang",
        gambar1:
            "https://asset.kompas.com/crops/bnQuJ7Uq0hRex2RLu1Ov9azmPsE=/0x0:780x520/750x500/data/photo/2019/03/27/2893229660.jpg",
        gambar2:
            "https://akcdn.detik.net.id/visual/2019/07/31/f21f3789-9569-48a2-82e7-b80a60f843a0_169.jpeg?w=650"),
    EventOrganization(
        no: "Kegiatan 9",
        nama: "Bercocok tanam HIMA IT",
        jenis: "Penelitian",
        waktu: "22 Juni 2023",
        tempat: "Gatot Kaca",
        jumlah: "79 orang",
        gambar1:
            "https://asset.kompas.com/crops/bnQuJ7Uq0hRex2RLu1Ov9azmPsE=/0x0:780x520/750x500/data/photo/2019/03/27/2893229660.jpg",
        gambar2:
            "https://akcdn.detik.net.id/visual/2019/07/31/f21f3789-9569-48a2-82e7-b80a60f843a0_169.jpeg?w=650"),
  ];
}
