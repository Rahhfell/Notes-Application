import 'package:app3/constant/routes.dart';
import 'package:app3/main.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:app3/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

class VerifyEmailPage extends StatefulWidget {
  const VerifyEmailPage({Key? key}) : super(key: key);

  @override
  State<VerifyEmailPage> createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends State<VerifyEmailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify email'),
      ),
      body: Column(
        children: [
          Container(
            child: Text(
              'Please verify your email address',
              style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            alignment: Alignment.bottomCenter,
          ),
          TextButton(
              onPressed: () async {
                final user = FirebaseAuth.instance.currentUser;
                await user?.sendEmailVerification();
                if (user != null) {
                  if (user.emailVerified) {
                    print('okay');
                    // ignore: use_build_context_synchronously
                    Navigator.of(context)
                        .pushNamedAndRemoveUntil(notesRoute, (route) => false);
                  }
                }
              },
              child: const Text('Send email verification'))
        ],
      ),
    );
  }
}
