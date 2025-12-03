import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app.dart';
import 'core/services/environment.dart';
import 'core/services/repository_provider.dart';
import 'features/community/domain/community_repository.dart';
import 'features/search/domain/search_repository.dart';
import 'features/tracking/domain/tracking_repository.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  RepositoryProvider.env = Environment.mock;
  runApp(
    MultiProvider(
      providers: [
        Provider<SearchRepository>.value(value: RepositoryProvider.search),
        Provider<TrackingRepository>.value(value: RepositoryProvider.tracking),
        Provider<CommunityRepository>.value(value: RepositoryProvider.community),
      ],
      child: const ComprasEcApp(),
    ),
  );
}
