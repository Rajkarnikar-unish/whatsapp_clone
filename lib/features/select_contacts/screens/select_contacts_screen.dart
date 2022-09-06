import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_ui/features/select_contacts/controller/select_contact_controller.dart';
import 'package:whatsapp_ui/widgets/loader.dart';

import '../../../colors.dart';
import '../../../common/widgets/error_widget.dart';

class SelectContactsScreen extends ConsumerWidget {
  static const routeName = '/select-contacts-screen';
  const SelectContactsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Contact'),
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            Icons.chevron_left,
            color: Colors.white,
            size: 30,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      body: ref.watch(getContactsProvider).when(
            data: (contactList) => ListView.builder(
              itemBuilder: ((context, index) {
                final contact = contactList[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.grey,
                  ),
                  title: Text(contact.displayName),
                );
              }),
              itemCount: contactList.length,
            ),
            error: (err, trace) => ErrorScreen(
              error: err.toString(),
            ),
            loading: () => const Loader(),
          ),
    );
  }
}
