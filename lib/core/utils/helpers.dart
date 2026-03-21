import 'package:url_launcher/url_launcher.dart';

import '../constants/app_constants.dart';

Future<void> launchPhone(String phone) async {
  final uri = Uri(scheme: 'tel', path: phone);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  }
}

Future<void> launchEmail(String email) async {
  final uri = Uri(scheme: 'mailto', path: email);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  }
}

Future<void> launchMaps(double lat, double lng) async {
  final uri = Uri.parse(
    'https://www.google.com/maps/search/?api=1&query=$lat,$lng',
  );
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }
}

bool isStoreOpen({DateTime? now}) {
  final dateTime = now ?? DateTime.now();
  final day = dateTime.weekday;
  final hours = AppConstants.storeHours[day];

  if (hours == null) return false;

  final openTime = dateTime.copyWith(
    hour: hours[0],
    minute: hours[1],
    second: 0,
    millisecond: 0,
  );
  final closeTime = dateTime.copyWith(
    hour: hours[2],
    minute: hours[3],
    second: 0,
    millisecond: 0,
  );

  return dateTime.isAfter(openTime) && dateTime.isBefore(closeTime);
}

String currentDayHours() {
  final day = DateTime.now().weekday;
  return AppConstants.storeHoursDisplay[day] ?? 'Closed';
}
