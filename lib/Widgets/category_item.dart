import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String name;

  const CategoryItem({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(name),
      ),
    );
  }
}