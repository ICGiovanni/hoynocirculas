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
        return macos;
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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBQjyZaAAZDEXLVJEHIImdKI5Fl4AB0G3g',
    appId: '1:1045056283233:web:db91be257e530cd74e0020',
    messagingSenderId: '1045056283233',
    projectId: 'hoy-no-circulas-dev',
    authDomain: 'hoy-no-circulas-dev.firebaseapp.com',
    storageBucket: 'hoy-no-circulas-dev.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBs64Vrhbn26ZWr5Bal_qZk2ylBMcwu0SI',
    appId: '1:1045056283233:android:115f07930bc0ec3f4e0020',
    messagingSenderId: '1045056283233',
    projectId: 'hoy-no-circulas-dev',
    storageBucket: 'hoy-no-circulas-dev.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD8UyUGcLKWaaAqU06LXn9JCdewZGxF7Rs',
    appId: '1:1045056283233:ios:347c92ceac8beb474e0020',
    messagingSenderId: '1045056283233',
    projectId: 'hoy-no-circulas-dev',
    storageBucket: 'hoy-no-circulas-dev.appspot.com',
    iosBundleId: 'com.example.hoyNoCirculas',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD8UyUGcLKWaaAqU06LXn9JCdewZGxF7Rs',
    appId: '1:1045056283233:ios:45bda11dc13880884e0020',
    messagingSenderId: '1045056283233',
    projectId: 'hoy-no-circulas-dev',
    storageBucket: 'hoy-no-circulas-dev.appspot.com',
    iosBundleId: 'com.example.hoyNoCirculas.RunnerTests',
  );
}