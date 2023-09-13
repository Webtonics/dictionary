import 'package:flutter/material.dart';

import '../constants/spacers.dart';
import 'dictionary_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    _searchController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dictionary"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              spacer,
              const Text("data"),
              spacer,
              TextField(
                controller: _searchController,
                decoration: const InputDecoration(label: Text("Enter Word")),
              ),
              spacer,
              spacer,
              spacer,
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          DictionaryBody(word: _searchController.text)));
                },
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 60)),
                child: const Text("Search"),
              ),
              spacer,
            ],
          ),
        ),
      ),
    );
  }
}
