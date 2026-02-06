import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:urbanflow_mobile/core/router.dart';
import 'package:urbanflow_mobile/core/theme.dart';

void main() {
  runApp(const ProviderScope(child: UrbanFlowApp()));
}

class UrbanFlowApp extends ConsumerWidget {
  const UrbanFlowApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    
    return MaterialApp.router(
      title: 'UrbanFlow OS',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark, // Default to dark for premium feel
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}
