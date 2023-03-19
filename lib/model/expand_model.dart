import 'package:englishusetest/model/content_model.dart';
import 'package:englishusetest/model/detail_information_model.dart';
import 'package:englishusetest/model/unit_model.dart';

class ContentItem {
  ContentModel? contentModel;
  List<UnitItem>? unitItemList;
  bool isexpand;

  ContentItem({
    this.contentModel,
    this.unitItemList,
    this.isexpand = false,
  });
}

class UnitItem {
  UnitModel? unitModel;
  List<InformationItem>? informationitemList;
  bool expand;

  UnitItem({
    this.unitModel,
    this.informationitemList,
    this.expand = false,
  });
}

class InformationItem {
  InformationModel? informationModel;
  bool expand;

  InformationItem({
    this.informationModel,
    this.expand = false,
  });
}
