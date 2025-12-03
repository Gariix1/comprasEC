import '../../features/community/data/mock_community_repository.dart';
import '../../features/community/domain/community_repository.dart';
import '../../features/search/data/mock_search_repository.dart';
import '../../features/search/domain/search_repository.dart';
import '../../features/tracking/data/mock_tracking_repository.dart';
import '../../features/tracking/domain/tracking_repository.dart';
import 'environment.dart';

class RepositoryContainer {
  RepositoryContainer({
    required this.search,
    required this.tracking,
    required this.community,
  });

  final SearchRepository search;
  final TrackingRepository tracking;
  final CommunityRepository community;
}

RepositoryContainer buildRepositories(Environment env) {
  // For now only mocks; extend with real implementations per env.
  return RepositoryContainer(
    search: const MockSearchRepository(),
    tracking: const MockTrackingRepository(),
    community: const MockCommunityRepository(),
  );
}
