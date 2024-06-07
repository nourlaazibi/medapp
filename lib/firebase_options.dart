// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCoVhwaSkAjG5bbBeBWAO1HK0D_dMe3uWU',
    appId: '1:291249992911:android:d1630a074f367f77fdf3ba',
    messagingSenderId: '291249992911',
    projectId: 'nk-medical-e4ea5',
    databaseURL: 'https://nk-medical-e4ea5-default-rtdb.firebaseio.com',
    storageBucket: 'nk-medical-e4ea5.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBgQ8SY2g9XJtmaXwWljKC22OK1jQ-I8Xc',
    appId: '1:291249992911:ios:78c6d5fd4e476f9ffdf3ba',
    messagingSenderId: '291249992911',
    projectId: 'nk-medical-e4ea5',
    databaseURL: 'https://nk-medical-e4ea5-default-rtdb.firebaseio.com',
    storageBucket: 'nk-medical-e4ea5.appspot.com',
    androidClientId: '291249992911-hqripqpvk447jmqej8cp7jvtjj66qhlo.apps.googleusercontent.com',
    iosClientId: '291249992911-6il7mi2eineb6rkcgv239nbnqvuvcjgf.apps.googleusercontent.com',
    iosBundleId: 'com.thenone.medapp',
  );

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCaLEtS8zY41MbeUxOlnDFTfgrL0O92AV4',
    appId: '1:291249992911:web:1a1fb6b4596a5ff0fdf3ba',
    messagingSenderId: '291249992911',
    projectId: 'nk-medical-e4ea5',
    authDomain: 'nk-medical-e4ea5.firebaseapp.com',
    databaseURL: 'https://nk-medical-e4ea5-default-rtdb.firebaseio.com',
    storageBucket: 'nk-medical-e4ea5.appspot.com',
  );

}