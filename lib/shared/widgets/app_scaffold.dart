import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/theme/app_colours.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    required this.navigationShell,
    super.key,
  });

  final StatefulNavigationShell navigationShell;

  static const _tabs = [
    _TabInfo(icon: Icons.home_outlined, activeIcon: Icons.home, label: 'Home'),
    _TabInfo(
        icon: Icons.local_offer_outlined,
        activeIcon: Icons.local_offer,
        label: 'Offers'),
    _TabInfo(
        icon: Icons.credit_card_outlined,
        activeIcon: Icons.credit_card,
        label: 'My Card'),
    _TabInfo(
        icon: Icons.info_outline,
        activeIcon: Icons.info,
        label: 'Store'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: Container(
            decoration: BoxDecoration(
              color: AppColours.cream.withValues(alpha: 0.95),
              border: const Border(
                top: BorderSide(color: AppColours.grey100),
              ),
            ),
            padding: const EdgeInsets.only(top: 6, bottom: 16),
            child: Row(
              children: List.generate(_tabs.length, (index) {
                final tab = _tabs[index];
                final isActive = navigationShell.currentIndex == index;
                return Expanded(
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () => navigationShell.goBranch(
                      index,
                      initialLocation: index == navigationShell.currentIndex,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(height: 6),
                        Icon(
                          isActive ? tab.activeIcon : tab.icon,
                          size: 22,
                          color: isActive
                              ? AppColours.saffron
                              : AppColours.grey600,
                        ),
                        const SizedBox(height: 3),
                        Text(
                          tab.label,
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight:
                                isActive ? FontWeight.w700 : FontWeight.w500,
                            color: isActive
                                ? AppColours.saffron
                                : AppColours.grey600,
                          ),
                        ),
                        if (isActive) ...[
                          const SizedBox(height: 2),
                          Container(
                            width: 4,
                            height: 4,
                            decoration: const BoxDecoration(
                              color: AppColours.saffron,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ] else
                          const SizedBox(height: 6),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}

class _TabInfo {
  const _TabInfo({
    required this.icon,
    required this.activeIcon,
    required this.label,
  });

  final IconData icon;
  final IconData activeIcon;
  final String label;
}
