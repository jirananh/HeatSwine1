import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class SwineCodeModel {

  final String serviceid;
  final String parity;
  final String swinecode;
  final String codeleft;
  final String coderight;
  final String birthlot;
  final String birthdate;
  final String farrowtime;
  final String swinebreed;
  final String damcode;
  final String sirecode;
  final String birthweigth;
  final String mummylength;
  final String weight;
  final String weandate;
  final String deathdate;
  final String vasectomytype;
  final String livestockstatusid;
  final String swinebreederswinecode;
  final String househouseno;
  final String farmfarmcode;
  final String officeofficecode;
  final String branchbranchcode;
  final String flock;
  final String farmgrade;
  final String gendergendercode;
  final String livestockcodelivestockcode;
  final String livestockgradelivestockgrade;
  final String swinepiglethealthpiglethealthtext;
  SwineCodeModel({
    required this.serviceid,
    required this.parity,
    required this.swinecode,
    required this.codeleft,
    required this.coderight,
    required this.birthlot,
    required this.birthdate,
    required this.farrowtime,
    required this.swinebreed,
    required this.damcode,
    required this.sirecode,
    required this.birthweigth,
    required this.mummylength,
    required this.weight,
    required this.weandate,
    required this.deathdate,
    required this.vasectomytype,
    required this.livestockstatusid,
    required this.swinebreederswinecode,
    required this.househouseno,
    required this.farmfarmcode,
    required this.officeofficecode,
    required this.branchbranchcode,
    required this.flock,
    required this.farmgrade,
    required this.gendergendercode,
    required this.livestockcodelivestockcode,
    required this.livestockgradelivestockgrade,
    required this.swinepiglethealthpiglethealthtext,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'serviceid': serviceid,
      'parity': parity,
      'swinecode': swinecode,
      'codeleft': codeleft,
      'coderight': coderight,
      'birthlot': birthlot,
      'birthdate': birthdate,
      'farrowtime': farrowtime,
      'swinebreed': swinebreed,
      'damcode': damcode,
      'sirecode': sirecode,
      'birthweigth': birthweigth,
      'mummylength': mummylength,
      'weight': weight,
      'weandate': weandate,
      'deathdate': deathdate,
      'vasectomytype': vasectomytype,
      'livestockstatusid': livestockstatusid,
      'swinebreederswinecode': swinebreederswinecode,
      'househouseno': househouseno,
      'farmfarmcode': farmfarmcode,
      'officeofficecode': officeofficecode,
      'branchbranchcode': branchbranchcode,
      'flock': flock,
      'farmgrade': farmgrade,
      'gendergendercode': gendergendercode,
      'livestockcodelivestockcode': livestockcodelivestockcode,
      'livestockgradelivestockgrade': livestockgradelivestockgrade,
      'swinepiglethealthpiglethealthtext': swinepiglethealthpiglethealthtext,
    };
  }

  factory SwineCodeModel.fromMap(Map<String, dynamic> map) {
    return SwineCodeModel(
      serviceid: (map['serviceid'] ?? '') as String,
      parity: (map['parity'] ?? '') as String,
      swinecode: (map['swinecode'] ?? '') as String,
      codeleft: (map['codeleft'] ?? '') as String,
      coderight: (map['coderight'] ?? '') as String,
      birthlot: (map['birthlot'] ?? '') as String,
      birthdate: (map['birthdate'] ?? '') as String,
      farrowtime: (map['farrowtime'] ?? '') as String,
      swinebreed: (map['swinebreed'] ?? '') as String,
      damcode: (map['damcode'] ?? '') as String,
      sirecode: (map['sirecode'] ?? '') as String,
      birthweigth: (map['birthweigth'] ?? '') as String,
      mummylength: (map['mummylength'] ?? '') as String,
      weight: (map['weight'] ?? '') as String,
      weandate: (map['weandate'] ?? '') as String,
      deathdate: (map['deathdate'] ?? '') as String,
      vasectomytype: (map['vasectomytype'] ?? '') as String,
      livestockstatusid: (map['livestockstatusid'] ?? '') as String,
      swinebreederswinecode: (map['swinebreederswinecode'] ?? '') as String,
      househouseno: (map['househouseno'] ?? '') as String,
      farmfarmcode: (map['farmfarmcode'] ?? '') as String,
      officeofficecode: (map['officeofficecode'] ?? '') as String,
      branchbranchcode: (map['branchbranchcode'] ?? '') as String,
      flock: (map['flock'] ?? '') as String,
      farmgrade: (map['farmgrade'] ?? '') as String,
      gendergendercode: (map['gendergendercode'] ?? '') as String,
      livestockcodelivestockcode: (map['livestockcodelivestockcode'] ?? '') as String,
      livestockgradelivestockgrade: (map['livestockgradelivestockgrade'] ?? '') as String,
      swinepiglethealthpiglethealthtext: (map['swinepiglethealthpiglethealthtext'] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SwineCodeModel.fromJson(String source) => SwineCodeModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
