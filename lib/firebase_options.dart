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
    apiKey: 'AIzaSyBL1EmOYKTQGOLQPkPIjT0V5pnKBLI3VSI',
    appId: '1:477474048607:web:9daf1594905a769b69a9ea',
    messagingSenderId: '477474048607',
    projectId: 'tripsflutter-9a440',
    authDomain: 'tripsflutter-9a440.firebaseapp.com',
    storageBucket: 'tripsflutter-9a440.appspot.com',
    measurementId: 'G-D8NZTYEPKE',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAn6kM3lc3174nQ-Pv39ihRV1J3jyZEsuA',
    appId: '1:477474048607:android:cb6a79b26dc11d3169a9ea',
    messagingSenderId: '477474048607',
    projectId: 'tripsflutter-9a440',
    storageBucket: 'tripsflutter-9a440.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCf4HJ3Yq2kDJZdWMrvATONjIdWw-RYuBg',
    appId: '1:477474048607:ios:55c5827b0e245bf869a9ea',
    messagingSenderId: '477474048607',
    projectId: 'tripsflutter-9a440',
    storageBucket: 'tripsflutter-9a440.appspot.com',
    androidClientId: '477474048607-clr8vtubdktp89r9313bqfms8hjpae6h.apps.googleusercontent.com',
    iosClientId: '477474048607-gn212h63mlgrsdbeb1du2tqujii7q5ev.apps.googleusercontent.com',
    iosBundleId: 'com.example.basicFlutter',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCf4HJ3Yq2kDJZdWMrvATONjIdWw-RYuBg',
    appId: '1:477474048607:ios:55c5827b0e245bf869a9ea',
    messagingSenderId: '477474048607',
    projectId: 'tripsflutter-9a440',
    storageBucket: 'tripsflutter-9a440.appspot.com',
    androidClientId: '477474048607-clr8vtubdktp89r9313bqfms8hjpae6h.apps.googleusercontent.com',
    iosClientId: '477474048607-gn212h63mlgrsdbeb1du2tqujii7q5ev.apps.googleusercontent.com',
    iosBundleId: 'com.example.basicFlutter',
  );
}
