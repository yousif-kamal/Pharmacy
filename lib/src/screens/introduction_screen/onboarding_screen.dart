import 'package:drug_app/src/common/style/style.dart';
import 'package:drug_app/src/screens/auth_screens/login_scree.dart';
import 'package:drug_app/src/screens/auth_screens/start_screen.dart';
import 'package:drug_app/src/screens/introduction_screen/intro_page_1.dart';
import 'package:drug_app/src/screens/introduction_screen/intro_page_2.dart';
import 'package:drug_app/src/screens/introduction_screen/intro_page_3.dart';
import 'package:drug_app/src/screens/main_screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class onBoardingScreen extends StatefulWidget {
  const onBoardingScreen({super.key});

  @override
  State<onBoardingScreen> createState() => _onBoardingScreenState();
}

class _onBoardingScreenState extends State<onBoardingScreen> {
  PageController _controller = PageController();

  //keep track of if we are on the last page or not
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 2);
              });
            },
            controller: _controller,
            children: [
              //page view
              introPage1(),
              introPage2(),
              introPage3(),
            ],
          ),

          //smooth page
          Container(
            alignment: Alignment(0, 0.75),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //skip
                  GestureDetector(
                    onTap: () {
                      _controller.jumpToPage(2);
                    },
                    child: Text(
                      'Skip',
                      style: GeneralStyle.additionalTextStyle1,
                    ),
                  ),

                  //dot indicator
                  SmoothPageIndicator(controller: _controller, count: 3),

                  //next or done
                  onLastPage
                      ? GestureDetector(
                          onTap: () async {},
                          child: _registerbutton(context),
                        )
                      //
                      : GestureDetector(
                          onTap: () {
                            _controller.nextPage(
                                duration: Duration(microseconds: 500),
                                curve: Curves.bounceOut);
                          },
                          child: Text(
                            'Next',
                            style: GeneralStyle.additionalTextStyle1,
                          ),
                        ),
                ]),
          ),
        ],
      ),
    );
  }
}

Widget _registerbutton(context) {
  return SizedBox(
    width: 100,
    height: 40,
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
        child: Text(
          "Done",
          style: GeneralStyle.additionalTextStyle2,
        ),
      ),
    ),
  );
}
