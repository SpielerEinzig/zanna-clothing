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
  String notes;
  List<String> images;
  String shopId;
  //measurements
  String headSize;
  String neck;
  String shoulder;
  String sleeve;
  String chest;
  String roundTummy;
  String roundHip;
  String roundArm;
  String topLength;

  String waist;
  String laps;
  String knee;
  String calf;
  String roundTip;
  String pantLength;

  ClientModel({
    required this.notes,
    required this.sleeve,
    required this.shopId,
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
    required this.headSize,
    required this.neck,
    required this.chest,
    required this.roundTummy,
    required this.roundHip,
    required this.roundArm,
    required this.topLength,
    required this.knee,
    required this.waist,
    required this.laps,
    required this.calf,
    required this.roundTip,
    required this.pantLength,
    required this.shoulder,
  });

  ClientModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        shopId = json['shopId'],
        name = json['name'],
        email = json['email'],
        phoneNumber = json['phoneNumber'],
        occasion = json['occasion'],
        birthday = json['birthday'],
        postalCode = json['postalCode'],
        profession = json['profession'],
        address = json['address'],
        dateAdded = DateTime.parse(json['dateAdded']),
        images = List<String>.from(json['images']),
        headSize = json['headSize'],
        neck = json['neck'],
        chest = json['chest'],
        roundTummy = json['roundTummy'],
        roundHip = json['roundHip'],
        roundArm = json['roundArm'],
        topLength = json['topLength'],
        knee = json['knee'],
        waist = json['waist'],
        laps = json['laps'],
        calf = json['calf'],
        roundTip = json['roundTip'],
        pantLength = json['pantLength'],
        sleeve = json['sleeve'],
        notes = json['notes'],
        shoulder = json['shoulder'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'shopId': shopId,
        'name': name,
        'phoneNumber': phoneNumber,
        'email': email,
        'birthday': birthday,
        'address': address,
        'postalCode': postalCode,
        'profession': profession,
        'occasion': occasion,
        'dateAdded': dateAdded.toIso8601String(),
        'images': images,
        'headSize': headSize,
        'neck': neck,
        'chest': chest,
        'roundTummy': roundTummy,
        'roundHip': roundHip,
        'roundArm': roundArm,
        'topLength': topLength,
        'knee': knee,
        'waist': waist,
        'laps': laps,
        'calf': calf,
        'roundTip': roundTip,
        'pantLength': pantLength,
        'sleeve': sleeve,
        'notes': notes,
        'shoulder': shoulder
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
