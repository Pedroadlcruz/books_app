import 'package:flutter/material.dart';

class BooksSearchDelegate extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(onPressed: () => query = '', icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => close(context, null),
      icon: const Icon(Icons.arrow_back_ios),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    print(query);
    return const Text('build results');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const ListTile(title: Text(' Suggestions'));
  }
}
