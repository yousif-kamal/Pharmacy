import 'dart:ffi';

import 'package:drug_app/src/common/style/style.dart';
import 'package:drug_app/src/screens/detail_screen/antibiotics_detail_screen.dart';
import 'package:flutter/material.dart';

class HomeScreenView extends StatefulWidget {
  const HomeScreenView({Key? key}) : super(key: key);

  @override
  State<HomeScreenView> createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        toolbarHeight: 250,
        automaticallyImplyLeading: false,
        elevation: 5,
        backgroundColor: Color.fromARGB(255, 132, 210, 220),
        flexibleSpace: ClipRRect(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50)),
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/back.jpg'),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50)),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 1,
            ),
            Expanded(
              flex: 8,
              child: Container(
                width: 350,
                child: ListView(
                  children: [
                    SizedBox(
                      height: 15,
                    ),

                    //antibiotic
                    Stack(
                      //alignment: Alignment.topCenter,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => AntibioticDetailScreen(),
                            ));
                          },
                          child: Container(
                            padding: EdgeInsets.all(50),
                            height: 150,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color.fromARGB(255, 91, 151, 241),
                                  Color.fromARGB(255, 158, 214, 247)
                                ],
                                begin: Alignment.bottomLeft,
                                end: Alignment.bottomCenter,
                              ),
                              //color: Color.fromARGB(255, 91, 151, 241),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 30,
                          top: 50,
                          child: Text(
                            "Antibiotic",
                            style: GeneralStyle.additionalTextStyle2,
                          ),
                        ),
                        //png
                        Positioned(
                          right: 0,
                          height: 180,
                          child: Image(
                            image: AssetImage("assets/images/anti.png"),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(
                      height: 20,
                    ),

                    //vitamins
                    Stack(
                      //alignment: Alignment.topCenter,
                      children: [
                        GestureDetector(
                          onTap: () {
                            print("welcome to vit");
                          },
                          child: Container(
                            padding: EdgeInsets.all(50),
                            height: 150,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color.fromARGB(255, 247, 143, 204),
                                  Color.fromARGB(209, 247, 143, 204)
                                ],
                                begin: Alignment.bottomLeft,
                                end: Alignment.bottomCenter,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 30,
                          top: 50,
                          child: Text(
                            "Soon",
                            style: GeneralStyle.additionalTextStyle2,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(
                      height: 18,
                    ),

                    //another box
                    Stack(
                      //alignment: Alignment.topCenter,
                      children: [
                        GestureDetector(
                          onTap: () {
                            print("welcome to vit");
                          },
                          child: Container(
                            padding: EdgeInsets.all(50),
                            height: 150,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 91, 151, 241),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 30,
                          top: 50,
                          child: Text(
                            "Soon",
                            style: GeneralStyle.additionalTextStyle2,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
