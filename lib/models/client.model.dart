// import 'dart:convert';

// Client clientFromJson(String str) {
//   final jsonData = json.decode(str);
//   return Client.fromMap(jsonData);
// }

// String clientToJson(Client data) {
//   final dyn = data.toMap();
//   return json.encode(dyn);
// }

class Client {
  String email;
  String firstName;
  String lastName;
  String patronymic;
  String phone;
  String password;
  String cardNum;
  DateTime birthDate;



  Client({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.patronymic,
    required this.phone,
    required this.password,
    required this.cardNum,
    required this.birthDate
  });


  String get name => this.firstName;
  // TODO change to private
  // TODO json methods?

  // factory Client.fromMap(Map<String, dynamic> json) => new Client(
  //       email: json["email"],
  //       firstName: json["first_name"],
  //       lastName: json["last_name"],
  //       patronymic: json["patronymic"],
  //       phone: json["phone"],
  //     );

  // Map<String, dynamic> toMap() => {
  //       // "id": id,
  //       "first_name": firstName,
  //       "last_name": lastName,
  //       "patronymic": patronymic,
  //       "phone": phone
  //     };
}