import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_weather_lesson/features/search_city/providers/city_search_provider.dart';
import 'package:riverpod_weather_lesson/features/search_city/providers/state/city_search_state.dart';
import 'package:riverpod_weather_lesson/features/search_city/ui/widget/city_list_widget.dart';
import 'package:riverpod_weather_lesson/features/theme/provider/theme_provider.dart';
import 'package:riverpod_weather_lesson/features/theme/provider/theme_state.dart';

import '../../data/model/city_search_result.dart';

class CitySearchScreen extends ConsumerStatefulWidget {
  const CitySearchScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<CitySearchScreen> createState() => _CitySearchScreenState();
}

class _CitySearchScreenState extends ConsumerState<CitySearchScreen> {
  final TextEditingController _citySearchTextController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    //real time
    //read
    final citySearchState = ref.watch(citySearchProvider);
    final provider = ref.read(citySearchProvider.notifier);
    final weatherTheme = ref.watch(themeProvider);
    final weatherProvider = ref.read(themeProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riverpod weather'),
        centerTitle: true,
        actions: [
          Switch(
              value: (weatherTheme is DarkTheme),
              onChanged: (val) {
                if (!val) {
                  weatherProvider.changeTheme(LightTheme());
                } else {
                  weatherProvider.changeTheme(DarkTheme());
                }
              })
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _citySearchTextController,
              decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: 'Search city',
                  suffixIcon: IconButton(
                      onPressed: () {
                        String city = _citySearchTextController.text.trim();
                        if (city.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Please Enter completely')));
                        } else {
                          provider.searchCity(city);
                        }
                      },
                      icon: const Icon(Icons.search))),
            ),
          ),
          Expanded(child: _citySearchResultWidget(citySearchState))
        ],
      ),
    );
  }

  Widget _citySearchResultWidget(CitySearchState citySearchState) {
    return Center(
      child: switch (citySearchState) {
        CitySearchForm() => const Text('Please search a city'),
        CitySearchLoading() => const CircularProgressIndicator(),
        CitySearchSuccess(
          citySearchResult: CitySearchResult citySearchResult
        ) =>
          CityList(
            citySearchResult: citySearchResult,
          ),
        CitySearchFailed(errorMessage: String error) => Text('Error $error')
      },
    );
  }
}
