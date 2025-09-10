import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:geny_labs_test/model/business_model.dart';

class DioClient {
  final Dio _dio;

  //Made this dioClient a singleton, so we wont have to keep calling different instance of it around the app
  static DioClient? _instance;

  static DioClient getInstance() {
    _instance ??= DioClient._(Dio());
    return _instance!;
  }

  DioClient._(this._dio) {
    _dio.options.responseType = ResponseType.plain;
  }

  Future<List<BusinessModel>> fetchBusinesses() async {
    try {
      final response = await _dio.get('assets/bundle/businesses.json');
      final List<dynamic> rawList = jsonDecode(response.data);
      return rawList.map((e) => BusinessModel.fromJson(e)).toList();
    } catch (e) {
      throw Exception('Failed to load businesses: $e');
    }
  }
}
