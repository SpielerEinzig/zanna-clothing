class ClientModel {
  String id;
  String name;
  String phoneNumber;
  String email;
  String birthday;
  String address;
  String postalCode;
  String profession;
  String occasion;
  DateTime dateAdded;
  List<String> images;
  Map measurements;

  ClientModel({
    required this.id,
    required this.address,
    required this.name,
    required this.email,
    required this.occasion,
    required this.birthday,
    required this.phoneNumber,
    required this.postalCode,
    required this.profession,
    required this.dateAdded,
    required this.images,
    required this.measurements,
  });

  ClientModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        email = json['email'],
        phoneNumber = json['phoneNumber'],
        occasion = json['occasion'],
        birthday = json['birthday'],
        postalCode = json['postalCode'],
        profession = json['profession'],
        address = json['address'],
        dateAdded = json['dateAdded'].toDate(),
        measurements = json['measurements'],
        images = List<String>.from(json['images']);

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'id': id,
        'phoneNumber': phoneNumber,
        'occasion': occasion,
        'birthday': birthday,
        'postalCode': postalCode,
        'profession': profession,
        'address': address,
        'dateAdded': dateAdded,
        'measurements': measurements,
        'images': images,
      };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ClientModel &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;
}
