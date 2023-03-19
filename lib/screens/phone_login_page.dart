import 'package:flutter/material.dart';

import 'otp_verification_page.dart';

class PhoneLogin extends StatelessWidget {
  static const String routeName = '/phone';

  const PhoneLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    TextEditingController codecontroller = TextEditingController(text: '+88');
    TextEditingController phonecontroller = TextEditingController(text: '+880');
    return Scaffold(
      backgroundColor: Colors.teal.shade100,
      body: Form(
        key: _formKey,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('English Grammer In Use',style: TextStyle(fontSize: 30),),
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: Row(
              children: [
                Flexible(
                  flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.phone),
                        ),
                        style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,letterSpacing: 2),
                        controller: phonecontroller,
                        validator: (value){
                          if(value == null || value.isEmpty ){
                            return 'This field must not be empty';
                          }else if(value.length != 14){
                            return '{country code} +11 digit';
                          }
                          else{
                            return null;
                          }

                        },
                      ),
                    ))
              ],
            ),
          ),
              SizedBox(height: 10,),
              ElevatedButton(
                  onPressed: (){
                    if(_formKey.currentState!.validate()){
                      Navigator.pushNamed(context, OtpVerificationPage.routeName, arguments: phonecontroller.text);
                    }else{
                      print(phonecontroller.text);
                    }
                  },
                  child: const Text('Login'),
              )
        ]),
      ),
    );
  }
}
