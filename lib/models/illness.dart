import 'package:flutter/foundation.dart';

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
      {
        @required this.id,
      @required this.name,
      this.dataUpdatedAt,
      this.facts,
      this.symptoms,
      this.transmission,
      this.diagnosis,
      this.treatment,
      this.prevention,
      this.more,
      this.isActive});

 factory Illness.fromJson(Map<String, dynamic> json) {
    return Illness(
      id : json['id'],
      name : json['name'],
      dataUpdatedAt : json['data_updated_at'] != null ? json['data_updated_at'] : null,
      facts : json['facts'].cast<String>() != null ? json['facts'].cast<String>() : null,
      symptoms : json['symptoms'] != null ? json['symptoms'] : null,
      transmission : json['transmission'] != null ? json['transmission'] : null,
      diagnosis : json['diagnosis'] != null ? json['diagnosis'] : null,
      treatment : json['treatment'] != null ? json['treatment'] : null,
      prevention : json['prevention'] != null ? json['prevention'] : null,
      more : json['more'] != null ? json['more'] : null,
      isActive : json['is_active'] != null ? json['is_active'] : null,
    );

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