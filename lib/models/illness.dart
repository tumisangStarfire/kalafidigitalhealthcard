class Illness {
  int id;
  String name;
  String dataUpdatedAt;
  List<String> facts;
  Null symptoms;
  Null transmission;
  Null diagnosis;
  Null treatment;
  Null prevention;
  String more;
  bool isActive;

  Illness(
      {this.id,
      this.name,
      this.dataUpdatedAt,
      this.facts,
      this.symptoms,
      this.transmission,
      this.diagnosis,
      this.treatment,
      this.prevention,
      this.more,
      this.isActive});

  Illness.fromJson(Map<String, dynamic> json) {
      id = json['id'];
     name = json['name'];
    dataUpdatedAt = json['data_updated_at'];
    facts = json['facts'].cast<String>();
    symptoms = json['symptoms'];
    transmission = json['transmission'];
    diagnosis = json['diagnosis'];
    treatment = json['treatment'];
    prevention = json['prevention'];
    more = json['more'];
    isActive = json['is_active'];
   
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['data_updated_at'] = this.dataUpdatedAt;
    data['facts'] = this.facts;
    data['symptoms'] = this.symptoms;
    data['transmission'] = this.transmission;
    data['diagnosis'] = this.diagnosis;
    data['treatment'] = this.treatment;
    data['prevention'] = this.prevention;
    data['more'] = this.more;
    data['is_active'] = this.isActive;
    return data;
  }
}