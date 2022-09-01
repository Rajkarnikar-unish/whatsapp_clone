import 'package:flutter/material.dart';
import 'package:whatsapp_ui/colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static String routeName = '/login-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enter your phone number'),
        elevation: 0,
        backgroundColor: backgroundColor,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            Icons.chevron_left,
            color: Colors.white,
            size: 30,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          const Text(
            'WhatsApp will need to verify your phone number.',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
