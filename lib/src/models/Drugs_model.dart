import 'dart:convert';

import 'package:flutter/cupertino.dart';

class DragsModel {
  String BrandName;
  String GenericName;
  String GroupOfDrug;
  String? TypeOfDrug;
  String? Sub_effect;
  String? Instruction;
  String? DrugImage;
  DragsModel({
    required this.BrandName,
    required this.GenericName,
    required this.GroupOfDrug,
    this.TypeOfDrug,
    this.Sub_effect,
    this.Instruction,
    this.DrugImage,
  });

  DragsModel copyWith({
    String? BrandName,
    String? GenericName,
    String? GroupOfDrug,
    String? TypeOfDrug,
    String? Sub_effect,
    String? Instruction,
    String? DrugImage,
  }) {
    return DragsModel(
      BrandName: BrandName ?? this.BrandName,
      GenericName: GenericName ?? this.GenericName,
      GroupOfDrug: GroupOfDrug ?? this.GroupOfDrug,
      TypeOfDrug: TypeOfDrug ?? this.TypeOfDrug,
      Sub_effect: Sub_effect ?? this.Sub_effect,
      Instruction: Instruction ?? this.Instruction,
      DrugImage: DrugImage ?? this.DrugImage,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'BrandName': BrandName,
      'GenericName': GenericName,
      'GroupOfDrug': GroupOfDrug,
      'TypeOfDrug': TypeOfDrug,
      'Sub_effect': Sub_effect,
      'Instruction': Instruction,
      'DrugImage': DrugImage,
    };
  }

  factory DragsModel.fromMap(Map<String, dynamic> map) {
    return DragsModel(
      BrandName: map['BrandName'] as String,
      GenericName: map['GenericName'] as String,
      GroupOfDrug: map['GroupOfDrug'] as String,
      TypeOfDrug:
          map['TypeOfDrug'] != null ? map['TypeOfDrug'] as String : null,
      Sub_effect:
          map['Sub_effect'] != null ? map['Sub_effect'] as String : null,
      Instruction:
          map['Instruction'] != null ? map['Instruction'] as String : null,
      DrugImage: map['DrugImage'] != null ? map['DrugImage'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory DragsModel.fromJson(String source) =>
      DragsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'DragsModel(BrandName: $BrandName, GenericName: $GenericName, GroupOfDrug: $GroupOfDrug, TypeOfDrug: $TypeOfDrug, Sub_effect: $Sub_effect, Instruction: $Instruction, DrugImage: $DrugImage)';
  }

  @override
  bool operator ==(covariant DragsModel other) {
    if (identical(this, other)) return true;

    return other.BrandName == BrandName &&
        other.GenericName == GenericName &&
        other.GroupOfDrug == GroupOfDrug &&
        other.TypeOfDrug == TypeOfDrug &&
        other.Sub_effect == Sub_effect &&
        other.Instruction == Instruction &&
        other.DrugImage == DrugImage;
  }

  @override
  int get hashCode {
    return BrandName.hashCode ^
        GenericName.hashCode ^
        GroupOfDrug.hashCode ^
        TypeOfDrug.hashCode ^
        Sub_effect.hashCode ^
        Instruction.hashCode ^
        DrugImage.hashCode;
  }
}
