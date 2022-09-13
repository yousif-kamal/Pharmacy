import 'package:drug_app/src/common/style/style.dart';
import 'package:drug_app/src/screens/auth_screens/login_scree.dart';
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
            _registerbutton(context),
          ],
        ),
      ),
    );
  }
}

Widget _registerbutton(context) {
  return SizedBox(
    width: double.infinity,
    child: ElevatedButton(
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => RegisterScreen(),
        ));
      },
      style: ButtonStyle(
        foregroundColor:
            MaterialStateProperty.all<Color>(Color.fromARGB(255, 61, 66, 74)),
        backgroundColor:
            MaterialStateProperty.all<Color>(Color.fromARGB(255, 87, 189, 230)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Text("Create Account"),
      ),
    ),
  );
}
