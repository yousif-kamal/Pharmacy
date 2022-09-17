import 'package:drug_app/src/common/widget/costume_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class infoScreen extends StatelessWidget {
  const infoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CostumeButton(
            onPressedd: () => FirebaseAuth.instance.signOut(),
            color: Color.fromARGB(255, 91, 151, 241),
            text: Text("Log out")),
      ),
    );
  }
}
