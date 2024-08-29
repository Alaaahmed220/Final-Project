import 'package:final_project/items.dart';
import 'package:final_project/text.dart';
import 'package:flutter/material.dart';

class myCard extends StatelessWidget {
  myCard({super.key, required this.items});

  ItemsModel? items;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      width: 200,
      height: 200,
      decoration: BoxDecoration(
          color: Colors.black26, borderRadius: BorderRadius.circular(25)),
      child: Column(
        children: [
          SizedBox(
              width: double.infinity,
              height: 130,
              child: Image.asset('${items?.image}')),
          Divider(color: Colors.white, thickness: 3),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              myText(data: "${items?.name}"),
              myText(
                data: "${items?.color}",
              ),
            ],
          )
        ],
      ),
    );
  }
}
