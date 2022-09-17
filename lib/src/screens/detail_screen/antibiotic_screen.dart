import 'package:drug_app/src/common/style/style.dart';
import 'package:drug_app/src/screens/introduction_screen/onboarding_screen.dart';
import 'package:drug_app/src/screens/main_screens/home_screen.dart';
import 'package:drug_app/src/screens/main_screens/info.dart';
import 'package:drug_app/src/screens/main_screens/search_screen.dart';
import 'package:drug_app/src/screens/tabs_screen/all_tab.dart';
import 'package:drug_app/src/screens/tabs_screen/anti_cell_tab.dart';
import 'package:drug_app/src/screens/tabs_screen/protein_synth.dart';
import 'package:flutter/material.dart';

class AntibioticScreen extends StatefulWidget {
  AntibioticScreen({super.key});

  @override
  State<AntibioticScreen> createState() => _AntibioticScreenState();
}

class _AntibioticScreenState extends State<AntibioticScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 91, 151, 241),
          bottom: TabBar(
            indicatorColor: Color.fromARGB(255, 255, 255, 255),
            tabs: [
              Text(
                "All",
                style: GeneralStyle.additionalTextStyle2,
              ),
              Text(
                "Cell Wall",
                style: GeneralStyle.additionalTextStyle2,
              ),
              Text(
                "Protein killer",
                style: GeneralStyle.additionalTextStyle2,
              ),
            ],
          ),
          title: Align(
            alignment: Alignment.center,
            child: Text(
              'Antibiotics',
              style: GeneralStyle.Titledet,
            ),
          ),
        ),
        body: Column(
          children: [
            // Expanded(
            //     flex: 1,
            //     child: Container(
            //       height: 10,
            //       child: Text("Search"),
            //     )),
            Expanded(
              flex: 9,
              child: TabBarView(
                children: [
                  AllTab(),
                  AntiCell(),
                  ProteinSynth(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
