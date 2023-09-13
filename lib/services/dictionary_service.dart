import 'dart:convert';
import 'dart:math';
import 'package:dictionary/models/dictionary.dart';
import 'package:http/http.dart' as http;

class DictionaryService {
  Future<void> initialize() async {}

  Future<List<Definition>?> getDefinition(String word) async {
    final response = await http.get(
        Uri.parse('https://api.dictionaryapi.dev/api/v2/entries/en/$word'));

    if (response.statusCode == 200) {
      // definitionFromjson(response.body);
      Definition.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }

    return null;
  }
}
