import 'package:flutter/material.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/theme/app_colours.dart';
import '../../../core/theme/app_theme.dart';

class CategoryChips extends StatelessWidget {
  const CategoryChips({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, bottom: 12),
          child: Text(
            'Shop by Category',
            style: AppTheme.playfair(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: AppColours.darkText,
            ),
          ),
        ),
        SizedBox(
          height: 90,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: AppConstants.categories.length,
            separatorBuilder: (_, __) => const SizedBox(width: 8),
            itemBuilder: (context, index) {
              final category = AppConstants.categories[index];
              return _CategoryChip(
                emoji: category['emoji']!,
                name: category['name']!,
                count: category['count']!,
              );
            },
          ),
        ),
      ],
    );
  }
}

class _CategoryChip extends StatelessWidget {
  const _CategoryChip({
    required this.emoji,
    required this.name,
    required this.count,
  });

  final String emoji;
  final String name;
  final String count;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 72,
      decoration: BoxDecoration(
        color: AppColours.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColours.grey100),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(emoji, style: const TextStyle(fontSize: 24)),
          const SizedBox(height: 4),
          Text(
            name,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 10,
                  color: AppColours.darkText,
                ),
            textAlign: TextAlign.center,
          ),
          Text(
            count,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppColours.grey600,
                  fontSize: 9,
                ),
          ),
        ],
      ),
    );
  }
}
