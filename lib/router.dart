import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_ui/common/widgets/error_widget.dart';
import 'package:whatsapp_ui/features/auth/screens/otp_screen.dart';
import 'package:whatsapp_ui/features/auth/screens/user_information_screen.dart';
import 'package:whatsapp_ui/features/select_contacts/screens/select_contacts_screen.dart';
import 'package:whatsapp_ui/responsive/screens/mobile_chat_screen.dart';
import 'package:whatsapp_ui/responsive/screens/mobile_screen_layout.dart';

import 'features/auth/screens/login_screen.dart';
import 'features/landing/screens/landing_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(
        builder: (_) => const LandingScreen(),
      );
    case LoginScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const LoginScreen(),
      );
    case OTPScreen.routeName:
      final verificationId = settings.arguments as String;
      return MaterialPageRoute(
        builder: (_) => OTPScreen(
          verificationId: verificationId,
        ),
      );
    case UserInformationScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const UserInformationScreen(),
      );
    case MobileScreenLayout.routeName:
      return MaterialPageRoute(
        builder: (_) => const MobileScreenLayout(),
      );
    case SelectContactsScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const SelectContactsScreen(),
      );
    case MobileChatScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const MobileChatScreen(),
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
