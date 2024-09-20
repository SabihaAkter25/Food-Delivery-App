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
    apiKey: 'AIzaSyC0O5NKxmwq0Q2W0IVFp2Wiqr6kijbbSTk',
    appId: '1:364469953668:web:93f9b9ebe8d1eda9a74ed1',
    messagingSenderId: '364469953668',
    projectId: 'delivery-app-with-admin-cc563',
    authDomain: 'delivery-app-with-admin-cc563.firebaseapp.com',
    storageBucket: 'delivery-app-with-admin-cc563.appspot.com',
    measurementId: 'G-HCF2S0V8CT',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDK8qTTwqFmF-EAVnGkjuiGJ9G8e_24zKk',
    appId: '1:364469953668:android:8e89aceef01b2642a74ed1',
    messagingSenderId: '364469953668',
    projectId: 'delivery-app-with-admin-cc563',
    storageBucket: 'delivery-app-with-admin-cc563.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyChgj_Zh-YWK9uTuqWOxRJexzZHnw1NS-I',
    appId: '1:364469953668:ios:24b6b3fbd1af3f59a74ed1',
    messagingSenderId: '364469953668',
    projectId: 'delivery-app-with-admin-cc563',
    storageBucket: 'delivery-app-with-admin-cc563.appspot.com',
    iosBundleId: 'com.example.deliveryAppWithAdminPanel',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyChgj_Zh-YWK9uTuqWOxRJexzZHnw1NS-I',
    appId: '1:364469953668:ios:24b6b3fbd1af3f59a74ed1',
    messagingSenderId: '364469953668',
    projectId: 'delivery-app-with-admin-cc563',
    storageBucket: 'delivery-app-with-admin-cc563.appspot.com',
    iosBundleId: 'com.example.deliveryAppWithAdminPanel',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyC0O5NKxmwq0Q2W0IVFp2Wiqr6kijbbSTk',
    appId: '1:364469953668:web:ca7c058fc601173fa74ed1',
    messagingSenderId: '364469953668',
    projectId: 'delivery-app-with-admin-cc563',
    authDomain: 'delivery-app-with-admin-cc563.firebaseapp.com',
    storageBucket: 'delivery-app-with-admin-cc563.appspot.com',
    measurementId: 'G-F21R9MSJJ4',
  );
}
