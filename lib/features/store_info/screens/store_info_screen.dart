import 'package:flutter/material.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/theme/app_colours.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/utils/helpers.dart';

class StoreInfoScreen extends StatelessWidget {
  const StoreInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 20, 16, 12),
                child: Text(
                  'Store Info',
                  style: AppTheme.playfair(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: AppColours.darkText,
                  ),
                ),
              ),

              // Map placeholder
              _MapPlaceholder(),
              const SizedBox(height: 12),

              // Contact cards
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    _ContactCard(
                      emoji: '📍',
                      label: 'Address',
                      value: '11 Town Centre\nHatfield, Hertfordshire\nAL10 0NY',
                      onTap: () => launchMaps(
                          AppConstants.storeLat, AppConstants.storeLng),
                    ),
                    const SizedBox(height: 10),
                    _ContactCard(
                      emoji: '📞',
                      label: 'Phone',
                      value: AppConstants.storePhone,
                      onTap: () => launchPhone(AppConstants.storePhone),
                    ),
                    const SizedBox(height: 10),
                    _ContactCard(
                      emoji: '📧',
                      label: 'Email',
                      value: AppConstants.storeEmail,
                      onTap: () => launchEmail(AppConstants.storeEmail),
                    ),
                    const SizedBox(height: 10),

                    // Opening Hours
                    _HoursCard(),
                    const SizedBox(height: 16),
                  ],
                ),
              ),

              // Brands
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Brands We Stock',
                      style: AppTheme.playfair(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: AppColours.darkText,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Wrap(
                      spacing: 6,
                      runSpacing: 6,
                      children: AppConstants.brands.map((brand) {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                            color: AppColours.saffronLight,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            brand,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
                                  color: AppColours.saffronDark,
                                ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class _MapPlaceholder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GestureDetector(
        onTap: () =>
            launchMaps(AppConstants.storeLat, AppConstants.storeLng),
        child: Container(
          height: 140,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFFE8EAED), Color(0xFFD4D7DC)],
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Stack(
            children: [
              // Grid pattern
              Positioned.fill(
                child: CustomPaint(painter: _GridPainter()),
              ),
              // Content
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('📍', style: TextStyle(fontSize: 32)),
                    const SizedBox(height: 4),
                    Text(
                      'Tap to open in Maps',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: AppColours.darkText,
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _GridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFCCCCCC).withValues(alpha: 0.3)
      ..strokeWidth = 1;

    const spacing = 20.0;
    for (double x = 0; x < size.width; x += spacing) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }
    for (double y = 0; y < size.height; y += spacing) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _ContactCard extends StatelessWidget {
  const _ContactCard({
    required this.emoji,
    required this.label,
    required this.value,
    required this.onTap,
  });

  final String emoji;
  final String label;
  final String value;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColours.white,
      borderRadius: BorderRadius.circular(14),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: AppColours.grey100),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(emoji, style: const TextStyle(fontSize: 20)),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontSize: 11,
                            color: AppColours.grey600,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      value,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: AppColours.darkText,
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _HoursCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColours.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColours.grey100),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('🕐', style: TextStyle(fontSize: 20)),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Opening Hours',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: 11,
                        color: AppColours.grey600,
                        fontWeight: FontWeight.w500,
                      ),
                ),
                const SizedBox(height: 8),
                const _HoursRow(
                  day: 'Monday - Saturday',
                  time: '9:00 AM - 7:00 PM',
                ),
                const SizedBox(height: 6),
                const _HoursRow(
                  day: 'Sunday',
                  time: '10:00 AM - 4:00 PM',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _HoursRow extends StatelessWidget {
  const _HoursRow({required this.day, required this.time});

  final String day;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          day,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: AppColours.darkText,
              ),
        ),
        Text(
          time,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: AppColours.green,
              ),
        ),
      ],
    );
  }
}
