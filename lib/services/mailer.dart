import 'package:emailjs/emailjs.dart';
import 'package:intl/intl.dart';
import 'package:medapp/model/user.dart';

Future<void> sendEmail(
    UserModel userModel, String doctor, DateTime dateTime) async {
  final String serviceId = 'service_g8cwoya';
  final String templateId = 'template_dl0h12e';
  final templateParams = {
    'to_name': userModel.firstName,
    'receiver': userModel.email,
    'doctor_name': doctor,
    'date': DateFormat('dd/MM/yyyy').format(dateTime),
    'time': DateFormat('HH:mm').format(dateTime)
  };
  try {
    await EmailJS.send(
      serviceId,
      templateId,
      templateParams,
      const Options(
        publicKey: 'ODqFSdO0VTPRC3zlM',
        privateKey: 'Pu-dGBrRvNj6wPfNPWWiW',
      ),
    );
    print('SUCCESS!');
  } catch (error) {
    print(error.toString());
  }
}
