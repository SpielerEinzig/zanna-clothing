class ShopModel {
  String id;
  String name;
  String address;

  ShopModel({
    required this.id,
    required this.name,
    required this.address,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ShopModel && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
