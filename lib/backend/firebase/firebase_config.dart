import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBH22w61m4LJvzj6CZIRgYFrfZzefZXfMs",
            authDomain: "blue-lines-jgn3h2.firebaseapp.com",
            projectId: "blue-lines-jgn3h2",
            storageBucket: "blue-lines-jgn3h2.appspot.com",
            messagingSenderId: "199124590172",
            appId: "1:199124590172:web:5f28887338751aba449099"));
  } else {
    await Firebase.initializeApp();
  }
}
