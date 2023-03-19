import 'package:englishusetest/auth/authservice.dart';
import 'package:englishusetest/model/expand_model.dart';
import 'package:englishusetest/screens/launcher_page.dart';
import 'package:englishusetest/screens/read_item_screen.dart';
import 'package:flutter/material.dart';
import 'package:englishusetest/providers/content_provider.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';

class MyHomeScreen extends StatefulWidget {
  static const String routeName = '/home';

  const MyHomeScreen({Key? key}) : super(key: key);

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  @override
  void didChangeDependencies() {
    Provider.of<ContentProvider>(context,listen: false).expandModel();
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('English Grammer In Use'),
      actions: [
        IconButton(onPressed: (){
          AuthService.logout();
          Navigator.pushNamed(context, LauncherPage.routeName);
        },
            icon: Icon(Icons.logout))
      ],),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Consumer<ContentProvider>(
                builder: (context, provider, child) {
                  final contentItemList = provider.contentItemList;
                  return ExpansionPanelList(
                    elevation: 3,
                    dividerColor: Colors.black,
                    expansionCallback: (index, isExpanded) async {
                      setState(() {
                        contentItemList[index].isexpand = !isExpanded;
                      });
                    },
                    children: contentItemList
                        .map<ExpansionPanel>((item) => ExpansionPanel(
                      backgroundColor: Colors.teal.shade100,
                      canTapOnHeader: true,
                        isExpanded: item.isexpand,
                        headerBuilder: (context, isExpanded) => ListTile(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)
                          ),
                          title: Text(item.contentModel!.name,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                        ),
                        body: item.unitItemList != null ? Column(
                          children:
                          item.unitItemList!.map((e) {
                              return InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, ReadItem.routeName, arguments: e.unitModel);
                                },
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(20,0,0,4),
                                    child: ListTile(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8)
                                      ),
                                      tileColor: Colors.teal.shade50,
                                      title: Text(e.unitModel!.name),
                                      trailing: Icon(Icons.arrow_forward_ios_outlined),

                                    ),
                                  ));
                            }).toList(),

                        ):Text('Nothing')


                      // Consumer<ContentProvider>(
                        //   builder: (context, unitprovider, child) {
                        //     unitprovider.getUnit(item.contentModel!.id!);
                        //     final unitlist = unitprovider.unitItemList;
                        //     return Column(
                        //       children: unitlist.map((cartModel) {
                        //         return ListTile(
                        //           title: Text(cartModel.unitModel!.name),
                        //         );
                        //       }).toList(),
                        //     );
                        //   },
                        // )
                    ))
                        .toList(),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
