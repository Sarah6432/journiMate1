// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyCqV_kIA7XrP_5FPz7o1dL9nIFyHDQer00',
    appId: '1:887957230669:web:55fa26f1772f2309afb804',
    messagingSenderId: '887957230669',
    projectId: 'journimate-6e114',
    authDomain: 'journimate-6e114.firebaseapp.com',
    storageBucket: 'journimate-6e114.appspot.com',
    measurementId: 'G-8NX33SJZ6J',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAMCvHRjV_zO4yZeQRcM6Idov2bLzTLA9w',
    appId: '1:887957230669:android:f05d5917a035189eafb804',
    messagingSenderId: '887957230669',
    projectId: 'journimate-6e114',
    storageBucket: 'journimate-6e114.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA02nnBM2B-W9W_tMlJPZNMQCrpYqzq4mw',
    appId: '1:887957230669:ios:1d88449c01cbd820afb804',
    messagingSenderId: '887957230669',
    projectId: 'journimate-6e114',
    storageBucket: 'journimate-6e114.appspot.com',
    iosBundleId: 'com.example.jounimate',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA02nnBM2B-W9W_tMlJPZNMQCrpYqzq4mw',
    appId: '1:887957230669:ios:1d88449c01cbd820afb804',
    messagingSenderId: '887957230669',
    projectId: 'journimate-6e114',
    storageBucket: 'journimate-6e114.appspot.com',
    iosBundleId: 'com.example.jounimate',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCqV_kIA7XrP_5FPz7o1dL9nIFyHDQer00',
    appId: '1:887957230669:web:4db4045430e3c7feafb804',
    messagingSenderId: '887957230669',
    projectId: 'journimate-6e114',
    authDomain: 'journimate-6e114.firebaseapp.com',
    storageBucket: 'journimate-6e114.appspot.com',
    measurementId: 'G-D22H6H93BJ',
  );
}
