import 'dart:convert';
import 'dart:math';
import 'package:dictionary/models/dictionary.dart';
import 'package:http/http.dart' as http;

class DictionaryService {
  Future<void> initialize() async {}

  Future<List<Definition>?> getDefinition(String word) async {
    var client = http.Client();
    var uri = Uri.parse("https://api.dictionaryapi.dev/api/v2/entries/en/jug");

    var response = await client.get(uri);

    if (response.statusCode == 200) {
      // Parse the JSON response into a list of Definition objects
      List<Definition> definitions = (jsonDecode(response.body) as List)
          .map((data) => Definition.fromJson(data))
          .toList();

      // Return the parsed definitions
      return definitions;
    } else {
      throw Exception('Failed to load definitions');
    }
  }
}
