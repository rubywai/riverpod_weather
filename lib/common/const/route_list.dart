import 'package:go_router/go_router.dart';

import '../../features/current_weather/ui/screen/current_weather_screen.dart';
import '../../features/search_city/ui/screen/city_search_screen.dart';
import '../../features/setting/setting_screen.dart';

class RouteList{
  static final routeList = [
    StatefulShellBranch(routes: [
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
          }),
    ]),
    StatefulShellBranch(routes: [
      GoRoute(
          path: '/settings',
          builder: (context, routeState) {
            return const SettingScreen();
          })
    ])
  ];
}