import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:stillspace/features/focus/presentation/focus_lifecycle_observer.dart';
import 'package:stillspace/features/world/presentation/pages/home_page.dart';

import 'core/theme/app_theme.dart';
import 'features/focus/domain/entities/focus_state.dart';
import 'features/focus/presentation/focus_providers.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  runApp(
    ProviderScope(child: StillspaceApp()),
  );
}

class StillspaceApp extends StatelessWidget {
  const StillspaceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stillspace',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: HomePage(),
    );
  }
}
