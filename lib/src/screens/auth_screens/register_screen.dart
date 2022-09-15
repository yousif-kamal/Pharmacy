import 'package:drug_app/src/common/style/style.dart';
import 'package:drug_app/src/common/widget/costume_button.dart';
import 'package:drug_app/src/common/widget/costume_textfield.dart';
import 'package:drug_app/src/common/widget/loading_indicator.dart';
import 'package:drug_app/src/screens/auth_screens/logIn_screen.dart';
import 'package:drug_app/src/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class RegisterSCreen extends StatefulWidget {
  const RegisterSCreen({super.key});

  @override
  State<RegisterSCreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterSCreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  AuthService authService = AuthService();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: isLoading == true
            ? LoadingIndicator()
            : SingleChildScrollView(
                child: Container(
                    padding: EdgeInsets.all(16),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Image.asset(
                            'assets/images/otp.png',
                            height: 300,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Text(
                                'Register',
                                style: GeneralStyle.Titleregister,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Text(
                                'Please Fill Information',
                                style: GeneralStyle.Title1,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            margin: EdgeInsets.all(20),
                            child: Form(
                              child: Column(children: [
                                CostumeTextField(
                                  hint: 'Email',
                                  control: emailController,
                                  icon: Icon(Icons.alternate_email),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                CostumeTextField(
                                  hint: 'Password',
                                  control: passwordController,
                                  icon: Icon(Icons.lock_outline),
                                ),
                                SizedBox(
                                  height: 50,
                                ),
                                CostumeButton(
                                  onPressedd: () async {
                                    setState(() {
                                      isLoading = true;
                                    });
                                    //first step firebase auth to register user with the auth
                                    await authService
                                        .createUserWithEmailAndPassword(
                                            email: emailController.text.trim(),
                                            password:
                                                passwordController.text.trim());

                                    setState(() {
                                      isLoading = false;
                                    });
                                    Get.to(() => LoginScreen());
                                    setState(() {
                                      isLoading = false;
                                    });
                                  },
                                  color: Color.fromARGB(255, 91, 151, 241),
                                  text: Text('Register',
                                      style: GeneralStyle.additionalTextStyle2),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20.0),
                                      child: Text("Already Have An Account ? ",
                                          style: GeneralStyle.Title1),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          isLoading = true;
                                        });
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                LoginScreen(),
                                          ),
                                        );
                                        setState(() {
                                          isLoading = false;
                                        });
                                      },
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(top: 20.0),
                                        child: Text('Login',
                                            style: GeneralStyle.Title11),
                                      ),
                                    )
                                  ],
                                )
                              ]),
                            ),
                          )
                        ]))));
  }
}
