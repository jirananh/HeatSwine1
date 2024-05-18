import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class HeatDetactionModel {
  final String? id;
  final String swineCode;
  final String farmFarmCode;
  final String age;
  final String listCaseAnimals;
  final String startTime;
  final String finishTime;
  final String recorder;
  final String inspector;
  final String wight;
  final String breastLeft;
  final String brestRight;
  final String pen;
  HeatDetactionModel({
    this.id,
    required this.swineCode,
    required this.farmFarmCode,
    required this.age,
    required this.listCaseAnimals,
    required this.startTime,
    required this.finishTime,
    required this.recorder,
    required this.inspector,
    required this.wight,
    required this.breastLeft,
    required this.brestRight,
    required this.pen,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'swineCode': swineCode,
      'farmFarmCode': farmFarmCode,
      'age': age,
      'listCaseAnimals': listCaseAnimals,
      'startTime': startTime,
      'finishTime': finishTime,
      'recorder': recorder,
      'inspector': inspector,
      'wight': wight,
      'breastLeft': breastLeft,
      'brestRight': brestRight,
      'pen': pen,
    };
  }

  factory HeatDetactionModel.fromMap(Map<String, dynamic> map) {
    return HeatDetactionModel(
      id: map['id'] != null ? map['id'] as String : null,
      swineCode: (map['swineCode'] ?? '') as String,
      farmFarmCode: (map['farmFarmCode'] ?? '') as String,
      age: (map['age'] ?? '') as String,
      listCaseAnimals: (map['listCaseAnimals'] ?? '') as String,
      startTime: (map['startTime'] ?? '') as String,
      finishTime: (map['finishTime'] ?? '') as String,
      recorder: (map['recorder'] ?? '') as String,
      inspector: (map['inspector'] ?? '') as String,
      wight: (map['wight'] ?? '') as String,
      breastLeft: (map['breastLeft'] ?? '') as String,
      brestRight: (map['brestRight'] ?? '') as String,
      pen: (map['pen'] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory HeatDetactionModel.fromJson(String source) =>
      HeatDetactionModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
