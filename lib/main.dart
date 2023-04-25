import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:travel_app/core/constants/color_palatte.dart';
import 'package:travel_app/core/helpers/local_storage_helper.dart';
import 'package:travel_app/representation/screen/splash_screen.dart';
import 'package:travel_app/routes.dart';

import 'core/helpers/size_config.dart';

void main() async {
  await Hive.initFlutter();
  await LocalStorageHelper.initLocalStorageHelper();
  runApp(const TravelApp());
}

class TravelApp extends StatelessWidget {
  const TravelApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travo App',
      theme: ThemeData(
        primaryColor: ColorPalette.primaryColor,
        scaffoldBackgroundColor: ColorPalette.backgroundScaffoldColor,
        // ignore: deprecated_member_use
        backgroundColor: ColorPalette.backgroundScaffoldColor,
      ),
      routes: routes,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: generateRoutes,
      home: Builder(
        builder: (context) {
          SizeConfig.init(context);
          return SplashScreen();
        },
      ),
    );
  }
}
