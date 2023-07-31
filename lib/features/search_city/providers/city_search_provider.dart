
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_weather_lesson/common/providers/dio/dio_provider.dart';
import 'package:riverpod_weather_lesson/features/search_city/data/model/city_search_result.dart';
import 'package:riverpod_weather_lesson/features/search_city/data/service/city_search_service.dart';
import 'package:riverpod_weather_lesson/features/search_city/providers/state/city_search_state.dart';
import 'package:dio/dio.dart';
class CitySearchProvider extends Notifier<CitySearchState>{
  CitySearchState citySearchState = CitySearchForm();
  @override
  build() {
    return citySearchState;
  }
  late final Dio _dio = ref.read(dioProvider);
  late final CitySearchService _citySearchService = CitySearchService(_dio);
  void searchCity(String name) async{
    state = CitySearchLoading();
    try {
      CitySearchResult citySearchResult = await _citySearchService.searchCity(
          name: name, count: 15, language: 'en', format: 'json');
      state = CitySearchSuccess(citySearchResult);
    }
    catch(e){
      state = CitySearchFailed(e.toString());
    }
  }
}
NotifierProvider<CitySearchProvider,CitySearchState> citySearchProvider = NotifierProvider((){
  return CitySearchProvider();
});

