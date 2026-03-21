import 'package:flutter_test/flutter_test.dart';
import 'package:desi_mart/features/auth/services/mock_auth_service.dart';

void main() {
  late MockAuthService authService;

  setUp(() {
    authService = MockAuthService();
  });

  tearDown(() {
    authService.dispose();
  });

  group('MockAuthService', () {
    group('signUpWithEmail', () {
      test('creates a new user successfully', () async {
        final user = await authService.signUpWithEmail(
          name: 'Test User',
          email: 'test@example.com',
          password: 'password123',
        );

        expect(user.name, 'Test User');
        expect(user.email, 'test@example.com');
        expect(user.uid, isNotEmpty);
        expect(user.role, 'customer');
      });

      test('sets current user after signup', () async {
        await authService.signUpWithEmail(
          name: 'Test User',
          email: 'test@example.com',
          password: 'password123',
        );

        expect(authService.currentUser, isNotNull);
        expect(authService.currentUser!.email, 'test@example.com');
      });

      test('emits user on auth state stream after signup', () async {
        final future = authService.authStateChanges.first;

        await authService.signUpWithEmail(
          name: 'Test User',
          email: 'test@example.com',
          password: 'password123',
        );

        final emittedUser = await future;
        expect(emittedUser, isNotNull);
        expect(emittedUser!.email, 'test@example.com');
      });

      test('throws when email already exists', () async {
        await authService.signUpWithEmail(
          name: 'First User',
          email: 'test@example.com',
          password: 'password123',
        );

        expect(
          () => authService.signUpWithEmail(
            name: 'Second User',
            email: 'test@example.com',
            password: 'password456',
          ),
          throwsA(isA<AuthException>()),
        );
      });

      test('email comparison is case-insensitive', () async {
        await authService.signUpWithEmail(
          name: 'First User',
          email: 'Test@Example.com',
          password: 'password123',
        );

        expect(
          () => authService.signUpWithEmail(
            name: 'Second User',
            email: 'test@example.com',
            password: 'password456',
          ),
          throwsA(isA<AuthException>()),
        );
      });
    });

    group('signInWithEmail', () {
      test('signs in existing user', () async {
        await authService.signUpWithEmail(
          name: 'Test User',
          email: 'test@example.com',
          password: 'password123',
        );

        await authService.signOut();

        final user = await authService.signInWithEmail(
          email: 'test@example.com',
          password: 'password123',
        );

        expect(user.email, 'test@example.com');
        expect(authService.currentUser, isNotNull);
      });

      test('throws for non-existent email', () async {
        expect(
          () => authService.signInWithEmail(
            email: 'nonexistent@example.com',
            password: 'password123',
          ),
          throwsA(isA<AuthException>()),
        );
      });

      test('throws for wrong password', () async {
        await authService.signUpWithEmail(
          name: 'Test User',
          email: 'test@example.com',
          password: 'password123',
        );

        await authService.signOut();

        expect(
          () => authService.signInWithEmail(
            email: 'test@example.com',
            password: 'wrongpassword',
          ),
          throwsA(isA<AuthException>()),
        );
      });
    });

    group('signOut', () {
      test('clears current user', () async {
        await authService.signUpWithEmail(
          name: 'Test User',
          email: 'test@example.com',
          password: 'password123',
        );

        await authService.signOut();

        expect(authService.currentUser, isNull);
      });

      test('emits null on auth state stream', () async {
        await authService.signUpWithEmail(
          name: 'Test User',
          email: 'test@example.com',
          password: 'password123',
        );

        final future = authService.authStateChanges.first;
        await authService.signOut();

        final emittedUser = await future;
        expect(emittedUser, isNull);
      });
    });

    group('sendPasswordResetEmail', () {
      test('completes without error', () async {
        await expectLater(
          authService.sendPasswordResetEmail('test@example.com'),
          completes,
        );
      });
    });

    group('sendEmailVerification', () {
      test('completes without error', () async {
        await expectLater(
          authService.sendEmailVerification(),
          completes,
        );
      });
    });
  });
}
