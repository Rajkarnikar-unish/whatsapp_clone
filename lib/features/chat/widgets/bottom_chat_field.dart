import 'dart:io';

import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_ui/common/enums/message_enum.dart';
import 'package:whatsapp_ui/common/utils/utils.dart';

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
  bool isShowEmojiPicker = false;
  FocusNode focusNode = FocusNode();

  void sendTextMessage() async {
    if (showSendButton) {
      ref.read(chatControllerProvider).sendTextMessage(
            context,
            _messageController.text.trim(),
            widget.receiverUserId,
          );
      _messageController.text = '';
      setState(() {});
    }
  }

  void sendFileMessage(
    File file,
    MessageEnum messageEnum,
  ) {
    ref.read(chatControllerProvider).sendFileMessage(
          context,
          file,
          widget.receiverUserId,
          messageEnum,
        );
  }

  void selectImage() async {
    File? image = await pickImageFromGallery(context);

    if (image != null) {
      sendFileMessage(image, MessageEnum.image);
    }
  }

  void selectVideo() async {
    File? video = await pickVideoFromGallery(context);

    if (video != null) {
      sendFileMessage(video, MessageEnum.video);
    }
  }

  void hideEmojiPicker() {
    setState(() {
      isShowEmojiPicker = false;
    });
  }

  void showEmojiPicker() {
    setState(() {
      isShowEmojiPicker = true;
    });
  }

  void showKeyboard() => focusNode.requestFocus();
  void hideKeyboard() => focusNode.unfocus();

  void toggleEmojiKeyboardContainer() {
    if (isShowEmojiPicker) {
      showKeyboard();
      hideEmojiPicker();
    } else {
      hideKeyboard();
      showEmojiPicker();
    }
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
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
                        focusNode: focusNode,
                        controller: _messageController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: IconButton(
                            icon: const Icon(
                              Icons.emoji_emotions,
                              color: Colors.grey,
                            ),
                            onPressed: toggleEmojiKeyboardContainer,
                          ),
                          hintText: 'Message',
                          hintStyle: const TextStyle(
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
                    IconButton(
                      onPressed: selectVideo,
                      icon: const Icon(
                        Icons.attach_file,
                        color: Colors.grey,
                      ),
                    ),
                    IconButton(
                      onPressed: selectImage,
                      icon: const Icon(
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
        ),
        isShowEmojiPicker
            ? SizedBox(
                height: 250,
                child: EmojiPicker(
                  onEmojiSelected: (((category, emoji) {
                    setState(() {
                      _messageController.text =
                          _messageController.text + emoji.emoji;
                    });

                    if (!showSendButton) {
                      setState(() {
                        showSendButton = true;
                      });
                    }
                  })),
                ),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
