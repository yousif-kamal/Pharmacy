import 'package:drug_app/src/common/widget/loading_indicator.dart';
import 'package:drug_app/src/screens/auth_screens/logIn_screen.dart';
import 'package:drug_app/src/screens/main_screens/buttom_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HandlerScreen extends StatelessWidget {
  const HandlerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return LoadingIndicator();
          } else if (snapshot.data == null) {
            return LoginScreen();
          } else if (snapshot.hasError) {
            return Center(
              child: Text("error"),
            );
          } else {
            return bottomScreen();
          }
        },
      ),
    );
  }
}
