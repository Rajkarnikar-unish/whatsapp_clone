import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:whatsapp_ui/colors.dart';
import 'package:whatsapp_ui/features/chat/controller/chat_controller.dart';
import 'package:whatsapp_ui/info.dart';
import 'package:whatsapp_ui/features/chat/screens/mobile_chat_screen.dart';
import 'package:whatsapp_ui/models/chat_contact.dart';

import 'loader.dart';

class ContactList extends ConsumerWidget {
  const ContactList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: StreamBuilder<List<ChatContact>>(
        stream: ref.watch(chatControllerProvider).chatContacts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Loader();
          }
          return ListView.builder(
            shrinkWrap: true,
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final chatContactData = snapshot.data![index];
              return Column(
                children: [
                  InkWell(
                    onTap: () => Navigator.pushNamed(
                      context,
                      MobileChatScreen.routeName,
                      arguments: {
                        'name': chatContactData.name,
                        'uid': chatContactData.contactId,
                      },
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: ListTile(
                        title: Text(
                          chatContactData.name,
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(top: 6),
                          child: Text(
                            chatContactData.lastMessage,
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                            chatContactData.profilePic,
                          ),
                          radius: 30,
                        ),
                        trailing: Text(
                          DateFormat.Hm().format(chatContactData.timeSent),
                          style: const TextStyle(
                            fontSize: 13,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Divider(
                    color: dividerColor,
                    indent: 85,
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
