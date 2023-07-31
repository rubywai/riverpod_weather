import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../data/model/city_search_result.dart';

class FlagWidget extends StatelessWidget {
  const FlagWidget({
    super.key,
    required this.results,
  });

  final Results? results;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: 'https://flagsapi.com/${results?.countryCode}/shiny/64.png',
      width: 64,
      height: 64,
      progressIndicatorBuilder: (_,__,___) => const Center(child: CircularProgressIndicator(),),
      errorWidget: (_,__,___) => const Center(child: Icon(Icons.error,color: Colors.red,),),);
  }
}