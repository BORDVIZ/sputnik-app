import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sputnik_test/pages/main_initial.dart';
import 'package:sputnik_test/pages/onboarding/onboarding_main.dart';

class LoginCheckPage extends StatefulWidget {
  const LoginCheckPage({super.key});

  @override
  State<LoginCheckPage> createState() => _LoginCheckPageState();
}

class _LoginCheckPageState extends State<LoginCheckPage> {
  bool isLogin = false;

  check() async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      setState(() {
        isLogin = preferences.getBool('login')!;
      });
    } catch (e) {
      setState(() {
        isLogin = false;
      });
    }
  }

  @override
  void initState() {
    check();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isLogin ? const MainInitial() : const OnboardingMain();
  }
}
