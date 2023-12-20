import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:standard_project/core/assets/app_assets.dart';
import 'package:standard_project/module/ab/profileukm/screen/Decree_screen.dart';
import 'package:standard_project/module/ab/profileukm/screen/organizationalStructure_screen.dart';
import 'package:standard_project/module/ab/profileukm/screen/report_screen.dart';
import 'package:standard_project/module/ab/profileukm/screen/visimisi_screen.dart';
import 'package:standard_project/module/ac/achievement/screen/achievement_screen.dart';
import 'package:standard_project/module/ev/event/screen/event_screen.dart';
import 'package:standard_project/module/me/profile/screen/profile_screen.dart';
import 'package:standard_project/module/me/usermanagement/screen/usermanagement_screen.dart';
import 'package:standard_project/module/mr/listukm/data/repo/listukm_repo.dart';
import 'package:standard_project/module/mr/listukm/screen/listukm_screen.dart';
import 'package:standard_project/module/pr/proposal/screen/proposal_screen.dart';

class SideBarScreen extends StatelessWidget {
  SideBarScreen({Key? key}) : super(key: key);

  final _controller = SidebarXController(selectedIndex: 0, extended: true);
  final _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: primaryColor,
        canvasColor: canvasColor,
        scaffoldBackgroundColor: scaffoldBackgroundColor,
        textTheme: const TextTheme(
          headlineSmall: TextStyle(
            color: Colors.white,
            fontSize: 46,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      home: Builder(
        builder: (context) {
          final isSmallScreen = MediaQuery.of(context).size.width < 600;
          return Scaffold(
            key: _key,
            appBar: isSmallScreen
                ? AppBar(
                    backgroundColor: canvasColor,
                    title: Text(_getTitleByIndex(_controller.selectedIndex)),
                    leading: IconButton(
                      onPressed: () {
                        // if (!Platform.isAndroid && !Platform.isIOS) {
                        //   _controller.setExtended(true);
                        // }
                        _key.currentState?.openDrawer();
                      },
                      icon: const Icon(Icons.menu),
                    ),
                  )
                : null,
            drawer: ExampleSidebarX(controller: _controller),
            body: Row(
              children: [
                if (!isSmallScreen) ExampleSidebarX(controller: _controller),
                Expanded(
                  child: Center(
                    child: _ScreensExample(
                      controller: _controller,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class ExampleSidebarX extends StatelessWidget {
  const ExampleSidebarX({
    Key? key,
    required SidebarXController controller,
  })  : _controller = controller,
        super(key: key);

  final SidebarXController _controller;

  @override
  Widget build(BuildContext context) {
    return SidebarX(
      controller: _controller,
      theme: SidebarXTheme(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: canvasColor,
          borderRadius: BorderRadius.circular(20),
        ),
        hoverColor: scaffoldBackgroundColor,
        textStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
        selectedTextStyle: const TextStyle(color: Colors.white),
        itemTextPadding: const EdgeInsets.only(left: 30),
        selectedItemTextPadding: const EdgeInsets.only(left: 30),
        itemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: canvasColor),
        ),
        selectedItemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: actionColor.withOpacity(0.37),
          ),
          gradient: const LinearGradient(
            colors: [accentCanvasColor, canvasColor],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.28),
              blurRadius: 30,
            )
          ],
        ),
        iconTheme: IconThemeData(
          color: Colors.white.withOpacity(0.7),
          size: 20,
        ),
        selectedIconTheme: const IconThemeData(
          color: Colors.white,
          size: 20,
        ),
      ),
      extendedTheme: const SidebarXTheme(
        width: 200,
        decoration: BoxDecoration(
          color: canvasColor,
        ),
      ),
      footerDivider: divider,
      headerBuilder: (context, extended) {
        return
            //  Text("SIM Nilai")
            Center(
                child: Container(
          margin: EdgeInsets.all(50),
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    'https://tse4.mm.bing.net/th?id=OIP.v2EJ6yhWzDCJ_v6qIXWlrgHaHa&pid=Api&P=0&h=180'),
                fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(100),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 4,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
        ));
      },
      items: [
        SidebarXItem(
          icon: Icons.home,
          label: 'Dashboard',
          onTap: () {
            debugPrint('Dashboard');
          },
        ),
        const SidebarXItem(
          icon: Icons.person_pin_outlined,
          label: 'Profile',
        ),
        const SidebarXItem(
          icon: Icons.info_outline_sharp,
          label: 'List UKM',
        ),
        const SidebarXItem(
          icon: Icons.file_open_sharp,
          label: 'Struktur Organisasi',
        ),
        const SidebarXItem(
          icon: Icons.supervised_user_circle_sharp,
          label: 'SK Kepengurusan',
        ),
        const SidebarXItem(
          icon: Icons.person_pin,
          label: 'Laporan Penanggung Jawab',
        ),
        const SidebarXItem(
          icon: Icons.nature_people,
          label: 'Kegiatan Mahasiswa',
        ),
        const SidebarXItem(
          icon: Icons.data_array_outlined,
          label: 'Prestasi UKM',
        ),
        const SidebarXItem(
          icon: Icons.pages_sharp,
          label: 'Proposal',
        ),
        // const SidebarXItem(
        //   icon: Icons.person_3,
        //   label: 'Visi Misi',
        // ),
        SidebarXItem(
          onTap: () {},
          icon: Icons.logout_outlined,
          // iconWidget: FlutterLogo(size: 20),
          label: 'Logout',
        ),
      ],
    );
  }
}

class _ScreensExample extends StatelessWidget {
  const _ScreensExample({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final SidebarXController controller;

  Widget buildItem(String title, int value) {
    return GestureDetector(
      onTap: () {
        // Tambahkan aksi yang diinginkan ketika item diklik
        print('$title di-klik!');
      },
      child: Card(
        color: Colors.white, // Set warna latar belakang card menjadi putih
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            width: 200,
            height: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    width: 150,
                    child: Center(
                        child: Text(title, style: TextStyle(fontSize: 20)))),
                SizedBox(
                  height: 20,
                ),
                Text(
                  value.toString(),
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        final pageTitle = _getTitleByIndex(controller.selectedIndex);
        switch (controller.selectedIndex) {
          case 0:
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildItem('Total Proposal', 2),
                  buildItem('Total Surat Keputusan', 2),
                  buildItem('Total Event', 2),
                  buildItem('Total Laporan Pertanggung Jawaban', 3),
                ],
              ),
            );
          //dashboard
          case 1:
            return ProfileScreen();
          // dashboard
          case 2:
            return UsermanagementScreen();
          // KHS Kelas
          case 3:
            return OrganizationalStruktureScreen();
          // KHS NPM
          case 4:
            return DecreeScreen();
          //Transkrip NPM
          case 5:
            return ReportScreen();
          // Data Dosen
          case 6:
            return EventScreen();
          //  Profile
          case 7:
            return AchievementScreen();
          //  Profile
          case 8:
            return ProposalScreen();
          //  Profile
          // case 9:
          //   return VisiMisiScreen();
          // //  Profile
          default:
            return Text(
              pageTitle,
              style: theme.textTheme.headlineSmall,
            );
        }
      },
    );
  }
}

String _getTitleByIndex(int index) {
  switch (index) {
    case 0:
      return 'Home';
    case 1:
      return 'Search';
    case 2:
      return 'People';
    case 3:
      return 'Favorites';
    case 4:
      return 'Custom iconWidget';
    case 5:
      return 'Profile';
    case 6:
      return 'Settings';
    default:
      return 'Not found page';
  }
}

const primaryColor = Color(0xFF685BFF);
const canvasColor = Color(0xFF2E2E48);
const scaffoldBackgroundColor = Color(0xFF464667);
const accentCanvasColor = Color(0xFF3E3E61);
const white = Colors.white;
final actionColor = const Color(0xFF5F5FA7).withOpacity(0.6);
final divider = Divider(color: white.withOpacity(0.3), height: 1);
