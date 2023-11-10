import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:standard_project/core/assets/app_assets.dart';
import 'package:standard_project/module/ab/profileukm/screen/Decree_screen.dart';
import 'package:standard_project/module/ab/profileukm/screen/organizationalStructure_screen.dart';
import 'package:standard_project/module/ab/profileukm/screen/report_screen.dart';
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
        return SizedBox(
          height: 100,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child:
                //  Text("SIM Nilai")
                Image.asset(AppAssets.logoPiksi),
          ),
        );
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
          icon: Icons.file_present,
          label: 'Profile',
        ),
        const SidebarXItem(
          icon: Icons.file_present,
          label: 'User Management',
        ),
        const SidebarXItem(
          icon: Icons.file_present,
          label: 'Struktur Organisasi',
        ),
        const SidebarXItem(
          icon: Icons.supervised_user_circle_sharp,
          label: 'SK Kepengurusan',
        ),
        const SidebarXItem(
          icon: Icons.person_3,
          label: 'Laporan Penanggung Jawab',
        ),
        const SidebarXItem(
          icon: Icons.person_3,
          label: 'Kegiatan Mahasiswa',
        ),
        const SidebarXItem(
          icon: Icons.person_3,
          label: 'Prestasi UKM',
        ),
        const SidebarXItem(
          icon: Icons.person_3,
          label: 'Proposal',
        ),
        const SidebarXItem(
          icon: Icons.person_3,
          label: 'List UKM',
        ),
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

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        final pageTitle = _getTitleByIndex(controller.selectedIndex);
        switch (controller.selectedIndex) {
          case 0:
            return ListView.builder(
              padding: const EdgeInsets.only(top: 10),
              itemBuilder: (context, index) => Container(
                height: 100,
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 10, right: 10, left: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Theme.of(context).canvasColor,
                  boxShadow: const [BoxShadow()],
                ),
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
          case 9:
            return ListukmScreen();
          //  Profile
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
