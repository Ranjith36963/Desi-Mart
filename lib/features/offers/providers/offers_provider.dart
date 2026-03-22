import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/offer_model.dart';
import '../services/offers_service.dart';

final offersServiceProvider = Provider<OffersService>((ref) {
  return LocalOffersService();
});

final offersProvider = FutureProvider<List<Offer>>((ref) async {
  final service = ref.watch(offersServiceProvider);
  return service.getOffers();
});
