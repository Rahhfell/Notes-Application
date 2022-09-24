import 'package:app3/View/loginview.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:app3/View/registerview.dart';
import 'firebase_options.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized;
  runApp(
    MaterialApp(
      home: HomePage(),
      routes: {
        '/login/': (context) => LoginView(),
        '/register/': (context) => RegisterView(),
      },
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            //final user = FirebaseAuth.instance.currentUser;
            //if (user?.emailVerified ?? false) {
            //return const Text('Done');
            //} else {
            //return const VerifyEmailPage();
            //}
            return LoginView();
          default:
            return const Text('Loading');
        }
      },
    );
  }
}
