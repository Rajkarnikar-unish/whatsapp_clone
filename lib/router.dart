import 'package:flutter/material.dart';
import 'package:whatsapp_ui/common/widgets/error_widget.dart';
import 'package:whatsapp_ui/responsive/screens/mobile_screen_layout.dart';

import 'features/auth/screens/login_screen.dart';
import 'features/landing/screens/landing_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(
        builder: (_) => const LandingScreen(),
      );
    case '/login-screen':
      return MaterialPageRoute(
        builder: (_) => const LoginScreen(),
      );
    case '/mobile-screen-layout':
      return MaterialPageRoute(
        builder: (_) => const MobileScreenLayout(),
      );
    default:
      return MaterialPageRoute(
        builder: (_) => const Scaffold(
          body: ErrorScreen(
            error: 'Looks like you\'re lost.',
          ),
        ),
      );
  }
}
