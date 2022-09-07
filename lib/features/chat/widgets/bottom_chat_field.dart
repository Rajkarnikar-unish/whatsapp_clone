import 'package:flutter/material.dart';

import '../../../colors.dart';

class BottomChatField extends StatefulWidget {
  BottomChatField({
    Key? key,
  }) : super(key: key);

  @override
  State<BottomChatField> createState() => _BottomChatFieldState();
}

class _BottomChatFieldState extends State<BottomChatField> {
  final messageController = TextEditingController();
  bool showSendButton = false;

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
                    controller: messageController,
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
            child: IconButton(
              icon: Icon(
                // Icons.send,
                showSendButton ? Icons.send : Icons.mic,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
