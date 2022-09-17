import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drug_app/src/common/style/style.dart';
import 'package:drug_app/src/models/Drugs_model.dart';
import 'package:drug_app/src/common/widget/General_dropdown.dart';
import 'package:drug_app/src/common/widget/Groups.dart';
import 'package:drug_app/src/common/widget/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class searchScreen extends StatefulWidget {
  searchScreen({Key? key}) : super(key: key);

  @override
  State<searchScreen> createState() => _searchScreenState();
}

class _searchScreenState extends State<searchScreen> {
  TextEditingController searchController = TextEditingController();
  String? searchParam;
  String? selectedGroups;
  // list of drugs to filter
  List<DragsModel> filteredDrugs = [];
  List<DragsModel> _drugsModel = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffffffff),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color(0xfffffffff),
          elevation: 0.0,
          title: Text(
            "Search by Brand name",
            style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 20,
              color: Color.fromARGB(255, 91, 151, 241),
            ),
          ),
        ),
        body: Column(children: [
          //
          // Text(
          //   "search for your drug",
          //   style: TextStyle(
          //       color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
          // ),
          // //
          // SizedBox(
          //   height: 20,
          // ),

          //seatch textfield $ dropdown
          Container(
            height: 160,
            child: Column(
              children: [
                Container(
                  height: 80,
                  child: Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                //TODO add a result to a vireable
                                searchFuntion(
                                  DrugsModel: _drugsModel,
                                  BrandName: searchController.text,
                                );

                                //to search by query
                                //searchParam = searchController.text;
                              });
                            },
                            icon: FaIcon(
                              FontAwesomeIcons.magnifyingGlass,
                              color: Color.fromARGB(255, 91, 151, 241),
                              size: 20,
                            ),
                          )),
                      Expanded(
                        flex: 5,
                        child: Form(
                          child: TextFormField(
                            controller: searchController,
                            style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 91, 151, 241),
                            ),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Search by brand name name',
                                hintStyle: GeneralStyle.Title1),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: IconButton(
                          onPressed: () {
                            searchController.clear();
                          },
                          icon: GestureDetector(
                            child: FaIcon(
                              FontAwesomeIcons.eraser,
                              color: Color.fromARGB(255, 91, 151, 241),
                              size: 20,
                            ),
                            onTap: () {
                              searchController.clear();
                              setState(() {
                                //search by query
                                // searchParam = null;
                                filteredDrugs = [];
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                //dropdown
                Container(
                  height: 75,
                  child: GeneralDropDownButton(
                      itemsList: requireGruops.groupofDrugs,
                      //this variable we want change it
                      selectedItem: selectedGroups,
                      valueChanged: ((value) {
                        setState(() {
                          if (value == 'All') {
                            selectedGroups = null;
                          } else {
                            selectedGroups = value;
                          }
                        });
                      })),
                ),
              ],
            ),
          ),
          //
          SizedBox(
            height: 10,
          ),
          Divider(
            indent: 10.0,
            endIndent: 10.0,
            thickness: 0.4,
            height: 10,
            color: Color.fromARGB(255, 91, 151, 241),
          ),

          SizedBox(
            height: 10,
          ),

          //stream builder
          Expanded(
            child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream: FirebaseFirestore.instance
                  .collection("Drugs")
                  //to search b y query
                  // .where('BrandName', isEqualTo: searchParam)
                  .where('GroupOfDrug', isEqualTo: selectedGroups)
                  .snapshots(),
              builder: ((context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return LoadingIndicator();
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                }

                //list of drugs
                List<DragsModel> _drugsModel2 = snapshot.data!.docs
                    .map(
                      (e) => DragsModel.fromMap(
                        e.data(),
                      ),
                    )
                    .toList();
                _drugsModel.clear();
                _drugsModel.addAll(_drugsModel2);

                return snapshot.data == null || snapshot.data!.docs.isEmpty
                    ? Container(
                        child: Center(
                          child: Text(
                            "empty",
                            style: GeneralStyle.Title,
                          ),
                        ),
                      )
                    : ListView.builder(
                        //search by query
                        // itemCount: _DrugsModel.length,
                        itemCount: (filteredDrugs.length == 0
                                ? _drugsModel
                                : filteredDrugs)
                            .length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: ListTile(
                              title: Text(
                                /*_DrugsModel by query*/
                                (filteredDrugs.length == 0
                                        ? _drugsModel
                                        : filteredDrugs)[index]
                                    .BrandName,
                                style: GeneralStyle.Title,
                              ),
                              subtitle: Text(
                                /*_DrugsModel by query*/
                                (filteredDrugs.length == 0
                                        ? _drugsModel
                                        : filteredDrugs)[index]
                                    .GenericName,
                                style: GeneralStyle.Title1,
                              ),
                              trailing: Icon(
                                Icons.arrow_forward,
                              ),
                              onTap: () {
                                print("soon");
                              },
                            ),
                          );
                        });
              }),
            ),
          )
        ]));
  }

  //searchFunction method
  //listek la drug wardagretawaw listekish wardagry
  void searchFuntion(
      {required List<DragsModel> DrugsModel, String? BrandName}) {
    // Drugs... filter
    //bo garanauay yak item first$last where man haya
    if (BrandName == null) {
      setState(() {
        filteredDrugs = DrugsModel;
      });
    }
    filteredDrugs = [];
    setState(() {
      filteredDrugs.addAll(DrugsModel.where((DrugsModel) {
        return DrugsModel.BrandName.toLowerCase() == BrandName!.toLowerCase();
      }).toList());
    });
  }
}
