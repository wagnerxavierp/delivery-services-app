import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDTbEiP_28CNjS3DGd7-5NYVXNLA7trwEI",
            authDomain: "delivery-service-c8b2f.firebaseapp.com",
            projectId: "delivery-service-c8b2f",
            storageBucket: "delivery-service-c8b2f.appspot.com",
            messagingSenderId: "1036167984282",
            appId: "1:1036167984282:web:ed694b88004e777442db23"));
  } else {
    await Firebase.initializeApp();
  }
}
