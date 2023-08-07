import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_weather_lesson/common/const/route_list.dart';
import 'package:riverpod_weather_lesson/features/theme/provider/theme_provider.dart';
import 'package:riverpod_weather_lesson/features/theme/provider/theme_state.dart';

import 'common/widget/navigation_widget.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  MyApp({Key? key}) : super(key: key);
  final _router = GoRouter(initialLocation: '/', routes: [
    StatefulShellRoute.indexedStack(
        builder: (context, state, StatefulNavigationShell shell) {
          return NavigationWidget(
            shell: shell,
          );
        },
        branches: RouteList.routeList),
  ]);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    WeatherTheme weatherTheme = ref.watch(themeProvider);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: weatherTheme.getTheme(),
      routerConfig: _router,
    );
  }
}
