import 'package:firebase_database/firebase_database.dart';
import 'package:medapp/model/message.dart';

class MessageService {
  final DatabaseReference _databaseReference =
      FirebaseDatabase.instance.ref().child('messages');

  Future<void> sendMessage(
      String sender, String receiver, MessageModel message) async {
    try {
      await _databaseReference
          .child("$sender/$receiver/${message.id}")
          .set(message.toMap());
      await _databaseReference
          .child("$receiver/$sender/${message.id}")
          .set(message.toMap());
      print('Message sent successfully');
    } catch (e) {
      print('Failed to send message: $e');
    }
  }

  Future<List<MessageModel>> getRecentMessages(String userId, int limit) async {
    List<MessageModel> messages = [];
    try {
      final snapshot = await _databaseReference.child("$userId").get();

      if (snapshot.exists) {
        Map<dynamic, dynamic> messageMap =
            snapshot.value as Map<dynamic, dynamic>;
        messageMap.forEach((doctorId, messageData) {
          if (messageData is Map) {
            messageData.forEach((key, value) {
              Map<String, dynamic> message = Map<String, dynamic>.from(value);
              print(message);
              messages.add(MessageModel.fromMap(message));
            });
          }
        });
        messages.sort((a, b) => b.timestamp.compareTo(a.timestamp));
        if (messages.length > limit) {
          messages = messages.take(limit).toList();
        }
      }
    } catch (e) {
      print('Failed to retrieve messages: $e');
    }
    return messages;
  }

  // Future<List<MessageModel>> getRecentMessages(String userId, int limit) async {
  //   List<MessageModel> messages = [];
  //   try {
  //     final snapshot = await _databaseReference
  //         .child("$userId")
  //         .orderByKey()
  //         .limitToLast(limit)
  //         .get();
  //     if (snapshot.exists) {
  //       Map<dynamic, dynamic> messageMap =
  //           snapshot.value as Map<dynamic, dynamic>;
  //       messageMap.forEach((key, value) {
  //         print("key $key \n value :$value");
  //         messages.add(MessageModel.fromMap(Map<String, dynamic>.from(value)));
  //       });
  //       messages.sort((a, b) => b.timestamp.compareTo(a.timestamp));
  //     }
  //   } catch (e) {
  //     print('Failed to retrieve messages: $e');
  //   }
  //   return messages;
  // }
}
