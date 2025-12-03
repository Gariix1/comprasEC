import '../domain/offer.dart';
import '../domain/search_repository.dart';
import 'mock_offers.dart';

class MockSearchRepository implements SearchRepository {
  const MockSearchRepository();

  @override
  Future<List<Offer>> fetchFeatured() async => mockOffers;
}
