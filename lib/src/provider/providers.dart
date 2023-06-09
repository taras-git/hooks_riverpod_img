import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod_test/src/data/service/connectivity_service.dart';
import 'package:hooks_riverpod_test/src/viewmodel/viewmodel.dart';

final homeProvider = ChangeNotifierProvider((_) => HomeViewModel());

final connectivityStatusNotifier =
    StateNotifierProvider<ConnectivityStatusNotifier, Object>((ref) {
  return ConnectivityStatusNotifier();
});
