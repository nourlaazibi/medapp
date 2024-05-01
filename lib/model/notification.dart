import 'dart:convert';

class Notification {
  int? id;
  String? title;
  String? body;
  String? icon;
  String? date;

  Notification({
    this.id,
    this.title,
    this.body,
    this.icon,
    this.date,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'body': body,
      'icon': icon,
      'date': date,
    };
  }

  factory Notification.fromMap(Map<String, dynamic>? map) {
    if (map == null) return Notification();

    return Notification(
      id: map['id'],
      title: map['title'],
      body: map['body'],
      icon: map['icon'],
      date: map['date'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Notification.fromJson(String source) =>
      Notification.fromMap(json.decode(source));
}

final notifications = [
  Notification(
    title: 'Appointment reminder',
    body: 'Don\'t forget your next appointment with doctor Tawfiq tomorrow',
    icon: 'assets/images/reminder.png',
    date: '2h',
  ),
  Notification(
    title: 'Health tips',
    body: 'Consume less salt and sugar.',
    icon: 'assets/images/tip.png',
    date: '1d',
  ),
  Notification(
    title: 'Appointment confirmation',
    body: 'Doctor Tawfiq Bahri confirmed your booking appointment',
    icon: 'assets/images/confirmation.png',
    date: '1d',
  ),
  Notification(
    title: 'Medical Check up Reminder',
    body: 'Don\'t forget to do your monthly medical check up',
    icon: 'assets/images/reminder.png',
    date: '1 week',
  ),
  Notification(
    title: 'Prescription Reminder',
    body: 'Contact doctor Liana about the last visit prescription',
    icon: 'assets/images/reminder.png',
    date: '1 week',
  ),
];
