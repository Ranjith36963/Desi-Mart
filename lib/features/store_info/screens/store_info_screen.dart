import 'package:flutter/material.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/theme/app_colours.dart';
import '../../../core/utils/helpers.dart';

class StoreInfoScreen extends StatelessWidget {
  const StoreInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 8),
                child: Text(
                  'Store Info',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                child: Text(
                  AppConstants.storeTagline,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColours.grey600,
                      ),
                ),
              ),

              // Map placeholder
              _MapPlaceholder(),
              const SizedBox(height: 24),

              // Contact cards
              _SectionTitle(title: 'Contact Us'),
              const SizedBox(height: 8),
              _ContactCard(
                icon: Icons.location_on,
                title: 'Address',
                subtitle: AppConstants.storeAddress,
                color: AppColours.tagValue,
                onTap: () => launchMaps(
                    AppConstants.storeLat, AppConstants.storeLng),
              ),
              _ContactCard(
                icon: Icons.phone,
                title: 'Phone',
                subtitle: AppConstants.storePhone,
                color: AppColours.green,
                onTap: () => launchPhone(AppConstants.storePhone),
              ),
              _ContactCard(
                icon: Icons.email,
                title: 'Email',
                subtitle: AppConstants.storeEmail,
                color: AppColours.tagDeal,
                onTap: () => launchEmail(AppConstants.storeEmail),
              ),
              const SizedBox(height: 24),

              // Opening hours
              _SectionTitle(title: 'Opening Hours'),
              const SizedBox(height: 8),
              _OpeningHours(),
              const SizedBox(height: 24),

              // Brands
              _SectionTitle(title: 'Brands We Stock'),
              const SizedBox(height: 8),
              _BrandsSection(),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
      ),
    );
  }
}

class _MapPlaceholder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GestureDetector(
        onTap: () =>
            launchMaps(AppConstants.storeLat, AppConstants.storeLng),
        child: Container(
          height: 180,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColours.grey100,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColours.grey200),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.map_outlined,
                size: 48,
                color: AppColours.grey400,
              ),
              const SizedBox(height: 8),
              Text(
                'Tap to open in Google Maps',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColours.grey600,
                    ),
              ),
              const SizedBox(height: 4),
              Text(
                AppConstants.storeAddress,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppColours.grey400,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ContactCard extends StatelessWidget {
  const _ContactCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Material(
        color: AppColours.white,
        borderRadius: BorderRadius.circular(14),
        elevation: 1,
        shadowColor: AppColours.black.withValues(alpha: 0.05),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(14),
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Row(
              children: [
                Container(
                  width: 42,
                  height: 42,
                  decoration: BoxDecoration(
                    color: color.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(icon, color: color, size: 22),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style:
                            Theme.of(context).textTheme.bodySmall?.copyWith(
                                  color: AppColours.grey600,
                                  fontSize: 12,
                                ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        subtitle,
                        style:
                            Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  fontWeight: FontWeight.w500,
                                ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.chevron_right,
                  color: AppColours.grey400,
                  size: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _OpeningHours extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final today = DateTime.now().weekday;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
          color: AppColours.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: AppColours.black.withValues(alpha: 0.05),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            for (final day in [
              DateTime.monday,
              DateTime.tuesday,
              DateTime.wednesday,
              DateTime.thursday,
              DateTime.friday,
              DateTime.saturday,
              DateTime.sunday,
            ])
              _DayRow(
                day: AppConstants.dayNames[day]!,
                hours: AppConstants.storeHoursDisplay[day]!,
                isToday: day == today,
                isLast: day == DateTime.sunday,
              ),
          ],
        ),
      ),
    );
  }
}

class _DayRow extends StatelessWidget {
  const _DayRow({
    required this.day,
    required this.hours,
    required this.isToday,
    required this.isLast,
  });

  final String day;
  final String hours;
  final bool isToday;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: isToday ? AppColours.saffronLight : null,
        borderRadius: isLast
            ? const BorderRadius.only(
                bottomLeft: Radius.circular(14),
                bottomRight: Radius.circular(14),
              )
            : null,
        border: isLast
            ? null
            : Border(bottom: BorderSide(color: AppColours.grey100)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              if (isToday)
                Container(
                  width: 8,
                  height: 8,
                  margin: const EdgeInsets.only(right: 8),
                  decoration: const BoxDecoration(
                    color: AppColours.green,
                    shape: BoxShape.circle,
                  ),
                ),
              Text(
                day,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: isToday ? FontWeight.w600 : FontWeight.w400,
                      color: isToday ? AppColours.saffron : AppColours.darkText,
                    ),
              ),
            ],
          ),
          Text(
            hours,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: isToday ? FontWeight.w600 : FontWeight.w400,
                  color: isToday ? AppColours.saffron : AppColours.grey600,
                ),
          ),
        ],
      ),
    );
  }
}

class _BrandsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        children: AppConstants.brands.map((brand) {
          return Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            decoration: BoxDecoration(
              color: AppColours.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: AppColours.grey200),
            ),
            child: Text(
              brand,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: AppColours.darkText,
                  ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
