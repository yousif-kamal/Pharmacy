import 'package:drug_app/src/common/style/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class introPage1 extends StatelessWidget {
  introPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Image.asset('assets/images/wel.png'),
            SizedBox(
              height: 20,
            ),
            Title(
                color: Colors.black,
                child: Text(
                  "WELCOME !",
                  style: GeneralStyle.introtop,
                )),
            SizedBox(
              height: 30,
            ),
            Text(
              "You've chosen the right app",
              style: GeneralStyle.introbot,
            ),
          ],
        ),
      ),
    );
  }
}
