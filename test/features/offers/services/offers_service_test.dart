import 'package:flutter_test/flutter_test.dart';
import 'package:desi_mart/features/offers/services/offers_service.dart';

void main() {
  late LocalOffersService offersService;

  setUp(() {
    offersService = LocalOffersService();
  });

  group('LocalOffersService', () {
    test('returns all offers', () async {
      final offers = await offersService.getOffers();
      expect(offers, hasLength(5));
    });

    test('offers have required fields', () async {
      final offers = await offersService.getOffers();

      for (final offer in offers) {
        expect(offer.id, isNotEmpty);
        expect(offer.title, isNotEmpty);
        expect(offer.tag, isNotEmpty);
        expect(offer.imageUrl, isNotEmpty);
        expect(offer.active, isTrue);
      }
    });

    test('Maggi offer has deal text', () async {
      final offers = await offersService.getOffers();
      final maggi = offers.firstWhere((o) => o.title.contains('Maggi'));

      expect(maggi.deal, '4 for £1');
      expect(maggi.tag, 'HOT');
    });

    test('offers have unique IDs', () async {
      final offers = await offersService.getOffers();
      final ids = offers.map((o) => o.id).toSet();

      expect(ids, hasLength(offers.length));
    });

    test('all tags are valid', () async {
      final validTags = {'NEW', 'POPULAR', 'HOT', 'VALUE', 'DEAL'};
      final offers = await offersService.getOffers();

      for (final offer in offers) {
        expect(validTags.contains(offer.tag), isTrue,
            reason: '${offer.tag} is not a valid tag');
      }
    });

    test('all image URLs are valid HTTPS URLs', () async {
      final offers = await offersService.getOffers();

      for (final offer in offers) {
        expect(offer.imageUrl.startsWith('https://'), isTrue,
            reason: '${offer.imageUrl} should start with https://');
      }
    });
  });
}
