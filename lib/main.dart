import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_weather_lesson/features/current_weather/ui/screen/current_weather_screen.dart';
import 'package:riverpod_weather_lesson/features/search_city/ui/screen/city_search_screen.dart';
import 'package:riverpod_weather_lesson/features/theme/provider/theme_provider.dart';
import 'package:riverpod_weather_lesson/features/theme/provider/theme_state.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  MyApp({Key? key}) : super(key: key);
  final _router = GoRouter(routes: [
    GoRoute(
        path: '/',
        builder: (context, routeState) {
          return const CitySearchScreen();
        }),
    GoRoute(
        path: '/current',
        builder: (context, routeState) {
          final query = routeState.extra as Map;
          return CurrentWeatherScreen(
            latitude: query['lati']!,
            longitude: query['longi']!,
            city: query['city']!,
          );
        })
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
