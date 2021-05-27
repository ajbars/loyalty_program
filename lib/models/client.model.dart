import 'dart:convert';

Client clientFromJson(String str) {
  final jsonData = json.decode(str);
  return Client.fromMap(jsonData);
}

String clientToJson(Client data) {
  final dyn = data.toMap();
  return json.encode(dyn);
}

class Client {
  int id;
  String firstName;
  String lastName;
  String patronymic;
  String phone;



  Client({
    this.id,
    this.firstName,
    this.lastName,
    this.patronymic,
    this.phone
  });

  String get name => this.name;
  // TODO change to private

  factory Client.fromMap(Map<String, dynamic> json) => new Client(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        patronymic: json["patronymic"],
        phone: json["phone"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "patronymic": patronymic,
        "phone": phone
      };
}