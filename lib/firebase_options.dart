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
    apiKey: 'AIzaSyCPlrt0r-Yl_Lg0lxJQfkboLY2KGFO4KS8',
    appId: '1:435767152730:web:e0133d70f681ad874cc863',
    messagingSenderId: '435767152730',
    projectId: 'calificaciones-fd59f',
    authDomain: 'calificaciones-fd59f.firebaseapp.com',
    storageBucket: 'calificaciones-fd59f.appspot.com',
    measurementId: 'G-681Z4LVLMD',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB72pv3yToXVYLnXcezdHx30INJmok_2qM',
    appId: '1:435767152730:android:9683e0abf3a6f5414cc863',
    messagingSenderId: '435767152730',
    projectId: 'calificaciones-fd59f',
    storageBucket: 'calificaciones-fd59f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCO2I7YJzM-TsGKt5LOMnJqt8GYC9AJ7UQ',
    appId: '1:435767152730:ios:82779a009286ae204cc863',
    messagingSenderId: '435767152730',
    projectId: 'calificaciones-fd59f',
    storageBucket: 'calificaciones-fd59f.appspot.com',
    iosBundleId: 'com.example.nps',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCO2I7YJzM-TsGKt5LOMnJqt8GYC9AJ7UQ',
    appId: '1:435767152730:ios:82779a009286ae204cc863',
    messagingSenderId: '435767152730',
    projectId: 'calificaciones-fd59f',
    storageBucket: 'calificaciones-fd59f.appspot.com',
    iosBundleId: 'com.example.nps',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCPlrt0r-Yl_Lg0lxJQfkboLY2KGFO4KS8',
    appId: '1:435767152730:web:d7f16c2b92e1c3134cc863',
    messagingSenderId: '435767152730',
    projectId: 'calificaciones-fd59f',
    authDomain: 'calificaciones-fd59f.firebaseapp.com',
    storageBucket: 'calificaciones-fd59f.appspot.com',
    measurementId: 'G-29LTB3ZPMV',
  );
}
