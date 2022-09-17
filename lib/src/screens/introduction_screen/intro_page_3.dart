import 'package:drug_app/src/common/style/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class introPage3 extends StatelessWidget {
  introPage3({super.key});

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
            Image.asset('assets/images/for.png'),
            SizedBox(
              height: 20,
            ),
            Title(
                color: Colors.black,
                child: Text(
                  "Who can use it?",
                  style: GeneralStyle.introtop,
                )),
            SizedBox(
              height: 30,
            ),
            Text(
              " Anyone who wants to know more \nabout drugs, students, pharmacists",
              style: GeneralStyle.introbot,
            ),
          ],
        ),
      ),
    );
  }
}
