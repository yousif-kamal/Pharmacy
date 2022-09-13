import 'package:drug_app/src/screens/main_screens/home_screen.dart';
import 'package:drug_app/src/screens/main_screens/info.dart';
import 'package:drug_app/src/screens/main_screens/search_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class bottomScreen extends StatefulWidget {
  const bottomScreen({super.key});

  @override
  State<bottomScreen> createState() => _bottomScreenState();
}

class _bottomScreenState extends State<bottomScreen> {
  int Index = 0;
  final screens = [
    HomeScreenView(),
    searchScreen(),
    infoScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[Index],
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        selectedItemColor: Color.fromARGB(255, 3, 90, 105),
        unselectedItemColor: Color.fromARGB(255, 20, 143, 165),
        iconSize: 25,
        currentIndex: Index,
        items: [
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.house),
            label: "Home",
            // backgroundColor: Color.fromARGB(255, 22, 194, 16),
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.magnifyingGlass),
            label: "search",
            // backgroundColor: Color.fromARGB(255, 5, 62, 136),
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.info),
            label: "info",
            // backgroundColor: Color.fromARGB(255, 71, 39, 39),
          ),
        ],
        onTap: (index) {
          setState(() {
            this.Index = index;
          });
        },
      ),
    );
  }
}
