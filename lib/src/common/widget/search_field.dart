// import 'package:drug_app/src/models/Drugs_model.dart';
// import 'package:drug_app/src/screens/tabs_screen/all.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// class SearchField extends StatefulWidget {
//   SearchField({super.key});

//   @override
//   State<SearchField> createState() => _SearchFieldState();
// }

// class _SearchFieldState extends State<SearchField> {
//   TextEditingController searchcontroller = TextEditingController();

//   String? searchParam;
//   List<DragsModel> filteredDrugs = [];

//     List<DragsModel> _drugsModel = [];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Row(
//             children: [
//               Expanded(
//                 flex: 1,
//                 child: IconButton(
//                   onPressed: () {
//                     setState(() {
//                       searchFuntion(
//                         drugsModel: _drugsModel,
//                         groupO
//                       );
//                     });
//                   },
//                   icon: FaIcon(FontAwesomeIcons.magnifyingGlass),
//                 ),
//               ),
//               Expanded(
//                 flex: 5,
//                 child: Form(
//                   child: TextFormField(
//                     controller: searchcontroller,
//                     style: TextStyle(fontSize: 20),
//                     decoration: InputDecoration(
//                       border: InputBorder.none,
//                       hintText: 'search by generic name',
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Expanded(
//                 child: IconButton(
//                   onPressed: () {
//                     searchcontroller.clear();
//                   },
//                   icon: GestureDetector(
//                     child: FaIcon(FontAwesomeIcons.eraser),
//                     onTap: () {
//                       searchcontroller.clear();
//                       setState(() {
//                         searchParam = null;
//                       });
//                     },
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           All(),
//         ],
//       ),
//     );
//   }

//   void searchFuntion(
//       {required List<DragsModel> DrugsModel, String? BrandName}) {
//     // Drugs... filter
//     //bo garanauay yak item first$last where man haya
//     if (BrandName == null) {
//       setState(() {
//         filteredDrugs = DrugsModel;
//       });
//     }
//     filteredDrugs = [];
//     setState(() {
//       filteredDrugs.addAll(DrugsModel.where((DrugsModel) {
//         return DrugsModel.BrandName.toLowerCase() == BrandName!.toLowerCase();
//       }).toList());
//     });
//   }
// }

