import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app.dart';
import 'core/services/environment.dart';
import 'core/services/repositories.dart';
import 'features/community/domain/community_repository.dart';
import 'features/search/domain/search_repository.dart';
import 'features/tracking/domain/tracking_repository.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  const env = Environment.mock;
  final repositories = buildRepositories(env);
  runApp(
    MultiProvider(
      providers: [
        Provider<SearchRepository>.value(value: repositories.search),
        Provider<TrackingRepository>.value(value: repositories.tracking),
        Provider<CommunityRepository>.value(value: repositories.community),
      ],
      child: const ComprasEcApp(),
    ),
  );
}
