import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/theme/app_colours.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/utils/helpers.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final storeOpen = isStoreOpen();
    final now = DateTime.now();
    final hours = AppConstants.storeHours[now.weekday];
    final closeTime = hours != null ? '${hours[2] > 12 ? hours[2] - 12 : hours[2]}:${hours[3].toString().padLeft(2, '0')} PM' : '';

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColours.saffron, AppColours.saffronDark],
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
      ),
      child: Stack(
        children: [
          // Decorative circles
          Positioned(
            top: -30,
            right: -30,
            child: Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColours.white.withValues(alpha: 0.08),
              ),
            ),
          ),
          Positioned(
            bottom: -20,
            left: -20,
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColours.white.withValues(alpha: 0.06),
              ),
            ),
          ),
          // Content
          SafeArea(
            bottom: false,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Logo + store name row
                  Row(
                    children: [
                      // "D" logo box
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: AppColours.white,
                          borderRadius: BorderRadius.circular(14),
                          boxShadow: [
                            BoxShadow(
                              color: AppColours.black.withValues(alpha: 0.1),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            'D',
                            style: AppTheme.playfair(
                              fontSize: 22,
                              fontWeight: FontWeight.w800,
                              color: AppColours.saffron,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppConstants.storeName,
                            style: AppTheme.playfair(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: AppColours.white,
                              letterSpacing: -0.3,
                            ),
                          ),
                          const SizedBox(height: 1),
                          Text(
                            'Your one stop shop for Indian foods',
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                  color: AppColours.white.withValues(alpha: 0.8),
                                  fontSize: 11,
                                ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Open/Closed status pill with frosted glass
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 10),
                        decoration: BoxDecoration(
                          color: AppColours.white.withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 8,
                              height: 8,
                              decoration: BoxDecoration(
                                color: storeOpen
                                    ? AppColours.openGreen
                                    : AppColours.error,
                                shape: BoxShape.circle,
                                boxShadow: storeOpen
                                    ? const [
                                        BoxShadow(
                                          color: AppColours.openGreen,
                                          blurRadius: 6,
                                        ),
                                      ]
                                    : const [],
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              storeOpen
                                  ? 'Open now · Closes $closeTime'
                                  : 'Closed',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    color: AppColours.white,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
