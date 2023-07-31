import 'package:retrofit/http.dart';
import 'package:riverpod_weather_lesson/common/const/api_const.dart';
import 'package:dio/dio.dart';
import '../model/current_weather_model.dart';

part 'current_weather_service.g.dart';

@RestApi(baseUrl: ApiConst.weatherBaseUrl)
abstract class CurrentWeatherService {
  factory CurrentWeatherService(Dio dio) => _CurrentWeatherService(dio);

  @GET(ApiConst.forecastEndpoint)
  Future<CurrentWeatherModel> getCurrentWeather({
    @Query('latitude') required String latitude,
    @Query('longitude') required String longitude,
    @Query('current_weather') required bool currentWeather,
  });
}
