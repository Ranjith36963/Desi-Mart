import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;

/// Placeholder Firebase options.
///
/// Replace these with actual values from the Firebase console
/// by running `flutterfire configure` or downloading the config files.
///
/// These placeholder values will cause Firebase initialization to fail
/// gracefully, and the app will fall back to mock services.
class DefaultFirebaseOptions {
  static const FirebaseOptions currentPlatform = FirebaseOptions(
    apiKey: 'placeholder-api-key',
    appId: 'placeholder-app-id',
    messagingSenderId: 'placeholder-sender-id',
    projectId: 'desi-mart-app',
    storageBucket: 'desi-mart-app.appspot.com',
  );
}
