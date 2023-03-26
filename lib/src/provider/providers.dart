import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod_test/src/viewmodel/viewmodel.dart';

final homeProvider = ChangeNotifierProvider((_) => HomeViewModel());
