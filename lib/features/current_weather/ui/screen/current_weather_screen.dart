import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_weather_lesson/common/utils/weather_code.dart';
import 'package:riverpod_weather_lesson/features/current_weather/data/model/current_weather_model.dart';
import 'package:riverpod_weather_lesson/features/current_weather/provider/current_weather_provider.dart';
import 'package:riverpod_weather_lesson/features/current_weather/provider/current_weather_state/current_weather_state.dart';

import '../widget/current_weather_widget.dart';

class CurrentWeatherScreen extends ConsumerStatefulWidget {
  const CurrentWeatherScreen(
      {super.key,
      required this.latitude,
      required this.longitude,
      required this.city});

  final String latitude;
  final String longitude;
  final String city;

  @override
  ConsumerState<CurrentWeatherScreen> createState() => _CurrentWeatherState();
}

class _CurrentWeatherState extends ConsumerState<CurrentWeatherScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _getWeather();
  }

  @override
  Widget build(BuildContext context) {
    final currentWeatherState = ref.watch(currentWeatherProvider);
    return Scaffold(
      body: _weatherWidget(currentWeatherState),
    );
  }

  void _getWeather() async {
    await Future.delayed(Duration.zero);
    ref
        .read(currentWeatherProvider.notifier)
        .getWeather(latitude: widget.latitude, longitude: widget.longitude);
  }

  Widget _weatherWidget(CurrentWeatherState currentWeatherState) {
    return switch (currentWeatherState) {
      CurrentWeatherLoadingState() => const Center(
          child: CircularProgressIndicator(),
        ),
      CurrentWeatherSuccessState(
        currentWeatherModel: CurrentWeatherModel current
      ) =>
        CurrentWeatherWidget(widget: widget, current: current),
      CurrentWeatherFailedState(errorMessage: String error) => Center(
          child: Text('Something wrong $error'),
        )
    };
  }
}


