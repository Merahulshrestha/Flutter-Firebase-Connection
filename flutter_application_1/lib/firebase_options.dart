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
    apiKey: 'AIzaSyBh9kTtgKaQISHsqkEngm-VMlhwNVxO-YA',
    appId: '1:333731216676:web:ea26e9020be5e6b41647b1',
    messagingSenderId: '333731216676',
    projectId: 'crypto-c3ce4',
    authDomain: 'crypto-c3ce4.firebaseapp.com',
    storageBucket: 'crypto-c3ce4.appspot.com',
    measurementId: 'G-KD7HCP737L',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBayM3PecpWaVLfydIEGPHHpe3qzbXc2ac',
    appId: '1:333731216676:android:f0ef21578acca4ad1647b1',
    messagingSenderId: '333731216676',
    projectId: 'crypto-c3ce4',
    storageBucket: 'crypto-c3ce4.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAO5JMxp1yRta_XzEI07k-opBGBqA8sJpk',
    appId: '1:333731216676:ios:b8a6afdd88e892b91647b1',
    messagingSenderId: '333731216676',
    projectId: 'crypto-c3ce4',
    storageBucket: 'crypto-c3ce4.appspot.com',
    iosClientId: '333731216676-laevsmepun8mllhovppp6cqm9omtmt1e.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterApplication1',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAO5JMxp1yRta_XzEI07k-opBGBqA8sJpk',
    appId: '1:333731216676:ios:b8a6afdd88e892b91647b1',
    messagingSenderId: '333731216676',
    projectId: 'crypto-c3ce4',
    storageBucket: 'crypto-c3ce4.appspot.com',
    iosClientId: '333731216676-laevsmepun8mllhovppp6cqm9omtmt1e.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterApplication1',
  );
}
