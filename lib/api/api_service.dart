import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:pentagon_1/modelclass/view_model.dart';

class Apiservic {
  Dio dio = Dio(BaseOptions(baseUrl: 'https://fakestoreapi.com/'));

  Future<List<Pentagon>?> getpost() async {
    Response response = await dio.get('products');
    try {
      if (response.statusCode == 200) {
        String json = jsonEncode(response.data);
        return pentagonFromJson(json);
      }
      return null;
    } on DioException catch (e) {
      log('error:$e');
    }
    return null;
  }
}
