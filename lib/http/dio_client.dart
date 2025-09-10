import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart' show rootBundle;
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
      final data = await rootBundle.loadString('assets/bundle/business.json');
      final List<dynamic> rawList = jsonDecode(data);
      return rawList.map((e) => BusinessModel.fromJson(e)).toList();
    } catch (e) {
      throw Exception('Failed to load businesses: $e');
    }
  }
}
