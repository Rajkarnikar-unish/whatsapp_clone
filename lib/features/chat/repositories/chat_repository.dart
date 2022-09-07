import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_ui/common/utils/utils.dart';

import '../../../models/user_model.dart';

class ChatRepository {
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;
  ChatRepository({
    required this.firestore,
    required this.auth,
  });

  void sendTextMessage({
    required BuildContext context,
    required String text,
    required String receiverUserId,
    required UserModel senderUserModel,
  }) async {
    //users-> sender id-> receiver id-> messages-> message id-> store message
    try {
      var timeSent = DateTime.now();
      UserModel receiverUserData;

      var userDataMap =
          await firestore.collection('users').doc(receiverUserId).get();

      receiverUserData = UserModel.fromMap(userDataMap.data()!);

      //users->receiver user id-> chats -> current user id -> set data
      void _saveDataToContactsSubCollection(
        UserModel senderUserData,
        UserModel receiverUserData,
        String text,
        DateTime timeSent,
        String receiverUserId,
      ) async {}
    } catch (e) {
      showSnackBar(context: context, content: e.toString());
    }
  }
}
