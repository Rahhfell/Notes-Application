import 'package:app3/services/auth/auth_services.dart';
import 'package:app3/services/auth/bloc/auth_bloc.dart';
import 'package:app3/services/auth/bloc/auth_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
              style: const TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            alignment: Alignment.bottomCenter,
          ),
          TextButton(
              onPressed: () async {
                context
                    .read()<AuthBloc>()
                    .add(const AuthEventSendEmailVerification());
              },
              child: const Text('Send email verification')),
          TextButton(
              onPressed: () {
                context.read()<AuthBloc>().add(AuthEventLogout);
              },
              child: const Text('Restart')),
        ],
      ),
    );
  }
}
