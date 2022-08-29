import 'package:flutter/material.dart';
import 'package:whatsapp_ui/widgets/contacts_list.dart';

import '../../widgets/chat_list.dart';
import '../../widgets/web_chat_appbar.dart';
import '../../widgets/web_profile_bar.dart';
import '../../widgets/web_search_bar.dart';

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
                children: const [
                  WebProfileBar(),
                  WebSearchBar(),
                  ContactList(),
                ],
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.75,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/backgroundImage.png',
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                WebChatAppbar(),
                Expanded(
                  child: ChatList(),
                ),
                //Message Input Box
              ],
            ),
          ),
        ],
      ),
    );
  }
}
