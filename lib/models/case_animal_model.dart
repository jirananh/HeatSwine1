import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class CaseAnimalModel {
  final String id;
  final String caseAnimal;
  CaseAnimalModel({
    required this.id,
    required this.caseAnimal,
  });
  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'caseAnimal': caseAnimal,
    };
  }

  factory CaseAnimalModel.fromMap(Map<String, dynamic> map) {
    return CaseAnimalModel(
      id: (map['id'] ?? '') as String,
      caseAnimal: (map['caseAnimal'] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CaseAnimalModel.fromJson(String source) => CaseAnimalModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
