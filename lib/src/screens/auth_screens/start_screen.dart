// import 'package:drug_app/src/common/style/style.dart';
// import 'package:drug_app/src/screens/auth_screens/login_scree.dart';
// import 'package:drug_app/src/common/widget/General_Button.dart';
// import 'package:flutter/material.dart';

// class StartScreen extends StatelessWidget {
//   const StartScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       backgroundColor: Color(0xffffffff),
//       body: SafeArea(
//           child: Padding(
//         padding: EdgeInsets.symmetric(vertical: 24, horizontal: 32),
//         child: Column(
//           children: [
//             Image.asset("assets/images/anti.png"),
//             SizedBox(
//               height: 50,
//             ),
//             Text(
//               "Welcome",
//               style: GeneralStyle.additionalTextStyle,
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             Text(
//               "let's start",
//               style: GeneralStyle.additionalTextStyle1,
//               textAlign: TextAlign.center,
//             ),

//             SizedBox(
//               height: 50,
//             ),

//             //create account button
//             signUp(context),
//             SizedBox(
//               height: 20,
//             ),
//           ],
//         ),
//       )),
//     );
//   }
// }

// Widget signUp(context) {
//   return SizedBox(
//     width: double.infinity,
//     child: ElevatedButton(
//       onPressed: () {
//         Navigator.of(context).push(MaterialPageRoute(
//           builder: (context) => RegisterScreen(),
//         ));
//       },
//       style: ButtonStyle(
//         foregroundColor:
//             MaterialStateProperty.all<Color>(Color.fromARGB(255, 61, 66, 74)),
//         backgroundColor:
//             MaterialStateProperty.all<Color>(Color.fromARGB(255, 87, 189, 230)),
//         shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//           RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(20),
//           ),
//         ),
//       ),
//       child: Padding(
//         padding: EdgeInsets.all(10),
//         child: Text(
//           "Sign Up",
//           style: GeneralStyle.additionalTextStyle1,
//         ),
//       ),
//     ),
//   );
// }
