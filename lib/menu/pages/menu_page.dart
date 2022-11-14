import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/menu_controller.dart';
import '../data.dart';

import '../services/api_service.dart';
import '../widgets/menu_view.dart';
import '../widgets/menu_tabbar.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Menu"),
        centerTitle: true,
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: MenuTabBar(),
        ),
      ),
      body: const MenuView(),
    );
  }
}
