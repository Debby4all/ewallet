import 'package:ewallet/screens/auth/login.dart';
import 'package:ewallet/screens/home/home.dart';
import 'package:ewallet/widgets/widgets.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    _checkUserPeriod(false);
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      wAppLoading(context)
    );
  }

  void _checkUserPeriod(bool user) async {
    await Future.delayed(Duration(seconds: 2));
        wPushReplaceTo(context, user ? Home() : Login());
  }
}
