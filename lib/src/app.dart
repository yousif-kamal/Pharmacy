import 'package:drug_app/src/screens/auth_screens/register_screen.dart';
import 'package:drug_app/src/screens/detail_screen/antibiotic_screen.dart';
import 'package:drug_app/src/screens/introduction_screen/onboarding_screen.dart';
import 'package:drug_app/src/screens/main_screens/buttom_navigation_bar.dart';
import 'package:drug_app/src/screens/main_screens/home_screen.dart';
import 'package:drug_app/src/screens/main_screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class Root extends StatelessWidget {
  const Root({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: onBoardingScreen(),
    );
  }
}
