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
  List<Definition>? result;
  // late Future<Definition?> result;
  var isLoading = false;
  @override
  void initState() {
    getData();
    // DictionaryService().getDefinition(widget.word);
    super.initState();
  }

  Future<List<Definition>?> getData() async {
    List<Definition>? result =
        await DictionaryService().getDefinition(widget.word);
    if (result != null) {
      setState(() {
        isLoading = true;
      });
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.word),
      ),
      body: FutureBuilder<List<Definition>?>(
        future: getData(), // Use await to call getData
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Column(
                children: [
                  const Text("Loading..."),
                  CircularProgressIndicator(
                    color: Colors.red,
                  ),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Text("Error: ${snapshot.error}");
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Container(
              child: const Text("No data available"),
            );
          } else {
            List<Definition>? result = snapshot.data;

            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  const Text(
                    "Definitions",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  spacer,
                  Text(
                    result!.length.toString(),
                  ),
                  spacer,
                  const Text(
                    "Synonyms",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
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
