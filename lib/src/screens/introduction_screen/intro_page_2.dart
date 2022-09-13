import 'package:drug_app/src/common/style/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class introPage2 extends StatelessWidget {
  introPage2({super.key});

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
            Image.asset('assets/images/inf.png'),
            SizedBox(
              height: 20,
            ),
            Title(
                color: Colors.black,
                child: Text(
                  "Drug App",
                  style: GeneralStyle.additionalTextStyle,
                )),
            SizedBox(
              height: 25,
            ),
            Text(
              "lorem jbdfkjvbdaoiwerafewofhbvierlvgle",
              style: GeneralStyle.additionalTextStyle1,
            ),
          ],
        ),
      ),
    );
  }
}
