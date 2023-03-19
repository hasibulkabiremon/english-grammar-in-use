const String collectionInformation = 'Information';
const String informationHeading = 'heading';
const String informationId= 'id';
const String informationSerial= 'serial';
const String informationContentId= 'contentId';
const String informationUnitId= 'unitId';
const String informationDetails = 'datailinfo';
const String informationAvailable = 'available';

class InformationModel {
  String? id;
  String serial;
  String contentId;
  String unitId;
  String heading;
  String datailinfo;
  bool available;

  InformationModel({
    this.id,
    required this.serial,
    required this.contentId,
    required this.unitId,
    required this.heading,
    required this.datailinfo,
    this.available = true,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      informationId:id,
      informationSerial:serial,
      informationContentId:contentId,
      informationUnitId:unitId,
      informationHeading: heading,
      informationDetails: datailinfo,
      informationAvailable: available,
    };
  }

  factory InformationModel.fromMap(Map<String, dynamic>map) =>
      InformationModel(
        id: map[informationId],
        serial: map[informationSerial],
        contentId: map[informationContentId],
        unitId: map[informationUnitId],
        heading: map[informationHeading],
        datailinfo: map[informationDetails],
        available: map[informationAvailable]
      );
}
