import 'offer.dart';

abstract class SearchRepository {
  Future<List<Offer>> fetchFeatured();
}
