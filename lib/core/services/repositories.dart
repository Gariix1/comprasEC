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

typedef SearchRepoBuilder = SearchRepository Function();
typedef TrackingRepoBuilder = TrackingRepository Function();
typedef CommunityRepoBuilder = CommunityRepository Function();

/// Factories to allow overrides per environment (dev/prod) or tests.
class RepositoryFactories {
  RepositoryFactories({
    required this.search,
    required this.tracking,
    required this.community,
  });

  final SearchRepoBuilder search;
  final TrackingRepoBuilder tracking;
  final CommunityRepoBuilder community;
}

RepositoryContainer buildRepositories(
  Environment env, {
  RepositoryFactories? overrides,
}) {
  final factories = overrides ?? _defaultFactoriesFor(env);
  return RepositoryContainer(
    search: factories.search(),
    tracking: factories.tracking(),
    community: factories.community(),
  );
}

RepositoryFactories _defaultFactoriesFor(Environment env) {
  switch (env) {
    case Environment.production:
      // TODO: reemplazar mocks por implementaciones reales (API/local) al conectar backend.
      return RepositoryFactories(
        search: () => const MockSearchRepository(),
        tracking: () => const MockTrackingRepository(),
        community: () => const MockCommunityRepository(),
      );
    case Environment.mock:
      return RepositoryFactories(
        search: () => const MockSearchRepository(),
        tracking: () => const MockTrackingRepository(),
        community: () => const MockCommunityRepository(),
      );
  }
}
