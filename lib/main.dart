import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app.dart';
import 'core/services/environment.dart';
import 'core/services/providers.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Select env via dart define: --dart-define=ENV=production
  const envFlag = String.fromEnvironment('ENV', defaultValue: 'mock');
  final env = envFlag.toLowerCase() == 'production'
      ? Environment.production
      : Environment.mock;

  runApp(
    ProviderScope(
      overrides: buildOverrides(env: env),
      child: const ComprasEcApp(),
    ),
  );
}
