// import 'package:geny_labs_test/model/business_model.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'dart:convert';

// class LocalStorageService {
//   Future<void> saveBusinesses(List<BusinessModel> businesses) async {
//     final prefs = await SharedPreferences.getInstance();
//     final jsonList = businesses.map((b) => b.toJson()).toList();
//     await prefs.setString('businesses', jsonEncode(jsonList));
//   }

//   Future<List<BusinessModel>> loadBusinesses() async {
//     final prefs = await SharedPreferences.getInstance();
//     final data = prefs.getString('businesses');
//     if (data == null) return [];
//     final List<dynamic> raw = jsonDecode(data);
//     return raw.map((e) => BusinessModel.fromJson(e)).toList();
//   }
// }
