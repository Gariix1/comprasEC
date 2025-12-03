import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'environment.dart';
import 'repositories.dart';
import '../../features/search/domain/search_repository.dart';
import '../../features/tracking/domain/tracking_repository.dart';
import '../../features/community/domain/community_repository.dart';

/// App-wide providers for config and repositories.
final appConfigProvider = Provider<AppConfig>(
  (ref) => throw UnimplementedError('Override appConfigProvider in ProviderScope'),
);

final searchRepositoryProvider = Provider<SearchRepository>(
  (ref) => throw UnimplementedError('Override searchRepositoryProvider in ProviderScope'),
);

final trackingRepositoryProvider = Provider<TrackingRepository>(
  (ref) => throw UnimplementedError('Override trackingRepositoryProvider in ProviderScope'),
);

final communityRepositoryProvider = Provider<CommunityRepository>(
  (ref) => throw UnimplementedError('Override communityRepositoryProvider in ProviderScope'),
);

/// Helper to build overrides for a given environment (and optional factories).
List<Override> buildOverrides({
  Environment env = Environment.mock,
  RepositoryFactories? overrides,
}) {
  final config = AppConfig(env: env);
  final repos = buildRepositories(env, overrides: overrides);
  return [
    appConfigProvider.overrideWithValue(config),
    searchRepositoryProvider.overrideWithValue(repos.search),
    trackingRepositoryProvider.overrideWithValue(repos.tracking),
    communityRepositoryProvider.overrideWithValue(repos.community),
  ];
}
