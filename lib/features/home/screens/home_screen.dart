import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/category_chips.dart';
import '../widgets/featured_deal.dart';
import '../widgets/hero_section.dart';
import '../widgets/quick_actions.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeroSection(),
            SizedBox(height: 24),
            QuickActions(),
            SizedBox(height: 24),
            CategoryChips(),
            SizedBox(height: 24),
            FeaturedDeal(),
            SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
