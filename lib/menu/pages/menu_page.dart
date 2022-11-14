import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:pos_shisha_bar/menu/providers/menu_provider.dart';
import '../data.dart';

import '../widgets/menu_view.dart';
import '../widgets/menu_tabbar.dart';

class MenuPage extends StatelessWidget {
  final void Function(Menu) handleAddToMenu;

  const MenuPage({super.key, required this.handleAddToMenu});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bestellblock"),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: MenuTabBar(
            menus: context.read<RootMenu>().menus,
            current: context.read<RootMenu>().current,
            selectMenu: (Menu menu) =>
                context.watch<RootMenu>().selectMenu(menu),
          ),
        ),
      ),
      body: MenuView(
        handleAddToMenu: handleAddToMenu,
      ),
    );
  }
}
