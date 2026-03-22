import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../core/theme/app_colours.dart';
import '../models/offer_model.dart';

class OfferCard extends StatelessWidget {
  const OfferCard({required this.offer, super.key});

  final Offer offer;

  @override
  Widget build(BuildContext context) {
    final tagColor = AppColours.tagColour(offer.tag);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: AppColours.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColours.black.withValues(alpha: 0.06),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Row(
          children: [
            // Product image
            CachedNetworkImage(
              imageUrl: offer.imageUrl,
              width: 110,
              height: 110,
              fit: BoxFit.cover,
              placeholder: (context, url) => Container(
                width: 110,
                height: 110,
                color: AppColours.grey100,
                child: const Center(
                  child: CircularProgressIndicator(
                    color: AppColours.saffron,
                    strokeWidth: 2,
                  ),
                ),
              ),
              errorWidget: (context, url, error) => Container(
                width: 110,
                height: 110,
                color: AppColours.grey100,
                child: const Icon(
                  Icons.image_not_supported_outlined,
                  color: AppColours.grey400,
                  size: 32,
                ),
              ),
            ),

            // Content
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Tag badge
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: tagColor.withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        offer.tag,
                        style:
                            Theme.of(context).textTheme.labelSmall?.copyWith(
                                  color: tagColor,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 0.5,
                                ),
                      ),
                    ),
                    const SizedBox(height: 8),

                    // Title
                    Text(
                      offer.title,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),

                    // Deal text
                    if (offer.deal.isNotEmpty) ...[
                      const SizedBox(height: 4),
                      Text(
                        offer.deal,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: AppColours.saffron,
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                    ],
                  ],
                ),
              ),
            ),

            // Arrow
            const Padding(
              padding: EdgeInsets.only(right: 12),
              child: Icon(
                Icons.chevron_right,
                color: AppColours.grey400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
