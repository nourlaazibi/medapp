import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medapp/model/notification.dart';

class NotificationDB {

  final CollectionReference<Map<String, dynamic>> _notificationsRef =
      FirebaseFirestore.instance.collection('notifications');

  Future<void> addNotification(MyNotification notification) async {
    try {
      await _notificationsRef.doc(notification.id).set(notification.toMap());
    } catch (e) {
      print('Error adding notification: $e');
    }
  }

  Future<List<MyNotification>> fetchAllNotifications() async {
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot =
          await _notificationsRef.get();
      return snapshot.docs
          .map((doc) => MyNotification.fromMap(doc.data()))
          .toList();
    } catch (e) {
      print('Error fetching notifications: $e');
      return [];
    }
  }

  Future<MyNotification?> getNotificationById(String id) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> doc =
          await _notificationsRef.doc(id).get();
      if (doc.exists) {
        return MyNotification.fromMap(doc.data()!);
      } else {
        return null;
      }
    } catch (e) {
      print('Error getting notification: $e');
      return null;
    }
  }

  Future<void> updateNotification(String id, MyNotification notification) async {
    try {
      await _notificationsRef.doc(id).update(notification.toMap());
    } catch (e) {
      print('Error updating notification: $e');
    }
  }

  Future<void> deleteNotification(String id) async {
    try {
      await _notificationsRef.doc(id).delete();
    } catch (e) {
      print('Error deleting notification: $e');
    }
  }
}
