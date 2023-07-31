import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_weather_lesson/features/search_city/data/model/city_search_result.dart';

import 'flag_widget.dart';

class CityList extends StatelessWidget {
  const CityList({Key? key, required this.citySearchResult}) : super(key: key);
  final CitySearchResult citySearchResult;

  @override
  Widget build(BuildContext context) {
    List<Results>? cities = citySearchResult.results;
    return ListView.builder(
        itemCount: cities?.length ?? 0,
        itemBuilder: (context, position) {
          Results? results = cities?[position];
          return InkWell(
            onTap: () {
              context.push('/current', extra: {
                'lati': results?.latitude?.toString(),
                'longi': results?.longitude?.toString(),
                'city' : results?.name
              });
            },
            child: Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(results?.name ?? ''),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(results?.country ?? ''),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(results?.admin1 ?? ''),
                      )
                    ],
                  ),
                  FlagWidget(results: results)
                ],
              ),
            ),
          );
        });
  }
}
