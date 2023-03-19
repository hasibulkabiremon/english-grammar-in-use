import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:englishusetest/model/content_model.dart';
import 'package:englishusetest/model/detail_information_model.dart';
import 'package:englishusetest/model/unit_model.dart';

class DbHelper {
  static final _db = FirebaseFirestore.instance;

  static Stream<QuerySnapshot<Map<String, dynamic>>> getAllContent() =>
      _db.collection(collectionContent).snapshots();

  static Future<QuerySnapshot<Map<String, dynamic>>> getFContent() =>
      _db.collection(collectionContent).get();

  static Stream<QuerySnapshot<Map<String, dynamic>>> getAUnit(
          String contentId) =>
      _db
          .collection(collectionContent)
          .doc(contentId)
          .collection(collectionUnit)
          .snapshots();

  static Future<QuerySnapshot<Map<String, dynamic>>> getFAUnit(
          String contentId) =>
      _db
          .collection(collectionContent)
          .doc(contentId)
          .collection(collectionUnit)
          .get();

  static Stream<QuerySnapshot<Map<String, dynamic>>> getRead(
          UnitModel unitModel) =>
      _db
          .collection(collectionContent)
          .doc(unitModel.contentId)
          .collection(collectionUnit)
          .doc(unitModel.id!)
          .collection(collectionInformation)
          .snapshots();

}
