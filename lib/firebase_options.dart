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
    apiKey: 'AIzaSyABtOhU_-POkxZoaSRVM8LrrDYM4Re3e9o',
    appId: '1:648489734651:web:baf317a0d259a52493fb5e',
    messagingSenderId: '648489734651',
    projectId: 'scoring-50753',
    authDomain: 'scoring-50753.firebaseapp.com',
    storageBucket: 'scoring-50753.appspot.com',
    measurementId: 'G-0EX1H61LYC',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA4RYdkAbdbEA4j3FAu7VZGmmIL_6lonM4',
    appId: '1:648489734651:android:6283c6007a19225493fb5e',
    messagingSenderId: '648489734651',
    projectId: 'scoring-50753',
    storageBucket: 'scoring-50753.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBT8gepRdkOhtiPxtUB7dQ4wPF9hoN-cRY',
    appId: '1:648489734651:ios:22d9d2a5a1c6b1a093fb5e',
    messagingSenderId: '648489734651',
    projectId: 'scoring-50753',
    storageBucket: 'scoring-50753.appspot.com',
    iosClientId: '648489734651-3437n456li284vlkce4859kr7b0b3eua.apps.googleusercontent.com',
    iosBundleId: 'com.example.scoring7419',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBT8gepRdkOhtiPxtUB7dQ4wPF9hoN-cRY',
    appId: '1:648489734651:ios:22d9d2a5a1c6b1a093fb5e',
    messagingSenderId: '648489734651',
    projectId: 'scoring-50753',
    storageBucket: 'scoring-50753.appspot.com',
    iosClientId: '648489734651-3437n456li284vlkce4859kr7b0b3eua.apps.googleusercontent.com',
    iosBundleId: 'com.example.scoring7419',
  );
}
