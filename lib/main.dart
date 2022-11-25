import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sputnik_test/bloc/providers.dart';
import 'package:sputnik_test/constants/colors.dart';
import 'package:sputnik_test/pages/sign%20in/login_check_page.dart';

void main(List<String> args) {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark));
  runApp(const SputnicApp());
}

class SputnicApp extends StatelessWidget {
  const SputnicApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return MultiBlocProvider(
        providers: Providers.providers,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(scaffoldBackgroundColor: CustomColors.background,),
          home: const LoginCheckPage(),
        ));
  }
}
