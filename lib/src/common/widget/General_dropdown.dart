import 'package:drug_app/src/common/style/style.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GeneralDropDownButton extends StatelessWidget {
  GeneralDropDownButton(
      {Key? key,
      this.selectedItem,
      required this.itemsList,
      required this.valueChanged})
      : super(key: key);
  String? selectedItem;
  final List<String> itemsList;
  final ValueChanged<String> valueChanged;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      child: DropdownButtonFormField<String>(
          icon: FaIcon(FontAwesomeIcons.arrowTurnDown),
          iconSize: 20,
          iconEnabledColor: Color.fromARGB(255, 91, 151, 241),
          decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 91, 151, 241))),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 91, 151, 241),
                    width: 1,
                  ))),
          value: selectedItem ?? itemsList.first,
          items: itemsList
              .map((item) => DropdownMenuItem(
                  value: item,
                  child: Text(
                    item,
                    // Style of text inside Drop Down Button
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 20,
                        color: Color.fromARGB(255, 91, 151, 241)),
                  )))
              .toList(),
          onChanged: (item) {
            // setState(() {

            //     selec = item;
            //   });
            valueChanged(item!);
          }),
    );
  }
}
