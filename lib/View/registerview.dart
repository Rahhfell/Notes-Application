import 'dart:developer' show log;

import 'package:app3/Utilities/show_error_dialogue.dart';
import 'package:app3/constant/routes.dart';
import 'package:app3/services/auth/auth_exceptions.dart';
import 'package:app3/services/auth/auth_services.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register')),
      body: Column(
        children: [
          TextField(
              controller: _email,
              enableSuggestions: false,
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(hintText: 'Enter email here')),
          TextField(
              controller: _password,
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              decoration:
                  const InputDecoration(hintText: 'Enter password here')),
          TextButton(
              onPressed: () async {
                final email = _email.text;
                final password = _password.text;
                try {
                  await AuthServices.firebase()
                      .createUser(email: email, password: password);
                  AuthServices.firebase().sendEmailVerification();
                  Navigator.of(context).pushNamed(verifyEmailRoute);
                } on WeakPasswordAuthException {
                  await showErrorDialogue(context, 'Weak Password');
                } on EmailAlreadyInUseAuthException {
                  await showErrorDialogue(
                      context, 'Email has already been used');
                } on InvalidEmailAuthException {
                  await showErrorDialogue(context, 'Failed to register');
                } on GenericAuthException {
                  await showErrorDialogue(context, '');
                }
              },
              child: const Text('Register')),
          TextButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil(loginRoute, (route) => false);
              },
              child: const Text("Already registered? Login here!"))
        ],
      ),
    );
  }
}
