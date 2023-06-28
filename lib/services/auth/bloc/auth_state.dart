import 'package:app3/services/auth/auth_user.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart' show immutable;

@immutable
abstract class AuthState {
  final bool isLoading;
  final String? loadingText;
  const AuthState(
      {required this.isLoading, this.loadingText = 'Please wait a momoent'});
}

class AuthStateUnitialized extends AuthState {
  const AuthStateUnitialized({required bool isLoading})
      : super(isLoading: isLoading);
}

class AuthStateLoggedIn extends AuthState {
  final AuthUser user;
  const AuthStateLoggedIn({required bool isLoading, required this.user})
      : super(isLoading: isLoading);
}

class AuthStateLoginFailure extends AuthState {
  final Exception exception;
  const AuthStateLoginFailure({required this.exception, required isLoading})
      : super(isLoading: isLoading);
}

class AuthStateNeedsVerification extends AuthState {
  const AuthStateNeedsVerification({required isLoading})
      : super(isLoading: isLoading);
}

class AuthStateLoggedOut extends AuthState with EquatableMixin {
  @override
  List<Object?> get props => [exception, isloading];
  final Exception? exception;
  final bool isloading;
  const AuthStateLoggedOut({
    required this.exception,
    required this.isloading,
    String? loadingText,
  }) : super(isLoading: isloading, loadingText: loadingText);
}

class AuthStateRegistering extends AuthState {
  final Exception? exception;
  const AuthStateRegistering({this.exception, required isLoading})
      : super(isLoading: isLoading);
}

class AuthStateForgotPassword extends AuthState {
  final Exception? exception;
  final bool hasSentEmail;
  const AuthStateForgotPassword(
      {required this.exception, required isLoading, required this.hasSentEmail})
      : super(isLoading: isLoading);
}
