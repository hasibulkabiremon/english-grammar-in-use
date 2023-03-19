import 'package:englishusetest/model/expand_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:englishusetest/model/content_model.dart';
import 'package:englishusetest/model/detail_information_model.dart';
import 'package:englishusetest/model/unit_model.dart';
import '../db/dbhelper.dart';

class ContentProvider extends ChangeNotifier {
  List<ContentItem> contentItemList = [];
  List<ContentModel> contentList = [];
  List<UnitModel> unitList = [];
  List<UnitItem> unitItemList = [];
  List<InformationModel> readList = [];
  List<InformationItem> readItemList = [];

  Future<void> expandModel() async {
    contentItemList =  await getFContent();

    Future.forEach(contentItemList, (element) async {
      element.unitItemList = await getFUnit(element.contentModel!.id!);
    });
    print('expandmodel');
    notifyListeners();

  }

  getAllContent() {
    DbHelper.getAllContent().listen((snapshot) {
      contentList = List.generate(snapshot.docs.length,
          (index) => ContentModel.fromMap(snapshot.docs[index].data()));
      contentList.sort((a, b) => a.serial.compareTo(b.serial));
      notifyListeners();
    });
    print('Getallcontent');
  }

  Future<List<ContentItem>> getFContent() async {
    final snapshot = await DbHelper.getFContent();
    final contlist = List.generate(snapshot.docs.length, (index) =>
        ContentModel.fromMap(snapshot.docs[index].data()));
    final contItemlist = List.generate(contlist.length, (index) =>
        ContentItem(contentModel: contlist[index]));
    contItemlist.sort((a, b) => a.contentModel!.serial.compareTo(b.contentModel!.serial),);
      return contItemlist;
  }

  getUnit(String contentId) {
    DbHelper.getAUnit(contentId).listen((snapshot) {
      unitList = List.generate(snapshot.docs.length,
          (index) => UnitModel.fromMap(snapshot.docs[index].data()));

      unitItemList = List.generate(
          unitList.length, (index) => UnitItem(unitModel: unitList[index]));

      unitList.sort((a, b) => a.serial.compareTo(b.serial));
      notifyListeners();
    });
    print('GetallUnit');
  }

  Future<List<UnitItem>> getFUnit(String contentId) async {
    final snapshot = await DbHelper.getFAUnit(contentId);
    unitList = List.generate(snapshot.docs.length,
            (index) => UnitModel.fromMap(snapshot.docs[index].data()));

    unitItemList = List.generate(
        unitList.length, (index) => UnitItem(unitModel: unitList[index]));

    unitItemList.sort((a, b) => a.unitModel!.serial.compareTo(b.unitModel!.serial));
    print('In: $unitItemList');
    notifyListeners();
    print('out: $unitItemList');
    return unitItemList;
  }

  getRead(UnitModel unitModel) {
    DbHelper.getRead(unitModel).listen((snapshot) {
      readList = List.generate(snapshot.docs.length,
          (index) => InformationModel.fromMap(snapshot.docs[index].data()));

      readItemList = List.generate(readList.length,
          (index) => InformationItem(informationModel: readList[index]));

      readList.sort((a, b) => a.serial.compareTo(b.serial));
      notifyListeners();
    });
    print('GetallRead');
  }

  List<InformationItem> getFRead(UnitModel unitModel) {
    DbHelper.getRead(unitModel).listen((snapshot) {
      readList = List.generate(snapshot.docs.length,
          (index) => InformationModel.fromMap(snapshot.docs[index].data()));

      readItemList = List.generate(readList.length,
          (index) => InformationItem(informationModel: readList[index]));

      readList.sort((a, b) => a.serial.compareTo(b.serial));
      notifyListeners();
    });
    return readItemList;
  }
}
