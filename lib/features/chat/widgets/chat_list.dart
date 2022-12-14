import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:whatsapp_ui/features/chat/controller/chat_controller.dart';
import 'package:whatsapp_ui/models/message.dart';
import 'package:whatsapp_ui/widgets/widgets.dart';
import 'widgets.dart';

class ChatList extends ConsumerStatefulWidget {
  const ChatList({
    Key? key,
    required this.receiverId,
  }) : super(key: key);
  final String receiverId;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ChatListState();
}

class _ChatListState extends ConsumerState<ChatList> {
  final ScrollController messageController = ScrollController();

  @override
  void dispose() {
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Message>>(
      stream: ref.read(chatControllerProvider).chatStream(widget.receiverId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Loader();
        }

        SchedulerBinding.instance.addPostFrameCallback((_) {
          messageController.jumpTo(messageController.position.maxScrollExtent);
        });

        return ListView.builder(
          controller: messageController,
          itemCount: snapshot.data!.length,
          itemBuilder: (context, index) {
            final messageData = snapshot.data![index];
            final timeSent = DateFormat.Hm().format(messageData.timeSent);
            if (messageData.senderId ==
                FirebaseAuth.instance.currentUser!.uid) {
              return MyMessageCard(
                message: messageData.text,
                time: timeSent,
                type: messageData.type,
              );
            }
            return SenderMessageCard(
              message: messageData.text,
              time: timeSent,
              type: messageData.type,
            );
          },
        );
      },
    );
  }
}
