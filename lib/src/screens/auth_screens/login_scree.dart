import 'package:drug_app/src/common/style/style.dart';
import 'package:drug_app/src/screens/auth_screens/otp_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

bool showloading = false;
final TextEditingController _phonenumbercontroller = TextEditingController();

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xffffffff),
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
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                    size: 32,
                  ),
                ),
              ),

              Image.asset(
                "assets/images/sin.png",
                height: 300,
              ),
              SizedBox(
                height: 30,
              ),

              Text(
                "Create an account",
                style: GeneralStyle.additionalTextStyle,
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Please fill you're information",
                style: GeneralStyle.additionalTextStyle1,
              ),
              SizedBox(
                height: 10,
              ),
              //this container consist of a form that have list of textfield
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 25,
                    ),
                    //phone numbe textfield
                    // _phonenumbertextfield(),
                    phtext(),

                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "7714551212",
                        style: GeneralStyle.additionalTextStyle1,
                        textAlign: TextAlign.left,
                      ),
                    ),

                    SizedBox(
                      height: 25,
                    ),
                    //button register
                    _Registerbutton(context),
                  ],
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}

Widget _Registerbutton(context) {
  return SizedBox(
    width: double.infinity,
    child: ElevatedButton(
      onPressed: () async {
        setState() {
          showloading = true;
        }

        await FirebaseAuth.instance.verifyPhoneNumber(
          phoneNumber: '+964${_phonenumbercontroller.text}',
          verificationCompleted: (PhoneAuthCredential credential) {},
          verificationFailed: (FirebaseAuthException e) {
            setState() {
              showloading = false;
            }

            if (e.code == 'invalid-phone-number') {
              Get.snackbar("error", e.message ?? "error");
            }
          },
          codeSent: (String verificationId, int? resendToken) {
            setState() {
              showloading = false;
            }

            Navigator.of(context).pushReplacement(PageRouteBuilder(
              pageBuilder: (_, __, ___) =>
                  Verify(verificationId: verificationId),
            ));
          },
          codeAutoRetrievalTimeout: (String verificationId) {},
        );
        //
        // Navigator.of(context).push(MaterialPageRoute(
        //   builder: (context) => otpScreen(),
        // ));
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
        child: Text(
          "Register",
          style: GeneralStyle.additionalTextStyle1,
        ),
      ),
    ),
  );
}

//

// Widget _loginbutton(context) {
//   return SizedBox(
//     width: double.infinity,
//     child: ElevatedButton(
//       onPressed: () {
//         Navigator.of(context).push(
//           MaterialPageRoute(
//             builder: (context) => LoginScreen(),
//           ),
//         );
//       },
//       style: ButtonStyle(
//         foregroundColor: MaterialStateProperty.all<Color>(Colors.pink),
//         backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
//         shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//           RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(20),
//           ),
//         ),
//       ),
//       child: Padding(
//         padding: EdgeInsets.all(10),
//         child: Text("Login"),
//       ),
//     ),
//   );
// }

// Widget _logintext(context) {
//   return TextButton(
//       onPressed: () {
//         Navigator.of(context).push(MaterialPageRoute(
//           builder: (context) => LoginScreen(),
//         ));
//       },
//       child: Text(
//         "Have an account !",
//         style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 61, 66, 74)),
//       ));
// }

// Widget _phonenumbertextfield() {
//   return TextFormField(
//     controller: _phonenumbercontroller,
//     keyboardType: TextInputType.number,
//     decoration: InputDecoration(
//       focusedBorder: OutlineInputBorder(
//         borderSide: BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
//         borderRadius: BorderRadius.circular(5.5),
//       ),
//       enabledBorder: OutlineInputBorder(
//         borderSide: BorderSide(
//           color: Color.fromARGB(255, 204, 200, 200),
//         ),
//       ),
//       prefixIcon: Icon(
//         Icons.phone,
//         color: Color.fromARGB(255, 0, 0, 0),
//       ),
//       filled: true,
//       fillColor: Color.fromARGB(255, 255, 255, 255),
//       labelText: "Enter your phone nuber",
//       labelStyle: GeneralStyle.additionalTextStyle1,
//     ),
//   );
// }

//phone number textfield
Widget phtext() {
  return TextFormField(
    keyboardType: TextInputType.number,
    maxLength: 11,
    style: GeneralStyle.additionalTextStyle1,
    //number input
    decoration: InputDecoration(
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black12),
          borderRadius: BorderRadius.circular(10)),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black12),
          borderRadius: BorderRadius.circular(10)),
      prefix: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: Text(
          "(+964)",
          style: GeneralStyle.additionalTextStyle1,
        ),
      ),
      // suffixIcon: Icon(
      //   Icons.check_circle,
      //   color: Colors.green,
      //   size: 32,
      // ),
    ),
  );
}
