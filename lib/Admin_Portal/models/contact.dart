import 'dart:convert';

Contact contactFromJson(String str) => Contact.fromJson(json.decode(str));

String contactToJson(Contact data) => json.encode(data.toJson());

class Contact {
  Contact({
    required this.id,
    required this.name,
    required this.age,
    required this.gender,
    required this.phone,
  });

  int id;
  String name;
  int age;
  String gender;
  String phone;

  factory Contact.fromJson(Map<String, dynamic> json) => Contact(
        id: json["id"],
        name: json["name"],
        age: json["age"],
        gender: json["gender"],
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "age": age,
        "gender": gender,
        "phone": phone,
      };
}
