import 'package:flutter/material.dart';
import 'package:whatsapp_ui/colors.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sizeMediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            const Text(
              'Welcome to WhatsApp',
              style: TextStyle(
                fontSize: 33,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: sizeMediaQuery.height / 9),
            Image.asset(
              'assets/bg.png',
              height: 340,
              width: 340,
              color: tabColor,
            ),
            SizedBox(height: sizeMediaQuery.height / 9),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Read our Privacy Policy Tap, "Agree and continue" to accept the Terms of Service.',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: greyColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
