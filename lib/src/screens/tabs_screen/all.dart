// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:drug_app/src/common/style/style.dart';
// import 'package:drug_app/src/common/widget/loading_indicator.dart';
// import 'package:drug_app/src/models/Drugs_model.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';

// class All extends StatefulWidget {
//   const All({super.key});

//   @override
//   State<All> createState() => _AllState();
// }

// class _AllState extends State<All> {
//    String? searchParam;
//   String? selectedGroups;
//   List<DragsModel> filteredDrugs = [];
//   List<DragsModel> _drugsModel = [];
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
//         stream: FirebaseFirestore.instance
//             .collection("Drugs")
//             //to search b y query
//             // .where('BrandName', isEqualTo: searchParam)
//             .where('GroupOfDrug', isEqualTo: selectedGroups)
//             .snapshots(),
//         builder: ((context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return LoadingIndicator();
//           } else if (snapshot.hasError) {
//             return Center(
//               child: Text(snapshot.error.toString()),
//             );
//           }

//           //list of drugs
//           List<DragsModel> _drugsModel2 = snapshot.data!.docs
//               .map(
//                 (e) => DragsModel.fromMap(
//                   e.data(),
//                 ),
//               )
//               .toList();
//           _drugsModel.clear();
//           _drugsModel.addAll(_drugsModel2);

//           return snapshot.data == null || snapshot.data!.docs.isEmpty
//               ? Container(
//                   child: Center(
//                     child: Text(
//                       "empty",
//                       style: GeneralStyle.Title,
//                     ),
//                   ),
//                 )
//               : ListView.builder(
//                   //search by query
//                   // itemCount: _DrugsModel.length,
//                   itemCount:
//                       (filteredDrugs.length == 0 ? _drugsModel : filteredDrugs)
//                           .length,
//                   itemBuilder: (context, index) {
//                     return Card(
//                       child: ListTile(
//                         title: Text(
//                           /*_DrugsModel by query*/
//                           (filteredDrugs.length == 0
//                                   ? _drugsModel
//                                   : filteredDrugs)[index]
//                               .BrandName,
//                           style: GeneralStyle.Title,
//                         ),
//                         subtitle: Text(
//                           /*_DrugsModel by query*/
//                           (filteredDrugs.length == 0
//                                   ? _drugsModel
//                                   : filteredDrugs)[index]
//                               .GenericName,
//                           style: GeneralStyle.Title1,
//                         ),
//                         trailing: Icon(
//                           Icons.arrow_forward,
//                         ),
//                         onTap: () {
//                           print("soon");
//                         },
//                       ),
//                     );
//                   });
//         }),
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
