import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/theme/app_colours.dart';
import '../../../core/theme/app_theme.dart';
import '../providers/loyalty_provider.dart';

class LoyaltyScreen extends ConsumerWidget {
  const LoyaltyScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stamps = ref.watch(stampCountProvider);
    const total = AppConstants.totalStamps;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
                child: Text(
                  'My Loyalty Card',
                  style: AppTheme.playfair(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: AppColours.darkText,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 2, 16, 12),
                child: Text(
                  'Scan at checkout to collect stamps',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: 12,
                        color: AppColours.grey600,
                      ),
                ),
              ),

              // Stamp Card
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: _StampCard(stamps: stamps, total: total),
              ),
              const SizedBox(height: 20),

              // QR Code
              Center(child: _QrCodeSection()),
              const SizedBox(height: 20),

              // Rewards info
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: _RewardsInfo(),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class _StampCard extends StatelessWidget {
  const _StampCard({required this.stamps, required this.total});

  final int stamps;
  final int total;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColours.saffron,
            Color(0xFFD4621E),
            AppColours.saffronDark,
          ],
          stops: [0.0, 0.5, 1.0],
        ),
        boxShadow: [
          BoxShadow(
            color: AppColours.saffron.withValues(alpha: 0.3),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Decorative circles
          Positioned(
            top: -40,
            right: -40,
            child: Container(
              width: 160,
              height: 160,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColours.white.withValues(alpha: 0.06),
              ),
            ),
          ),
          Positioned(
            bottom: -30,
            left: -30,
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColours.white.withValues(alpha: 0.04),
              ),
            ),
          ),
          // Content
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 22, 20, 22),
            child: Column(
              children: [
                // Header row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'LOYALTY CARD',
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: AppColours.white.withValues(alpha: 0.7),
                                    fontSize: 10,
                                    letterSpacing: 1.5,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          AppConstants.storeName,
                          style: AppTheme.playfair(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: AppColours.white,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 6),
                      decoration: BoxDecoration(
                        color: AppColours.white.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        '$stamps/$total',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: AppColours.white,
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 18),

                // Stamps grid (5 columns)
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                  ),
                  itemCount: total,
                  itemBuilder: (context, index) {
                    final isFilled = index < stamps;
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: isFilled
                            ? AppColours.white.withValues(alpha: 0.25)
                            : AppColours.white.withValues(alpha: 0.08),
                        border: isFilled
                            ? null
                            : Border.all(
                                color:
                                    AppColours.white.withValues(alpha: 0.2),
                                style: BorderStyle.solid,
                              ),
                      ),
                      child: Center(
                        child: isFilled
                            ? const Text('⭐', style: TextStyle(fontSize: 18))
                            : Text(
                                '${index + 1}',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                      color: AppColours.white
                                          .withValues(alpha: 0.4),
                                      fontSize: 12,
                                    ),
                              ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 14),

                // Progress text
                Text(
                  '${total - stamps} more stamps to earn a free reward!',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColours.white.withValues(alpha: 0.7),
                        fontSize: 11,
                      ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _QrCodeSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColours.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColours.grey100),
        boxShadow: [
          BoxShadow(
            color: AppColours.black.withValues(alpha: 0.04),
            blurRadius: 12,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // QR Code placeholder
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: AppColours.darkText,
              borderRadius: BorderRadius.circular(8),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CustomPaint(
                size: const Size(120, 120),
                painter: _QrPainter(),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Scan at checkout',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: AppColours.darkText,
                ),
          ),
          const SizedBox(height: 2),
          Text(
            'Member ID: ${AppConstants.memberId}',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontSize: 10,
                  color: AppColours.grey600,
                ),
          ),
        ],
      ),
    );
  }
}

class _QrPainter extends CustomPainter {
  final _random = Random(42); // Fixed seed for consistent pattern

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = AppColours.white;
    const cols = 8;
    const rows = 8;
    final cellW = (size.width - 16) / cols;
    final cellH = (size.height - 16) / rows;

    for (int r = 0; r < rows; r++) {
      for (int c = 0; c < cols; c++) {
        if (_random.nextDouble() > 0.45) {
          canvas.drawRect(
            Rect.fromLTWH(
              8 + c * cellW,
              8 + r * cellH,
              cellW - 2,
              cellH - 2,
            ),
            paint,
          );
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _RewardsInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: AppColours.goldLight,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: AppColours.gold.withValues(alpha: 0.13),
        ),
      ),
      child: Row(
        children: [
          const Text('🎁', style: TextStyle(fontSize: 28)),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Collect 10 stamps, get a reward!',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: AppColours.darkText,
                      ),
                ),
                const SizedBox(height: 2),
                Text(
                  'Earn 1 stamp per £5 spend',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: 11,
                        color: AppColours.grey600,
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
