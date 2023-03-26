import 'dart:convert';

import 'package:hooks_riverpod_test/src/data/models/character.dart';
import 'package:hooks_riverpod_test/src/utils/constants.dart';
import 'package:http/http.dart' as http;

class NetworkService {
  Future<List<Character>> getCharactersList() async {
    final response = await http.get(charactersUrl);
    if (response.statusCode == 200) {
      final characters = (jsonDecode(response.body)['results'] as List)
          .map((chr) => Character.fromJson(chr))
          .toList();

      return characters;
    } else {
      throw jsonDecode(response.statusCode.toString());
    }
  }
}
