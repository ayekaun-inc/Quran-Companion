class AyatModel {
  String? urdu;
  String? arabic;
  int? ayatId;
  int? surahId;
  String? surahName;
  int? paraId;
  String? paraName;

  AyatModel(
      {this.urdu,
      this.arabic,
      this.ayatId,
      this.surahId,
      this.surahName,
      this.paraId,
      this.paraName});

  AyatModel.fromJson(Map<String, dynamic> json) {
    urdu = json['urdu'];
    arabic = json['arabic'];
    ayatId = json['ayat_id'];
    surahId = json['surah_id'];
    surahName = json['surah_name'];
    paraId = json['para_id'];
    paraName = json['para_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['urdu'] = urdu;
    data['arabic'] = arabic;
    data['ayat_id'] = ayatId;
    data['surah_id'] = surahId;
    data['surah_name'] = surahName;
    data['para_id'] = paraId;
    data['para_name'] = paraName;
    return data;
  }
}
