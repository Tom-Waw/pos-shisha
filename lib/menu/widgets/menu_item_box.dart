import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/menu_controller.dart';
import '../data.dart';

class MenuItemBox extends StatelessWidget {
  final MenuElement item;

  const MenuItemBox({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final menuController = Get.find<MenuController>();

    return GestureDetector(
      onTap: () =>
          item is SubMenu ? menuController.enter(item as SubMenu) : null,
      // onDoubleTap: () {
      //   if (item is SubMenu) menuController.enter(item as SubMenu);

      //   SubMenu menu = SubMenu(name: item.name, items: []);

      // },
      onLongPress: () => Get.defaultDialog(
        title: "Artikel entfernen",
        titlePadding: const EdgeInsets.symmetric(vertical: 20.0),
        middleText:
            "Sind Sie sich sicher, dass dieser Artikel von der Karte entfernt werden soll?",
        contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
        confirm: Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: ElevatedButton(
            onPressed: () {
              menuController.removeItem(item);
              Get.back();
            },
            child: const Text("Bestätigen"),
          ),
        ),
        cancel: Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () {
              Get.back();
            },
            child: const Text("Abbrechen"),
          ),
        ),
      ),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.red,
        ),
        child: Center(child: Text(item.name, textAlign: TextAlign.center)),
      ),
    );
  }
}
