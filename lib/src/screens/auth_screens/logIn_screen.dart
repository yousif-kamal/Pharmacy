import 'package:drug_app/src/common/style/style.dart';
import 'package:drug_app/src/common/widget/costume_button.dart';
import 'package:drug_app/src/common/widget/costume_textfield.dart';
import 'package:drug_app/src/common/widget/loading_indicator.dart';
import 'package:drug_app/src/screens/auth_screens/register_screen.dart';
import 'package:drug_app/src/screens/main_screens/buttom_navigation_bar.dart';
import 'package:drug_app/src/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                      height: 15,
                    ),
                    Image.asset(
                      "assets/images/sin.png",
                      height: 300,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Text(
                          'Welcome Back',
                          style: GeneralStyle.Titleregister,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Text(
                          'Please fill your information',
                          style: GeneralStyle.Title1,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      margin: EdgeInsets.all(20),
                      child: Form(
                          child: Column(
                        children: [
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
                          Align(
                            alignment: Alignment(1, 1),
                            child: GestureDetector(
                              onTap: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (BuildContext context) =>
                                //         ForgotPassScreen(),
                                //   ),
                                // );
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(top: 15.0),
                                child: Text('Forgot Password ?',
                                    style: GeneralStyle.Title11),
                              ),
                            ),
                          ),
                        ],
                      )),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    CostumeButton(
                      onPressedd: () async {
                        setState(() {
                          isLoading = true;
                        });
                        //First step auth with firebase auth
                        await authService.signInWithEmailAndPassword(
                          email: emailController.text.trim(),
                          password: passwordController.text.trim(),
                        );
                        setState(() {
                          isLoading = false;
                        });
                        Get.to(() => bottomScreen());
                        //.then((value) => Get.to(() => HandlerScreen())
                        setState(() {
                          isLoading = false;
                        });
                      },
                      color: Color.fromARGB(255, 91, 151, 241),
                      text: Text('Login',
                          style: GeneralStyle.additionalTextStyle2),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Text("Don't Have An Account ? ",
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
                                    RegisterSCreen(),
                              ),
                            );
                            setState(() {
                              isLoading = false;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child:
                                Text('Register', style: GeneralStyle.Title11),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
