import 'package:app3/services/auth/auth_provider.dart';
import 'package:app3/services/auth/auth_user.dart';

class AuthServices implements AuthProvider {
  final AuthProvider provider;

  AuthServices(this.provider);
  @override
  Future<AuthUser> createUser(
          {required String email, required String password}) =>
      provider.createUser(email: email, password: password);

  @override
  AuthUser? get currentUser => provider.currentUser;

  @override
  Future<AuthUser> logIn({required String email, required String password}) =>
      provider.logIn(email: email, password: password);

  @override
  Future<void> logOut() => provider.logOut();

  @override
  Future<void> sendEmailVerification() => provider.sendEmailVerification();
}