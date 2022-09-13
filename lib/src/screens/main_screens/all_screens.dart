// import 'package:drug_app/src/screens/main_screens/home_screen.dart';
// import 'package:drug_app/src/screens/main_screens/info.dart';
// import 'package:drug_app/src/screens/main_screens/search_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// class allScreens extends StatefulWidget {
//   const allScreens({Key? key}) : super(key: key);

//   @override
//   State<allScreens> createState() => _allScreensState();
// }

// class _allScreensState extends State<allScreens> {
//   int Index = 0;
//   final screens = [
//     HomeScreenView(),
//     searchScreen(),
//     infoScreen(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: screens[Index],
//       bottomNavigationBar: NavigationBarTheme(
//         data: NavigationBarThemeData(
//           labelTextStyle: MaterialStateProperty.all(
//             TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
//           ),
//         ),
//         child: NavigationBar(
//           labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
//           animationDuration: Duration(seconds: 3),
//           selectedIndex: Index,
//           onDestinationSelected: (Index) {
//             setState(() {
//               this.Index = Index;
//             });
//           },
//           height: 80,
//           backgroundColor: Color.fromARGB(255, 208, 226, 254),
//           destinations: [
//             NavigationDestination(
//               icon: FaIcon(Icons.home_outlined),
//               selectedIcon: Icon(Icons.home_outlined),
//               label: 'Home',
//             ),
//             //
//             NavigationDestination(
//               icon: FaIcon(Icons.search_outlined),
//               selectedIcon: Icon(Icons.search_outlined),
//               label: 'Search',
//             ),
//             //
//             NavigationDestination(
//               icon: FaIcon(Icons.info_outline),
//               selectedIcon: FaIcon(Icons.info_outline),
//               label: 'Info',
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
