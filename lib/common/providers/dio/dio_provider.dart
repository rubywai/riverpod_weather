import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
Provider<Dio> dioProvider = Provider((ref){
  Dio dio = Dio();
  return dio;
});