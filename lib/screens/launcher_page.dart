import 'package:englishusetest/screens/phone_login_page.dart';
import 'package:flutter/material.dart';
import '../auth/authservice.dart';
import 'my_home_screen.dart';
class LauncherPage extends StatelessWidget {
  static const String routeName = '/';
  const LauncherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () {
      if (AuthService.currentUser != null) {
        Navigator.pushReplacementNamed(context, MyHomeScreen.routeName);
      } else {
        Navigator.pushReplacementNamed(context, PhoneLogin.routeName);
      }
    });
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
