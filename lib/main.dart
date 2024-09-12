import 'package:fire_detection/providers/capteur_provider.dart';
import 'package:fire_detection/providers/user_provider.dart';
import 'package:fire_detection/providers/zone_provider.dart';
import 'package:fire_detection/screens/admins_screen.dart';
import 'package:fire_detection/screens/captors_screen.dart';
import 'package:fire_detection/screens/notifications_screen.dart';
import 'package:fire_detection/screens/profile_screen.dart';
import 'package:fire_detection/screens/sign_in_screen.dart';
import 'package:fire_detection/screens/sign_up_screen.dart';
import 'package:fire_detection/screens/users_screen.dart';
import 'package:fire_detection/screens/zones_screen.dart';
import 'package:flutter/material.dart';

import 'package:fire_detection/screens/dashboard_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserProvider>(create: (_) => UserProvider()),
        ChangeNotifierProvider<ZoneProvider>(create: (_) => ZoneProvider()),
        ChangeNotifierProvider<CapteurProvider>(
            create: (_) => CapteurProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          appBarTheme: const AppBarTheme(
            foregroundColor: Colors.white,
            titleTextStyle: TextStyle(
                color: Colors.white, fontSize: 22, fontWeight: FontWeight.w500),
            backgroundColor: Color(0xff1171D8),
            actionsIconTheme: IconThemeData(
              color: Colors.white,
              size: 35,
            ),
          ),
        ),
        // home: const DashboardPage(),
        routes: {
          '/': (_) => const DashboardPage(),
          '/dashboard': (_) => const DashboardPage(),
          '/admins': (_) => const AdminsScreen(),
          '/zones': (_) => const ZonesScreen(),
          '/users': (_) => const UsersScreen(),
          '/notifications': (_) => const NotificationsScreen(),
          '/profile': (_) => const ProfileScreen(),
          '/captors': (_) => const CaptorsScreen(),
          '/signIn': (_) => const SignInScreen(),
          '/signUp': (_) => const SignUpScreen(),
        },
      ),
    );
  }
}
