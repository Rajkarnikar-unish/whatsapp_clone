import 'package:flutter/material.dart';
import 'package:whatsapp_ui/widgets/contacts_list.dart';

import '../../widgets/web_profile_bar.dart';

class WebScreenLayout extends StatelessWidget {
  const WebScreenLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  WebProfileBar(),
                  //WebSearch Bar
                  ContactList(),
                ],
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.75,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/backgroundImage.png',
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(child: Text('THIS IS UNISH')),
          ),
        ],
      ),
    );
  }
}
