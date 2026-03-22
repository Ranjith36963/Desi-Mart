import 'package:flutter_test/flutter_test.dart';
import 'package:desi_mart/core/utils/helpers.dart';

void main() {
  group('isStoreOpen', () {
    test('returns true during Monday business hours', () {
      // Monday at 12:00 PM
      final monday12pm = DateTime(2026, 3, 23, 12, 0); // Monday
      expect(isStoreOpen(now: monday12pm), isTrue);
    });

    test('returns false before Monday opening', () {
      // Monday at 8:00 AM (opens at 9)
      final monday8am = DateTime(2026, 3, 23, 8, 0);
      expect(isStoreOpen(now: monday8am), isFalse);
    });

    test('returns false after Monday closing', () {
      // Monday at 8:00 PM (closes at 7)
      final monday8pm = DateTime(2026, 3, 23, 20, 0);
      expect(isStoreOpen(now: monday8pm), isFalse);
    });

    test('returns true during Sunday business hours', () {
      // Sunday at 1:00 PM
      final sunday1pm = DateTime(2026, 3, 22, 13, 0); // Sunday
      expect(isStoreOpen(now: sunday1pm), isTrue);
    });

    test('returns false before Sunday opening', () {
      // Sunday at 9:30 AM (opens at 10)
      final sunday930am = DateTime(2026, 3, 22, 9, 30);
      expect(isStoreOpen(now: sunday930am), isFalse);
    });

    test('returns false after Sunday closing', () {
      // Sunday at 5:00 PM (closes at 4)
      final sunday5pm = DateTime(2026, 3, 22, 17, 0);
      expect(isStoreOpen(now: sunday5pm), isFalse);
    });

    test('returns true at opening time boundary', () {
      // Monday at exactly 9:01 AM
      final mondayOpen = DateTime(2026, 3, 23, 9, 1);
      expect(isStoreOpen(now: mondayOpen), isTrue);
    });

    test('returns false at exact opening time', () {
      // Monday at exactly 9:00 AM (isAfter is exclusive)
      final mondayExactOpen = DateTime(2026, 3, 23, 9, 0);
      expect(isStoreOpen(now: mondayExactOpen), isFalse);
    });
  });

  group('currentDayHours', () {
    test('returns a non-empty string', () {
      final hours = currentDayHours();
      expect(hours, isNotEmpty);
    });
  });
}
