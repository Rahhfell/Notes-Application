import 'package:app3/View/loginview.dart';
import 'package:app3/View/notes_view.dart';
import 'package:app3/View/verifyemail.dart';
import 'package:app3/constant/routes.dart';
import 'package:app3/services/auth/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:app3/View/registerview.dart';
import 'dart:developer' show log;

void main() {
  WidgetsFlutterBinding.ensureInitialized;
  runApp(
    MaterialApp(
      home: const HomePage(),
      routes: {
        loginRoute: (context) => const LoginView(),
        registerRoute: (context) => const RegisterView(),
        notesRoute: (context) => const NotesView(),
        verifyEmailRoute: (context) => const VerifyEmailPage()
      },
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: AuthServices.firebase().initialize(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            final user = AuthServices.firebase().currentUser;
            if (user != null) {
              if (user.isEmailVerified) {
                return const NotesView();
              } else {
                return const VerifyEmailPage();
              }
            } else {
              return const LoginView();
            }
          default:
            return const Text('Loading');
        }
      },
    );
  }
}

Future<bool> showLogOutDialogue(BuildContext context) {
  return showDialog<bool>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Sign Out'),
        content: const Text('Are you sure you want to sign out'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: const Text('Cancel'),
          ),
          TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: const Text('Yes')),
        ],
      );
    },
  ).then((value) => value ?? false);
}
