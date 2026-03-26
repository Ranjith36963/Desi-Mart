import 'package:flutter/material.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/theme/app_colours.dart';
import '../../../core/theme/app_theme.dart';

class FeaturedDeal extends StatelessWidget {
  const FeaturedDeal({super.key});

  @override
  Widget build(BuildContext context) {
    // Use the first offer (Maggi 4 for £1) as featured deal
    final deal = AppConstants.offers[0];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Text(
              "Today's Highlight",
              style: AppTheme.playfair(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: AppColours.darkText,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppColours.green,
                  AppColours.greenDark,
                ],
              ),
            ),
            child: Stack(
              children: [
                // Decorative circle
                Positioned(
                  top: -15,
                  right: -15,
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColours.white.withValues(alpha: 0.08),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 18, 16, 18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Limited Time',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: AppColours.white.withValues(alpha: 0.8),
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1,
                              height: 1,
                            ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        deal['title']!,
                        style: AppTheme.playfair(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: AppColours.white,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        deal['deal']!,
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                              color: AppColours.white,
                              fontWeight: FontWeight.w800,
                              fontSize: 28,
                            ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'While stocks last',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: AppColours.white.withValues(alpha: 0.7),
                              fontSize: 11,
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
