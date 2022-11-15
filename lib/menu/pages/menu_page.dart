import 'package:flutter/material.dart';

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
