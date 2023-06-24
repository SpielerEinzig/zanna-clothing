class ClientModel {
  String name;
  String phoneNumber;
  String email;
  String birthday;
  String address;
  String postalCode;
  String profession;
  String occasion;
  List<String> images;
  Map<String, dynamic> measurements;

  ClientModel({
    required this.address,
    required this.name,
    required this.email,
    required this.measurements,
    required this.images,
    required this.occasion,
    required this.birthday,
    required this.phoneNumber,
    required this.postalCode,
    required this.profession,
  });
}
