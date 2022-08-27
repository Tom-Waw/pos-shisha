import 'package:flutter/material.dart';
import 'package:pos_shisha_bar/menu/menu_provider.dart';
import 'package:pos_shisha_bar/menu/menu_tabbar.dart';
import 'package:provider/provider.dart';

import 'menu_view.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MenuProvider()),
      ],
      builder: (context, child) => Scaffold(
        appBar: AppBar(
            title: const Text("Bestellblock"),
            centerTitle: true,
            bottom: context.watch<MenuProvider>().isHealthy
                ? const PreferredSize(
                    preferredSize: Size.fromHeight(50),
                    child: MenuTabBar(),
                  )
                : null),
        body: context.watch<MenuProvider>().isHealthy
            ? const MenuView()
            : const Center(
                child: Text(
                  "Es wurde noch kein Menu erstellt.\n"
                  "Wende dich an einen Administrator, falls deine Zugriffsrechte dafür nicht ausreichen.",
                  textAlign: TextAlign.center,
                ),
              ),
      ),
    );
  }
}
