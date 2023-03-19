import 'package:englishusetest/screens/launcher_page.dart';
import 'package:englishusetest/screens/otp_verification_page.dart';
import 'package:englishusetest/screens/phone_login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:englishusetest/providers/content_provider.dart';
import 'package:englishusetest/screens/my_home_screen.dart';
import 'package:englishusetest/screens/read_item_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => ContentProvider(),)
  ],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      builder: EasyLoading.init(),
      initialRoute: LauncherPage.routeName,
      routes: {
        LauncherPage.routeName: (_) => LauncherPage(),
        MyHomeScreen.routeName: (_) => MyHomeScreen(),
        ReadItem.routeName: (_) => ReadItem(),
        PhoneLogin.routeName: (_) => PhoneLogin(),
        OtpVerificationPage.routeName: (_) => OtpVerificationPage(),
      },
    );
  }
}

