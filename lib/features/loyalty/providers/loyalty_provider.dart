import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Current stamp count for the user.
/// Starts at 6 (demo) — in production, read from Firestore.
final stampCountProvider = StateProvider<int>((ref) => 6);
