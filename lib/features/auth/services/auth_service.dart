import 'dart:async';

import '../../../shared/models/user_model.dart';

/// Abstract auth service interface.
///
/// Implementations:
/// - [MockAuthService] for local development without Firebase
/// - Future: FirebaseAuthService for production
abstract class AuthService {
  Stream<UserModel?> get authStateChanges;
  UserModel? get currentUser;

  Future<UserModel> signInWithEmail({
    required String email,
    required String password,
  });

  Future<UserModel> signUpWithEmail({
    required String name,
    required String email,
    required String password,
  });

  Future<void> signOut();

  Future<void> sendPasswordResetEmail(String email);

  Future<void> sendEmailVerification();
}
