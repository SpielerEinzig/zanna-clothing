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
  String shopId;
  String headSize;
  String neck;
  String chest;
  String roundTummy;
  String roundHip;
  String roundArm;
  String topLength;
  String pant;
  String waist;
  String laps;
  String calf;
  String pantTip;
  String pantLength;

  ClientModel({
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
    required this.pant,
    required this.waist,
    required this.laps,
    required this.calf,
    required this.pantTip,
    required this.pantLength,
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
        pant = json['pant'],
        waist = json['waist'],
        laps = json['laps'],
        calf = json['calf'],
        pantTip = json['pantTip'],
        pantLength = json['pantLength'];

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
        'pant': pant,
        'waist': waist,
        'laps': laps,
        'calf': calf,
        'pantTip': pantTip,
        'pantLength': pantLength,
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
