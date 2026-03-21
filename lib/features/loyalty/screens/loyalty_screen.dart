import 'package:flutter/material.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/theme/app_colours.dart';

class LoyaltyScreen extends StatelessWidget {
  const LoyaltyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Saffron-themed icon
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [AppColours.saffron, AppColours.saffronDark],
                    ),
                    borderRadius: BorderRadius.circular(28),
                    boxShadow: [
                      BoxShadow(
                        color: AppColours.saffron.withValues(alpha: 0.3),
                        blurRadius: 20,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.card_giftcard,
                    size: 56,
                    color: AppColours.white,
                  ),
                ),
                const SizedBox(height: 32),

                // Store branding
                Text(
                  AppConstants.storeName,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: AppColours.saffron,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1,
                      ),
                ),
                const SizedBox(height: 16),

                // Coming soon title
                Text(
                  'Loyalty Card Coming Soon!',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 12),

                // Subtitle
                Text(
                  "We're building something special for our loyal customers",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColours.grey600,
                        height: 1.5,
                      ),
                ),
                const SizedBox(height: 32),

                // Feature preview chips
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  alignment: WrapAlignment.center,
                  children: [
                    _FeatureChip(icon: Icons.star, label: 'Earn Stamps'),
                    _FeatureChip(icon: Icons.redeem, label: 'Get Rewards'),
                    _FeatureChip(
                        icon: Icons.history, label: 'Track Progress'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _FeatureChip extends StatelessWidget {
  const _FeatureChip({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: AppColours.saffronLight,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: AppColours.saffron),
          const SizedBox(width: 6),
          Text(
            label,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppColours.saffron,
                  fontWeight: FontWeight.w500,
                ),
          ),
        ],
      ),
    );
  }
}
