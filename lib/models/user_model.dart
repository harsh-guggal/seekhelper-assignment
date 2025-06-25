import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  int? id;
  String? name;
  String? username;
  String? email;
  Address? address;
  String? phone;
  String? website;
  Company? company;

  UserModel({this.id, this.name, this.username, this.email, this.address, this.phone, this.website, this.company});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json["id"],
    name: json["name"] ?? "No Data",
    username: json["username"] ?? "No Data",
    email: json["email"] ?? "No Data",
    address: json["address"] == null ? null : Address.fromJson(json["address"]),
    phone: json["phone"] ?? "No Data",
    website: json["website"] ?? "No Data",
    company: json["company"] == null ? null : Company.fromJson(json["company"]),
  );

  Map<String, dynamic> toJson() => {"id": id, "name": name, "username": username, "email": email, "address": address?.toJson(), "phone": phone, "website": website, "company": company?.toJson()};
}

class Address {
  String? street;
  String? suite;
  String? city;
  String? zipcode;
  Geo? geo;

  Address({this.street, this.suite, this.city, this.zipcode, this.geo});

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    street: json["street"] ?? "No Data",
    suite: json["suite"] ?? "No Data",
    city: json["city"] ?? "No Data",
    zipcode: json["zipcode"] ?? "No Data",
    geo: json["geo"] == null ? null : Geo.fromJson(json["geo"] ?? "No Data"),
  );

  Map<String, dynamic> toJson() => {"street": street, "suite": suite, "city": city, "zipcode": zipcode, "geo": geo?.toJson()};
}

class Geo {
  String? lat;
  String? lng;

  Geo({this.lat, this.lng});

  factory Geo.fromJson(Map<String, dynamic> json) => Geo(lat: json["lat"] ?? "No Data", lng: json["lng"] ?? "No Data");

  Map<String, dynamic> toJson() => {"lat": lat, "lng": lng};
}

class Company {
  String? name;
  String? catchPhrase;
  String? bs;

  Company({this.name, this.catchPhrase, this.bs});

  factory Company.fromJson(Map<String, dynamic> json) => Company(name: json["name"], catchPhrase: json["catchPhrase"], bs: json["bs"]);

  Map<String, dynamic> toJson() => {"name": name, "catchPhrase": catchPhrase, "bs": bs};
}
