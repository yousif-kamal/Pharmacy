// //import 'package:drug_app/src/models/Drugs_model.dart';
// import 'package:drug_app/src/common/style/style.dart';
// import 'package:drug_app/src/models/Drugs_model.dart';
// import 'package:drug_app/src/common/widget/loading_indicator.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// class AntibioticDetailScreen extends StatefulWidget {
//   const AntibioticDetailScreen({Key? key}) : super(key: key);

//   @override
//   State<AntibioticDetailScreen> createState() => _AntibioticDetailScreenState();
// }

// class _AntibioticDetailScreenState extends State<AntibioticDetailScreen>
//     with SingleTickerProviderStateMixin {
//   TabController? _controller;
//   TextEditingController searchcontroller = TextEditingController();
//   String? searchParam;
//   List<DragsModel> filteredDrugs = [];
//   List<DragsModel> _drugsModel = [];

//   @override
//   void initState() {
//     super.initState();
//     _controller = TabController(length: 3, vsync: this, initialIndex: 1);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 3,
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         appBar: AppBar(
//           backgroundColor: Color.fromARGB(255, 91, 151, 241),
//           title: Align(
//             child: Text(
//               "Antibiotics",
//               style: TextStyle(
//                 color: Color.fromARGB(255, 255, 255, 255),
//                 fontSize: 20,
//                 fontFamily: 'Roboto',
//               ),
//             ),
//             alignment: Alignment.center,
//           ),
//         ),
//         body: Column(
//           children: [
//             SizedBox(
//               height: 10,
//             ),
//             Row(
//               children: [
//                 Expanded(
//                   flex: 1,
//                   child: IconButton(
//                     onPressed: () {
//                       setState(() {
//                         searchFuntion(
//                           drugsModel: _drugsModel,
//                           groupOfDrug: searchcontroller.text,
//                         );
//                       });
//                     },
//                     icon: FaIcon(FontAwesomeIcons.magnifyingGlass),
//                   ),
//                 ),
//                 Expanded(
//                   flex: 5,
//                   child: Form(
//                     child: TextFormField(
//                       controller: searchcontroller,
//                       style: TextStyle(fontSize: 20),
//                       decoration: InputDecoration(
//                         border: InputBorder.none,
//                         hintText: 'search by generic name',
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Expanded(
//                   child: IconButton(
//                     onPressed: () {
//                       searchcontroller.clear();
//                     },
//                     icon: GestureDetector(
//                       child: FaIcon(FontAwesomeIcons.eraser),
//                       onTap: () {
//                         searchcontroller.clear();
//                         setState(() {
//                           searchParam = null;
//                         });
//                       },
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             //
//             Expanded(
//               flex: 2,
//               child: TabBar(
//                 indicatorColor: Color.fromARGB(255, 91, 151, 241),
//                 labelColor: Color.fromARGB(255, 91, 151, 241),
//                 controller: _controller,
//                 tabs: [
//                   Tab(
//                     text: 'All Antibiotics',
//                   ),
//                   Tab(
//                     text: 'teo',
//                   ),
//                   Tab(
//                     text: 'three',
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: 15,
//             ),
//             Expanded(
//               flex: 7,
//               child: TabBarView(
//                 children: [
//                   StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
//                     stream: FirebaseFirestore.instance
//                         .collection("Drugs")
//                         .where('GroupOfDrug', isEqualTo: searchParam)
//                         .snapshots(),
//                     builder: ((context, snapshot) {
//                       if (snapshot.connectionState == ConnectionState.waiting) {
//                         return LoadingIndicator();
//                       } else if (snapshot.hasError) {
//                         return Center(
//                           child: Text(snapshot.error.toString()),
//                         );
//                       } else if (snapshot.data == null ||
//                           snapshot.data!.docs.isEmpty) {
//                         return Center(
//                           child: Text("no data"),
//                         );
//                       }

//                       List<DragsModel> _drugsModel2 = snapshot.data!.docs
//                           .map(
//                             (e) => DragsModel.fromMap(
//                               e.data(),
//                             ),
//                           )
//                           .toList();
//                       _drugsModel.clear();
//                       _drugsModel.addAll(_drugsModel2);

//                       return ListView.builder(
//                           itemCount: _drugsModel.length,
//                           itemBuilder: (context, index) {
//                             return Card(
//                               child: ListTile(
//                                 title: Text(_drugsModel[index].BrandName),
//                                 subtitle: Text(_drugsModel[index].GenericName),
//                                 trailing: Icon(
//                                   Icons.arrow_forward,
//                                 ),
//                                 onTap: () {
//                                   print("soon");
//                                 },
//                               ),
//                             );
//                           });
//                     }),
//                   ),
//                   Container(
//                     child: Text("uwefguye"),
//                   ),
//                   Container(
//                     child: Text("uwefguye"),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void searchFuntion(
//       {required List<DragsModel> drugsModel, String? groupOfDrug}) {
//     // Drugs... filter
//     //bo garanauay yak item first$last where man haya
//     if (groupOfDrug == null) {
//       setState(() {
//         filteredDrugs = drugsModel;
//       });
//     }
//     filteredDrugs = [];
//     setState(() {
//       filteredDrugs.addAll(drugsModel
//           .where((DrugsModel) =>
//               DrugsModel.GroupOfDrug.toLowerCase() ==
//               groupOfDrug!.toLowerCase())
//           .toList());
//     });
//   }
// }
