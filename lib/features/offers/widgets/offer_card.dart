import 'package:flutter/material.dart';

import '../../../core/theme/app_colours.dart';
import '../models/offer_model.dart';

class OfferCard extends StatelessWidget {
  const OfferCard({required this.offer, super.key});

  final Offer offer;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColours.white,
      borderRadius: BorderRadius.circular(14),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(14),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: AppColours.grey100),
          ),
          child: Row(
            children: [
              // Content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Tag + title row
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 7, vertical: 2),
                          decoration: BoxDecoration(
                            color: offer.tagColorValue,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            offer.tag,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(
                                  fontSize: 9,
                                  fontWeight: FontWeight.w700,
                                  color: AppColours.white,
                                  letterSpacing: 0.5,
                                ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            offer.title,
                            style:
                                Theme.of(context).textTheme.bodyMedium?.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: AppColours.darkText,
                                    ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    if (offer.deal.isNotEmpty) ...[
                      const SizedBox(height: 4),
                      // Deal text
                      Text(
                        offer.deal,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                              color: AppColours.saffron,
                            ),
                      ),
                    ],
                  ],
                ),
              ),
              // Chevron
              const Icon(
                Icons.chevron_right,
                color: AppColours.grey600,
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
