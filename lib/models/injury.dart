class Injury {
  String id;
  String name;
  String injurySeverityScore;

  Injury({this.id, this.name, this.injurySeverityScore});

  Injury.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    injurySeverityScore = json['Injury Severity Score'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['Injury Severity Score'] = this.injurySeverityScore;
    return data;
  }
}
