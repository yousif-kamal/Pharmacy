import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drug_app/src/common/style/style.dart';
import 'package:drug_app/src/common/widget/loading_indicator.dart';
import 'package:drug_app/src/models/Drugs_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProteinSynth extends StatefulWidget {
  const ProteinSynth({super.key});

  @override
  State<ProteinSynth> createState() => _ProteinSynthState();
}

class _ProteinSynthState extends State<ProteinSynth> {
  List<DragsModel> _drugsModel = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance
            .collection("Drugs")
            .doc("Antibiotics")
            .collection("Antibiotics")
            .doc("Antibiotics")
            .collection("Protien synthesis")
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
          List<DragsModel> _drugsModel = snapshot.data!.docs
              .map(
                (e) => DragsModel.fromMap(
                  e.data(),
                ),
              )
              .toList();

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
                  itemCount: _drugsModel.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text(_drugsModel[index].BrandName),
                        subtitle: Text(_drugsModel[index].GenericName),
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
    );
  }
}
