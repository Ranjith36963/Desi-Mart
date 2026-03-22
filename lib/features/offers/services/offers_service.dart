import '../../../core/constants/app_constants.dart';
import '../models/offer_model.dart';

abstract class OffersService {
  Future<List<Offer>> getOffers();
}

/// Local offers service using hardcoded data.
/// Swap this for a Firestore-backed implementation when ready.
class LocalOffersService implements OffersService {
  @override
  Future<List<Offer>> getOffers() async {
    // Simulate network delay
    await Future<void>.delayed(const Duration(milliseconds: 300));

    return AppConstants.offers.asMap().entries.map((entry) {
      final index = entry.key;
      final data = entry.value;
      return Offer(
        id: 'offer_$index',
        title: data['title']!,
        deal: data['deal'] ?? '',
        tag: data['tag']!,
        imageUrl: data['imageUrl']!,
      );
    }).toList();
  }
}
