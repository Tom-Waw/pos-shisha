// ignore: depend_on_referenced_packages
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:logger/logger.dart';
import 'package:pos_shisha_bar/menu/binding/menu_binding.dart';

import 'package:pos_shisha_bar/menu/pages/menu_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  Logger.level = Level.debug;
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Rababa Bestellbuch",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      getPages: [
        GetPage(
          name: "/home",
          page: () => const MenuPage(),
          binding: MenuBinding(),
        ),
      ],
      initialRoute: "/home",
    );
  }
}
