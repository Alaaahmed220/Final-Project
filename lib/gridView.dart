import 'package:final_project/card.dart';
import 'package:final_project/source.dart';
import 'package:flutter/material.dart';

class grid extends StatefulWidget {
  const grid({super.key});

  @override
  State<grid> createState() => _gridState();
}

class _gridState extends State<grid> {
  var items = DataSource.itemList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
          itemCount: 6,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 0.9),
          itemBuilder: (context, index) {
            return myCard(items: items[index]);
          }),
    );
  }
}
