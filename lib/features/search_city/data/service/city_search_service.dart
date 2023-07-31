import 'package:retrofit/http.dart';
import 'package:riverpod_weather_lesson/common/const/api_const.dart';

import '../model/city_search_result.dart';
import 'package:dio/dio.dart';
part 'city_search_service.g.dart';
@RestApi(baseUrl: ApiConst.citySearchBaseUrl)
abstract class CitySearchService {
  factory CitySearchService(Dio dio) => _CitySearchService(dio);
  @GET(ApiConst.citySearchEndpoint)
  Future<CitySearchResult> searchCity({
    @Query('name') required String name,
    @Query('count') required int count,
    @Query('language') required String language,
    @Query('json') required String format,
  });
}
