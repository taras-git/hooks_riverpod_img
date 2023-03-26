import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod_test/src/data/models/character.dart';
import 'package:hooks_riverpod_test/src/data/service/network_service.dart';

class HomeViewModel extends ChangeNotifier {
  HomeViewModel();

  NetworkService service = NetworkService();
  List<Character> characters = [];
  APIRequestStatus requestStatus = APIRequestStatus.loading;
}

enum APIRequestStatus {
  unInitialized,
  loading,
  loaded,
  error,
  connectionError,
}
