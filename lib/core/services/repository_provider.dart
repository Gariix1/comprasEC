import '../../features/community/data/mock_community_repository.dart';
import '../../features/community/domain/community_post.dart';
import '../../features/community/domain/community_repository.dart';
import '../../features/search/data/mock_search_repository.dart';
import '../../features/search/domain/offer.dart';
import '../../features/search/domain/search_repository.dart';
import '../../features/tracking/data/mock_tracking_repository.dart';
import '../../features/tracking/domain/tracking_event.dart';
import '../../features/tracking/domain/tracking_repository.dart';
import 'environment.dart';

// Placeholder real repositories (implement actual data fetching later)
class RealSearchRepository implements SearchRepository {
  @override
  List<Offer> fetchFeatured() => const [];
}

class RealTrackingRepository implements TrackingRepository {
  @override
  List<TrackingEvent> fetchTrackingEvents(String trackingId) => const [];
}

class RealCommunityRepository implements CommunityRepository {
  @override
  List<CommunityPost> fetchFeed() => const [];
}

class RepositoryProvider {
  RepositoryProvider._();

  static Environment env = Environment.mock;

  static SearchRepository get search =>
      env == Environment.mock ? const MockSearchRepository() : RealSearchRepository();

  static TrackingRepository get tracking =>
      env == Environment.mock ? const MockTrackingRepository() : RealTrackingRepository();

  static CommunityRepository get community =>
      env == Environment.mock ? const MockCommunityRepository() : RealCommunityRepository();
}
