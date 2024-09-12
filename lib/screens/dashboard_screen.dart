import 'package:fire_detection/dummy.dart';
import 'package:fire_detection/providers/user_provider.dart';
import 'package:fire_detection/widgets/custom_tiles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final UserProvider userProvider = UserProvider();

  final route = [
    '/profile',
    '/admins',
    '/users',
    '/zones',
    '/captors',
    '/notifications',
  ];
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> params = [
      {
        'title': 'Profile',
        'icon': CupertinoIcons.person_fill,
        'bgColor': const Color(0xff1171D8),
        'count': null,
      },
      {
        'title': 'Administrateurs',
        'icon': Icons.admin_panel_settings_rounded,
        'bgColor': const Color(0xff10B991),
        'count': context.watch<UserProvider>().adminsUsers.length,
      },
      {
        'title': 'Utilisateurs',
        'icon': CupertinoIcons.person_2_fill,
        'bgColor': const Color(0xffF97216),
        'count': context.watch<UserProvider>().users.length,
      },
      {
        'title': 'Zones',
        'icon': Icons.location_on,
        'bgColor': const Color(0xffAB59F9),
        'count': zones.length,
      },
      {
        'title': 'Capteurs',
        'icon': 'images/capteur-icon.png',
        'bgColor': const Color(0xff3B82F6),
        'count': capteurs.length,
      },
      {
        'title': 'Notifications',
        'icon': CupertinoIcons.bell,
        'bgColor': const Color(0xff1DD3D9),
        'count': 0,
      },
    ];

    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          leading: Container(),
          leadingWidth: 0,
          title: const Text(
            'Tableau de bord',
          ),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.exit_to_app_outlined,
              ),
              onPressed: () {
                Navigator.of(context).pushNamed('/signIn');
              },
            ),
          ],
        ),
        backgroundColor: const Color(0xff1171D8),
        body: CustomScrollView(
          controller: ScrollController(),
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 25),
                    padding: const EdgeInsets.all(3),
                    decoration: const ShapeDecoration(
                      // ignore: unnecessary_const
                      shape: const CircleBorder(
                        side: BorderSide(color: Colors.white, width: 2),
                      ),
                    ),
                    child: const CircleAvatar(
                      radius: 40,
                      backgroundColor: Color(0xFFC5CCD3),
                      child: Icon(
                        CupertinoIcons.person_fill,
                        size: 45,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Doh Desirée',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                  const Text(
                    '(Administrateur)',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 25),
              sliver: SliverGrid.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: 1.0,
                ),
                itemCount: params.length,
                itemBuilder: (context, index) => CustomGridTile(
                  icon: params[index]['icon'],
                  title: params[index]['title'],
                  bgColor: params[index]['bgColor'],
                  count: params[index]['count'],
                  route: route[index],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
