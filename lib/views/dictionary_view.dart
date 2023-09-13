import 'package:dictionary/constants/spacers.dart';
import 'package:dictionary/models/dictionary.dart';
import 'package:dictionary/services/dictionary_service.dart';
import 'package:flutter/material.dart';

class DictionaryBody extends StatefulWidget {
  const DictionaryBody({super.key, required this.word});

  final String word;

  @override
  State<DictionaryBody> createState() => _DictionaryBodyState();
}

class _DictionaryBodyState extends State<DictionaryBody> {
  late Future<List<Definition>?> result;
  // late Future<Definition?> result;
  @override
  void initState() {
    result = DictionaryService().getDefinition(widget.word);
    // DictionaryService().getDefinition(widget.word);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.word),
      ),
      body: FutureBuilder<List<Definition>?>(
        future: result,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  const Text(
                    "Definitions",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  spacer,
                  Text(widget.word),
                  spacer,
                  const Text(
                    "Synonyms",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          } else {
            return Center(
              child: Column(
                children: [
                  const Text("not Loading"),
                  const CircularProgressIndicator(
                    color: Colors.red,
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
