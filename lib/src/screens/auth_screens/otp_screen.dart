import 'package:drug_app/src/common/style/style.dart';
import 'package:drug_app/src/screens/main_screens/all_screens.dart';
import 'package:drug_app/src/screens/main_screens/buttom_navigation_bar.dart';
import 'package:drug_app/src/screens/main_screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

class Verify extends StatefulWidget {
  const Verify({Key? key, required this.verificationId}) : super(key: key);
  final String verificationId;
  @override
  State<Verify> createState() => _VerifyState();
}

bool showloading = false;
final TextEditingController _usernamelogincontroller = TextEditingController();
final TextEditingController otpcontroler = TextEditingController();
final FirebaseAuth auth = FirebaseAuth.instance;

class _VerifyState extends State<Verify> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //resizeToAvoidBottomInset: false,
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        body: SingleChildScrollView(
          reverse: true,
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 24, horizontal: 32),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Icon(
                        Icons.arrow_back,
                        size: 32,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Image.asset(
                    'assets/images/otp.png',
                    height: 300,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Verification',
                    style: GeneralStyle.additionalTextStyle,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Enter your OTP code number",
                    style: GeneralStyle.additionalTextStyle1,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.all(28),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: phtext(),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        setState(() {
                          showloading = true;
                        });
                        try {
                          PhoneAuthCredential credential =
                              PhoneAuthProvider.credential(
                                  verificationId: widget.verificationId,
                                  smsCode: _usernamelogincontroller.text);

                          // Sign the user in (or link) with the credential
                          await auth.signInWithCredential(credential);
                        } on FirebaseAuthException catch (e) {
                          setState(() {
                            Get.snackbar("error", e.message ?? "error");
                          });
                        }
                        setState(() {
                          showloading = false;
                        });

                        if (auth.currentUser != null) {
                          Navigator.of(context).push(PageRouteBuilder(
                            pageBuilder: (_, __, ___) => bottomScreen(),
                          ));
                        }
                      },
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all<Color>(
                            Color.fromARGB(255, 61, 66, 74)),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Color.fromARGB(255, 87, 189, 230)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24.0),
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(14.0),
                        child: Text(
                          'Verify',
                          style: GeneralStyle.additionalTextStyle1,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}

Widget phtext() {
  return TextFormField(
    keyboardType: TextInputType.number,
    maxLength: 6,
    style: GeneralStyle.additionalTextStyle1,
    //number input
    decoration: InputDecoration(
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black12),
          borderRadius: BorderRadius.circular(10)),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black12),
          borderRadius: BorderRadius.circular(10)),
      labelText: "The Code",
      labelStyle: GeneralStyle.additionalTextStyle1,
    ),
  );
}
