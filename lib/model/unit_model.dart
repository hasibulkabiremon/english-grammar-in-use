
const String collectionUnit = 'Unit';
const String unitId = 'id';
const String unitSerial = 'serial';
const String unitContentId = 'contentId';
const String unitName = 'name';
const String unitAvailable = 'available';
const String unitFeatured = 'featured';

class UnitModel {
  String? id;
  String serial;
  String contentId;
  String name;
  bool available;
  bool featured;

  UnitModel({
    this.id,
    required this.serial,
    required this.name,
    required this.contentId,
    this.available = true,
    this.featured = false,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      unitId :id,
      unitSerial : serial,
      unitName: name,
      unitContentId: contentId,
      unitAvailable: available,
      unitFeatured: featured,
    };
  }

  factory UnitModel.fromMap(Map<String, dynamic> map) => UnitModel(
      id: map[unitId],
      serial: map[unitSerial],
      contentId: map[unitContentId],
      name: map[unitName],
      available: map[unitAvailable],
      featured: map[unitFeatured]);
}
