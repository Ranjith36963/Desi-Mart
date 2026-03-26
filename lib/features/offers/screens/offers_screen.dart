import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_colours.dart';
import '../../../core/theme/app_theme.dart';
import '../../../shared/widgets/loading_indicator.dart';
import '../providers/offers_provider.dart';
import '../widgets/offer_card.dart';

class OffersScreen extends ConsumerWidget {
  const OffersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final offersAsync = ref.watch(offersProvider);

    return Scaffold(
      body: SafeArea(
        child: offersAsync.when(
          loading: () => const LoadingIndicator(message: 'Loading offers...'),
          error: (error, _) => Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.error_outline,
                    color: AppColours.error, size: 48),
                const SizedBox(height: 12),
                Text(
                  'Failed to load offers',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () => ref.invalidate(offersProvider),
                  child: const Text('Retry'),
                ),
              ],
            ),
          ),
          data: (offers) {
            final activeOffers = offers.where((o) => o.active).toList();

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
                    child: Text(
                      'Latest Offers',
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
                      'Updated weekly · ${activeOffers.length} active deals',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontSize: 12,
                            color: AppColours.grey600,
                          ),
                    ),
                  ),

                  // Offer cards
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        for (final offer in activeOffers) ...[
                          OfferCard(offer: offer),
                          const SizedBox(height: 10),
                        ],
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
