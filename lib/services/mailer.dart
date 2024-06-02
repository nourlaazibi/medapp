import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';

Future<void> sendEmail(String recipient, String subject, String body) async {
  String username = 'nourazibi9@gmail.com';
  String password = 'zmdj oedp xooo xblo';

  final smtpServer = gmail(username, password);

  final message = Message()
    ..from = Address(username, 'MedApp')
    ..recipients.add(recipient)
    ..subject = subject
    ..text = body;

  try {
    final sendReport = await send(message, smtpServer);
    print('Message sent: ' + sendReport.toString());
  } on MailerException catch (e) {
    print('Message not sent.');
    for (var p in e.problems) {
      print('Problem: ${p.code}: ${p.msg}');
    }
  }
}
