import 'package:flutter/material.dart';

class CrudScreen<T> extends StatelessWidget {
  final String title;
  final List<T> items;
  final Widget Function(T item) itemBuilder;
  final VoidCallback onAdd;
  final Widget? floatingActionButton;
  final List<Widget>? actions;
  final Widget? searchBar;

  const CrudScreen({
    super.key,
    required this.title,
    required this.items,
    required this.itemBuilder,
    required this.onAdd,
    this.floatingActionButton,
    this.actions,
    this.searchBar,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: actions,
      ),
      body: Column(
        children: [
          if (searchBar != null) searchBar!,
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) => itemBuilder(items[index]),
            ),
          ),
        ],
      ),
      floatingActionButton: floatingActionButton ?? FloatingActionButton(
        onPressed: onAdd,
        child: const Icon(Icons.add),
      ),
    );
  }
}