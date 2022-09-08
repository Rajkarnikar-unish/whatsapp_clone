import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../colors.dart';
import '../controller/chat_controller.dart';

class BottomChatField extends ConsumerStatefulWidget {
  const BottomChatField({
    required this.receiverUserId,
    Key? key,
  }) : super(key: key);

  final String receiverUserId;

  @override
  ConsumerState<BottomChatField> createState() => _BottomChatFieldState();
}

class _BottomChatFieldState extends ConsumerState<BottomChatField> {
  final _messageController = TextEditingController();
  bool showSendButton = false;

  void sendTextMessage() async {
    if (showSendButton) {
      ref.read(chatControllerProvider).sendTextMessage(
            context,
            _messageController.text.trim(),
            widget.receiverUserId,
          );
    }
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.82,
            decoration: BoxDecoration(
              color: mobileChatBoxColor,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _messageController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.emoji_emotions,
                        color: Colors.grey,
                      ),
                      hintText: 'Message',
                      hintStyle: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    onChanged: (val) {
                      if (val.isNotEmpty) {
                        setState(() {
                          showSendButton = true;
                        });
                      } else {
                        setState(() {
                          showSendButton = false;
                        });
                      }
                    },
                  ),
                ),
                const IconButton(
                  onPressed: null,
                  icon: Icon(
                    Icons.attach_file,
                    color: Colors.grey,
                  ),
                ),
                const IconButton(
                  onPressed: null,
                  icon: Icon(
                    Icons.camera_alt,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          CircleAvatar(
            backgroundColor: tabColor,
            radius: 25,
            child: GestureDetector(
              onTap: sendTextMessage,
              child: Icon(
                // Icons.send,
                showSendButton ? Icons.send : Icons.mic,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
