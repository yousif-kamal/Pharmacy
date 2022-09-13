import 'package:drug_app/src/common/style/style.dart';
import 'package:drug_app/src/screens/introduction_screen/onboarding_screen.dart';
import 'package:drug_app/src/screens/main_screens/home_screen.dart';
import 'package:drug_app/src/screens/main_screens/info.dart';
import 'package:drug_app/src/screens/main_screens/search_screen.dart';
import 'package:flutter/material.dart';

class AntibioticScreen extends StatefulWidget {
  const AntibioticScreen({super.key});

  @override
  State<AntibioticScreen> createState() => _AntibioticScreenState();
}

class _AntibioticScreenState extends State<AntibioticScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 91, 151, 241),
          bottom: const TabBar(
            tabs: [
              Text("All"),
              Text("One"),
              Text("Two"),
              Text("Three"),
            ],
          ),
          title: Align(
            alignment: Alignment.center,
            child: Text(
              'Tabs Demo',
              style: GeneralStyle.Titledet,
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
                flex: 1,
                child: Container(
                  height: 10,
                  child: Text("data"),
                )),
            Expanded(
              flex: 9,
              child: TabBarView(
                children: [
                  infoScreen(),
                  searchScreen(),
                  HomeScreenView(),
                  onBoardingScreen(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
