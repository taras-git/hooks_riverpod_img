import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod_test/src/data/models/character.dart';
import 'package:hooks_riverpod_test/src/data/service/network_service.dart';

class HomeViewModel extends ChangeNotifier {
  HomeViewModel();

  NetworkService service = NetworkService();
  List<Character> characters = [];
  APIRequestStatus requestStatus = APIRequestStatus.loading;

  // Future getCharacters() async {
  //   requestStatus = APIRequestStatus.loading;
  //   notifyListeners();
  //   try {
  //     final responseBody = await service.getCharacters();
  //     characters = responseBody;
  //     requestStatus = APIRequestStatus.loaded;
  //     notifyListeners();
  //   } catch (e) {
  //     if (isConnectionError(e)) {
  //       requestStatus = APIRequestStatus.connectionError;
  //       notifyListeners();
  //     } else {
  //       requestStatus = APIRequestStatus.error;
  //       notifyListeners();
  //     }
  //   }
  // }
}

enum APIRequestStatus {
  unInitialized,
  loading,
  loaded,
  error,
  connectionError,
}
