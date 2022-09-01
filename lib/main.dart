import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_ui/colors.dart';
import 'package:whatsapp_ui/features/auth/screens/login_screen.dart';
import 'package:whatsapp_ui/responsive/responsive_layout.dart';
import 'package:whatsapp_ui/responsive/screens/mobile_screen_layout.dart';
import 'package:whatsapp_ui/responsive/screens/web_screen_layout.dart';

import 'features/landing/screens/landing_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WhatsAppClone',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor,
      ),
      home: const LandingScreen(),
      initialRoute: LandingScreen.routeName,
      routes: {
        LandingScreen.routeName: (context) => const LandingScreen(),
        LoginScreen.routeName: (context) => const LoginScreen(),
        MobileScreenLayout.routeName: (context) => const MobileScreenLayout(),
      },
      //  const ResponsiveLayout(
      //   mobileLayout: MobileScreenLayout(),
      //   webLayout: WebScreenLayout(),
      // ),
    );
  }
}
