import 'dart:async';

import '../../../shared/models/user_model.dart';
import 'auth_service.dart';

class MockAuthService implements AuthService {
  final Map<String, _MockUser> _users = {};
  UserModel? _currentUser;
  final _authStateController = StreamController<UserModel?>.broadcast();
  int _uidCounter = 0;

  @override
  Stream<UserModel?> get authStateChanges => _authStateController.stream;

  @override
  UserModel? get currentUser => _currentUser;

  @override
  Future<UserModel> signInWithEmail({
    required String email,
    required String password,
  }) async {
    await Future<void>.delayed(const Duration(milliseconds: 500));

    final mockUser = _users[email.toLowerCase()];
    if (mockUser == null) {
      throw AuthException('No account found with this email address.');
    }
    if (mockUser.password != password) {
      throw AuthException('Incorrect password. Please try again.');
    }

    _currentUser = mockUser.user;
    _authStateController.add(_currentUser);
    return _currentUser!;
  }

  @override
  Future<UserModel> signUpWithEmail({
    required String name,
    required String email,
    required String password,
  }) async {
    await Future<void>.delayed(const Duration(milliseconds: 500));

    if (_users.containsKey(email.toLowerCase())) {
      throw AuthException('An account with this email already exists.');
    }

    _uidCounter++;
    final user = UserModel(
      uid: 'mock_uid_$_uidCounter',
      name: name,
      email: email,
      createdAt: DateTime.now(),
    );

    _users[email.toLowerCase()] = _MockUser(user: user, password: password);
    _currentUser = user;
    _authStateController.add(_currentUser);
    return user;
  }

  @override
  Future<void> signOut() async {
    await Future<void>.delayed(const Duration(milliseconds: 200));
    _currentUser = null;
    _authStateController.add(null);
  }

  @override
  Future<void> sendPasswordResetEmail(String email) async {
    await Future<void>.delayed(const Duration(milliseconds: 500));
    // Mock — always succeeds
  }

  @override
  Future<void> sendEmailVerification() async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
    // Mock — always succeeds
  }

  void dispose() {
    _authStateController.close();
  }
}

class _MockUser {
  const _MockUser({required this.user, required this.password});

  final UserModel user;
  final String password;
}

class AuthException implements Exception {
  const AuthException(this.message);

  final String message;

  @override
  String toString() => message;
}
