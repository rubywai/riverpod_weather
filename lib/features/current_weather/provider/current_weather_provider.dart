import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_weather_lesson/common/providers/dio/dio_provider.dart';
import 'package:riverpod_weather_lesson/features/current_weather/data/model/current_weather_model.dart';
import 'package:riverpod_weather_lesson/features/current_weather/data/service/current_weather_service.dart';
import 'package:riverpod_weather_lesson/features/current_weather/provider/current_weather_state/current_weather_state.dart';
import 'package:dio/dio.dart';

class CurrentWeatherProvider extends Notifier<CurrentWeatherState> {
  final CurrentWeatherState _currentWeatherState = CurrentWeatherLoadingState();

  @override
  CurrentWeatherState build() {
    return _currentWeatherState;
  }

  late final Dio _dio = ref.read(dioProvider);

  void getWeather({required String latitude, required String longitude}) async {
    try {
      state = CurrentWeatherLoadingState();
      CurrentWeatherService currentWeatherService = CurrentWeatherService(_dio);
      CurrentWeatherModel currentWeatherModel =
          await currentWeatherService.getCurrentWeather(
              latitude: latitude, longitude: longitude, currentWeather: true);
      state = CurrentWeatherSuccessState(currentWeatherModel);
    } catch (e) {
      state = CurrentWeatherFailedState(e.toString());
    }
  }
}

final currentWeatherProvider =
    NotifierProvider<CurrentWeatherProvider, CurrentWeatherState>(
        () => CurrentWeatherProvider());
