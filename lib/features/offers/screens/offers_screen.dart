import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_colours.dart';
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
            final activeOffers =
                offers.where((o) => o.active).toList();

            return CustomScrollView(
              slivers: [
                // Header
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Current Offers',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: AppColours.saffronLight,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Text(
                            '${activeOffers.length} Active',
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(
                                  color: AppColours.saffron,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Subtitle
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
                    child: Text(
                      'Don\'t miss out on these amazing deals!',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppColours.grey600,
                          ),
                    ),
                  ),
                ),

                // Offer cards
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) =>
                        OfferCard(offer: activeOffers[index]),
                    childCount: activeOffers.length,
                  ),
                ),

                const SliverToBoxAdapter(
                  child: SizedBox(height: 24),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
