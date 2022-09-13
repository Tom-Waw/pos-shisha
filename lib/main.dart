// ignore: depend_on_referenced_packages
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import 'package:pos_shisha_bar/menu/menu_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  Logger.level = Level.debug;
  runApp(const MaterialApp(home: MenuPage()));
}
