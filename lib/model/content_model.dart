const String collectionContent = 'Content';
const String contentId = 'id';
const String contentSerial = 'serial';
const String contentName = 'name';
const String contentAvailable = 'available';
const String contentFeatured = 'featured';

class ContentModel {
  String? id;
  String serial;
  String name;
  bool available;
  bool featured;

  ContentModel({
    this.id,
    required this.serial,
    required this.name,
    this.available = true,
    this.featured = false,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      contentId :id,
      contentSerial:serial,
      contentName: name,
      contentAvailable: available,
      contentFeatured: featured,
    };
  }

  factory ContentModel.fromMap(Map<String, dynamic> map) => ContentModel(
      id: map[contentId],
      serial: map[contentSerial],
      name: map[contentName],
      available: map[contentAvailable],
      featured: map[contentFeatured]);
}
