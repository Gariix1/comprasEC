import '../domain/offer.dart';
import '../domain/search_repository.dart';
import 'mock_offers.dart';

class MockSearchRepository implements SearchRepository {
  const MockSearchRepository();

  @override
  List<Offer> fetchFeatured() {
    return mockOffers;
  }
}
