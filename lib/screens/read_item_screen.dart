import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:englishusetest/model/unit_model.dart';
import 'package:englishusetest/providers/content_provider.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:provider/provider.dart';

class ReadItem extends StatelessWidget {
  static const String routeName = '/readitem';

  const ReadItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UnitModel? unitModel =
        ModalRoute.of(context)!.settings.arguments as UnitModel;
    Provider.of<ContentProvider>(context, listen: false).getRead(unitModel);
    return Scaffold(
      backgroundColor: Colors.teal.shade100,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(unitModel.name),
        ),
        body: Consumer<ContentProvider>(
          builder: (context, provider, child) {
            return ListView.builder(
              itemCount: provider.readList.length,
              itemBuilder: (context, index) {
                final item = provider.readList[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18)
                    ),
                    tileColor: Colors.teal.shade50,
                    title: HtmlWidget(
                      item.datailinfo,
                      textStyle: const TextStyle(fontSize: 16),
                    ),
                  ),
                );
              },
            );
          },
        ));
  }
}
