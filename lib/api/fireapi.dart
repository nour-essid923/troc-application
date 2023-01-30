import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:project_application/models/ChatMessage.dart';
import 'package:project_application/models/User.dart';

import 'utils.dart';

class FirebaseApi {
  static Stream<List<User>> getUsers() => FirebaseFirestore.instance
      .collection('users')
      
      .snapshots()
      .transform(Utils.transformer(User.fromJson));

   Future uploadMessage(String uid, String message) async {
    final refMessages =
        FirebaseFirestore.instance.collection('chats/$uid/messages');

    //final newMessage = ChatMessage(
      //uid: myId,
      //urlAvatar: myUrlAvatar,
      //username: myUsername,
      //message: message,
      //createdAt: DateTime.now(),
      
    //);
    //await refMessages.add(newMessage.toJson());

    final refUsers = FirebaseFirestore.instance.collection('users');
    await refUsers
        .doc(uid);
        
  }

  
  static Future addRandomUsers(List<User> users) async {
    final refUsers = FirebaseFirestore.instance.collection('users');

    final allUsers = await refUsers.get();
    if (allUsers.size != 0) {
      return;
    } else {
      for (final user in users) {
        final userDoc = refUsers.doc();
        final newUser = user.copyWith(uid: userDoc.id);

        await userDoc.set(newUser.toJson());
      }
    }
  }
}
String myId = 'YB0XmxZ7KiZTHGtGRpue';
String myUsername = 'Barack Obama';
String myUrlAvatar = 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8d/President_Barack_Obama.jpg/480px-President_Barack_Obama.jpg';