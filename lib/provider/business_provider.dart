import 'package:flutter/foundation.dart';
import 'package:geny_labs_test/http/dio_client.dart';
import 'package:geny_labs_test/model/business_model.dart';

//enums denoting different states for the app states
enum BusinessStateStatus { initial, loading, loaded, empty, error }

class BusinessProvider with ChangeNotifier {
  final DioClient api;

  List<BusinessModel> _businesses = [];
  BusinessStateStatus _status = BusinessStateStatus.initial;
  String _errorMessage = '';

  BusinessProvider(this.api);

  List<BusinessModel> get businesses => _businesses;
  BusinessStateStatus get status => _status;
  String get errorMessage => _errorMessage;

  Future<void> loadBusinesses() async {
    _status = BusinessStateStatus.loading;
    notifyListeners();

    try {
      final data = await api.fetchBusinesses();
      if (data.isEmpty) {
        _status = BusinessStateStatus.empty;
      } else {
        _businesses = data;
        _status = BusinessStateStatus.loaded;
        // Save to local storage here for offline use
      }
    } catch (e) {
      _status = BusinessStateStatus.error;
      _errorMessage = e.toString();
    }

    notifyListeners();
  }
}
