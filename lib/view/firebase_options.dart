// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;


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
    apiKey: 'AIzaSyDUzhTGLnxzUir7tWY2Vf0FYmVV1s-VTnQ',
    appId: '1:903572341066:web:de619009f0f98ca04001b3',
    messagingSenderId: '903572341066',
    projectId: 'umla-ass',
    authDomain: 'umla-ass.firebaseapp.com',
    storageBucket: 'umla-ass.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCaNsmTVsihIPBwbBO7Pwvn4X0s3n52kFA',
    appId: '1:903572341066:android:fd3a3148bc6f23c44001b3',
    messagingSenderId: '903572341066',
    projectId: 'umla-ass',
    storageBucket: 'umla-ass.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBe6g7YMr62am4dPhreAh6pJTHPjiuZyTQ',
    appId: '1:903572341066:ios:0ae5da040baad01b4001b3',
    messagingSenderId: '903572341066',
    projectId: 'umla-ass',
    storageBucket: 'umla-ass.appspot.com',
    iosBundleId: 'com.example.umlaProject',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBe6g7YMr62am4dPhreAh6pJTHPjiuZyTQ',
    appId: '1:903572341066:ios:b2cf20de4a5e9fb04001b3',
    messagingSenderId: '903572341066',
    projectId: 'umla-ass',
    storageBucket: 'umla-ass.appspot.com',
    iosBundleId: 'com.example.umlaProject.RunnerTests',
  );
}
