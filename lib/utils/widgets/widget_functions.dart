
import 'package:flutter/material.dart';

showSingleTextInputDialog({
  required BuildContext context,
  required String title,
  String? serial,
  String positiveButtonText = 'OK',
  String negativeButtonText = 'CLOSE',
  required Function(String, String) onSubmit,
}) {
  final txtController = TextEditingController();
  final slController = TextEditingController();
  txtController.text = title;
  if(serial != null){
    slController.text = serial;
  }else{
    slController.text = '0';
  }

  showDialog(context: context, builder: (context) => AlertDialog(
    title: Text(title),
    content: Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: txtController,
            decoration: InputDecoration(
              labelText: title,
            ),
          ),
          TextField(
            controller: slController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Enter index',
            ),
          ),
        ],
      ),
    ),
    actions: [
      TextButton(
        onPressed: () => Navigator.pop(context),
        child: Text(negativeButtonText),
      ),
      TextButton(
        onPressed: () {
          if(txtController.text.isEmpty && slController.text.isNotEmpty) return;
          onSubmit(txtController.text,slController.text);
          Navigator.pop(context);
        },
        child: Text(positiveButtonText),
      )
    ],
  ));
}

showMsg(BuildContext context, String msg) =>
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));