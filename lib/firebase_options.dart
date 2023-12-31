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
    apiKey: 'AIzaSyCuee_CCVZIO40ZKQ41wXXkBrOsgPzpVSM',
    appId: '1:43190597035:web:ac12179e0e6d4438d38eee',
    messagingSenderId: '43190597035',
    projectId: 'flutter-news-app-6a808',
    authDomain: 'flutter-news-app-6a808.firebaseapp.com',
    storageBucket: 'flutter-news-app-6a808.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBHJRDZ_2hg7KQPQ4m4voL9tZRIk-P7iyY',
    appId: '1:43190597035:android:52f6970697361527d38eee',
    messagingSenderId: '43190597035',
    projectId: 'flutter-news-app-6a808',
    storageBucket: 'flutter-news-app-6a808.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDwNcLvpTpfCvzzCdiobHVd1n6KNL2sRVU',
    appId: '1:43190597035:ios:9ba8b7398c80012ad38eee',
    messagingSenderId: '43190597035',
    projectId: 'flutter-news-app-6a808',
    storageBucket: 'flutter-news-app-6a808.appspot.com',
    iosBundleId: 'com.example.flutterNewsApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDwNcLvpTpfCvzzCdiobHVd1n6KNL2sRVU',
    appId: '1:43190597035:ios:99e24a44ea121152d38eee',
    messagingSenderId: '43190597035',
    projectId: 'flutter-news-app-6a808',
    storageBucket: 'flutter-news-app-6a808.appspot.com',
    iosBundleId: 'com.example.flutterNewsApp.RunnerTests',
  );
}
