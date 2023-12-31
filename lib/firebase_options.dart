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
    apiKey: 'AIzaSyAx8NMStZfOHqLJqV2jNHSU_iQ0W_vWAwE',
    appId: '1:619144667527:web:510a4456181a7195053322',
    messagingSenderId: '619144667527',
    projectId: 'isenafirebase',
    authDomain: 'isenafirebase.firebaseapp.com',
    storageBucket: 'isenafirebase.appspot.com',
    measurementId: 'G-T9G1ETCVLP',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDEMlp9yB8ynD-oasUlJ2vHTeaXXSZzL44',
    appId: '1:619144667527:android:5bfad49aea55593b053322',
    messagingSenderId: '619144667527',
    projectId: 'isenafirebase',
    storageBucket: 'isenafirebase.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAy-HI68k07KKaW4S2Fo9f9H_OJahDkf2U',
    appId: '1:619144667527:ios:ad654bc31319b384053322',
    messagingSenderId: '619144667527',
    projectId: 'isenafirebase',
    storageBucket: 'isenafirebase.appspot.com',
    iosClientId: '619144667527-je0fdmm616kmb71bfr4gtvbbva4qq2io.apps.googleusercontent.com',
    iosBundleId: 'com.example.navigatorApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAy-HI68k07KKaW4S2Fo9f9H_OJahDkf2U',
    appId: '1:619144667527:ios:5426db3a517b7710053322',
    messagingSenderId: '619144667527',
    projectId: 'isenafirebase',
    storageBucket: 'isenafirebase.appspot.com',
    iosClientId: '619144667527-bthe2764e7uli95uudrfaglqtsu06upl.apps.googleusercontent.com',
    iosBundleId: 'com.example.navigatorApp.RunnerTests',
  );
}
