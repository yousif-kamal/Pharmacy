import 'package:drug_app/src/common/style/style.dart';
import 'package:flutter/material.dart';

class CostumeTextField extends StatelessWidget {
  const CostumeTextField({
    Key? key,
    required this.hint,
    required this.icon,
    required this.control,
  }) : super(key: key);

  final String hint;
  final Icon icon;
  final TextEditingController control;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: control,
      decoration: InputDecoration(
        icon: icon,
        hintText: hint,
        hintStyle: GeneralStyle.Title1,
        iconColor: Color.fromARGB(255, 91, 151, 241),
      ),
    );
  }
}
