import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../pages/appointment/appointment_detail_page.dart';
import '../pages/appointment/my_appointments_page.dart';
import '../pages/booking/filter/filter_page.dart';
import '../pages/booking/step1/health_concern_page.dart';
import '../pages/booking/step2/choose_doctor_page.dart';
import '../pages/booking/step3/time_slot_page.dart';
import '../pages/booking/step4/patient_details_page.dart';
import '../pages/booking/step5/appointment_booked_page.dart';
import '../pages/doctor/doctor_profile_page.dart';
import '../pages/doctor/my_doctor_list_page.dart';
import '../pages/forgot/forgot_password_page.dart';
import '../pages/home/home.dart';
import '../pages/language/change_laguage_page.dart';
import '../pages/login/login_page.dart';
import '../pages/messages/messages_detail_page.dart';
import '../pages/notifications/notification_settings_page.dart';
import '../pages/notifications/notifications_page.dart';
import '../pages/prescription/prescription_detail_page.dart';
import '../pages/profile/edit_profile_page.dart';
import '../pages/signup/signup_page.dart';
import '../pages/splash_page.dart';
import '../pages/visit/visit_detail_page.dart';
import 'routes.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    //final args = settings.arguments;

    switch (settings.name) {
      case Routes.splash:
        return CupertinoPageRoute(builder: (_) => SplashPage());

      case Routes.login:
        return CupertinoPageRoute(builder: (_) => LoginPage());

      case Routes.signup:
        return CupertinoPageRoute(builder: (_) => SignupPage());

      case Routes.forgotPassword:
        return CupertinoPageRoute(builder: (_) => ForgotPasswordPage());

      case Routes.home:
        return CupertinoPageRoute(builder: (_) => Home());

      case Routes.filter:
        return CupertinoPageRoute(
          builder: (_) => FilterPage(),
          fullscreenDialog: true,
        );

      case Routes.bookingStep1:
        return CupertinoPageRoute(
          builder: (_) => HealthConcernPage(),
          fullscreenDialog: true,
        );

      case Routes.bookingStep2:
        return CupertinoPageRoute(builder: (_) => ChooseDoctorPage());

      case Routes.bookingStep3:
        return CupertinoPageRoute(builder: (_) => TimeSlotPage());

      case Routes.bookingStep4:
        return CupertinoPageRoute(builder: (_) => PatientDetailsPage());

      case Routes.bookingStep5:
        return CupertinoPageRoute(builder: (_) => AppointmentBookedPage());

      case Routes.appointmentDetail:
        return CupertinoPageRoute(builder: (_) => AppointmentDetailPage());

      case Routes.visitDetail:
        return CupertinoPageRoute(builder: (_) => VisitDetailPage());

      case Routes.prescriptionDetail:
        return CupertinoPageRoute(builder: (_) => PrescriptionDetailPage());

      case Routes.chatDetail:
        return CupertinoPageRoute(builder: (_) => MessagesDetailPage());

      case Routes.doctorProfile:
        return CupertinoPageRoute(builder: (_) => DoctorProfilePage());

      case Routes.editProfile:
        return CupertinoPageRoute(builder: (_) => EditProfilePage());

      case Routes.changeLanguage:
        return CupertinoPageRoute(builder: (_) => ChangeLanguagePage());

      case Routes.notificationSettings:
        return CupertinoPageRoute(builder: (_) => NotificationSettingsPage());

      case Routes.myDoctors:
        return CupertinoPageRoute(builder: (_) => MyDoctorListPage());

      case Routes.myAppointments:
        return CupertinoPageRoute(builder: (_) => MyAppointmentsPage());

      case Routes.notifications:
        return CupertinoPageRoute(
          builder: (_) => NotificationsPage(),
          fullscreenDialog: true,
          maintainState: true,
        );

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return CupertinoPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('Error'),
        ),
      );
    });
  }
}
