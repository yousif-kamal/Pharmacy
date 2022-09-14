import 'package:drug_app/src/screens/auth_screens/login_scree.dart';
import 'package:drug_app/src/screens/auth_screens/otp_screen.dart';
import 'package:drug_app/src/screens/auth_screens/start_screen.dart';
import 'package:drug_app/src/screens/detail_screen/antibiotics_detail_screen.dart';
import 'package:drug_app/src/screens/detail_screen/antibiotic_screen.dart';
import 'package:drug_app/src/screens/introduction_screen/onboarding_screen.dart';
import 'package:drug_app/src/screens/main_screens/all_screens.dart';
import 'package:drug_app/src/screens/main_screens/buttom_navigation_bar.dart';
import 'package:drug_app/src/screens/main_screens/home_screen.dart';
import 'package:drug_app/src/screens/main_screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Root extends StatelessWidget {
  const Root({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: onBoardingScreen(),
    );
  }
}
