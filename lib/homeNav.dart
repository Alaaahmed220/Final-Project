import 'package:final_project/authentication.dart';
import 'package:final_project/custom_elevatedButton.dart';
import 'package:final_project/gridView.dart';
import 'package:final_project/loginPage.dart';
import 'package:final_project/registerPage.dart';
import 'package:final_project/task1.dart';
import 'package:final_project/task2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'TextField.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  List<Widget> _screens = [
    task1(),
    task2(),
    grid(),
    Textfield(),
  ];

  List<String> titles = [
    "Counter",
    "Slider",
    "Grid View",
    "Calculator",
  ];

  int _index = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(titles[_index])),
      body: _screens[_index],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black87,
        unselectedItemColor: Colors.grey,
        currentIndex: _index,
        onTap: (index) {
          setState(() {
            _index = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.looks_one_sharp), label: "Count"),
          BottomNavigationBarItem(
              icon: Icon(Icons.looks_two_sharp), label: "Slide"),
          BottomNavigationBarItem(
              icon: Icon(Icons.grid_3x3_sharp), label: "Grid"),
          BottomNavigationBarItem(
              icon: Icon(Icons.calculate_sharp), label: "Calculator"),
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Spacer(),
            CustomElevated(
                textButton: 'Sign Out',
                onPressed: () {
                  Authentication.signOut(context);
                }),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
