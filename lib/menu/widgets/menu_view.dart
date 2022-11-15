import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_shisha_bar/menu/widgets/menu_item_form.dart';

import '../controller/menu_controller.dart';

import './menu_item_box.dart';

class MenuView extends StatelessWidget {
  const MenuView({super.key});

  @override
  Widget build(BuildContext context) {
    final menuController = Get.find<MenuController>();

    return Obx(() => GridView.count(
            padding: const EdgeInsets.all(8.0),
            crossAxisCount: 3,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
            children: [
              if (!menuController.isRoot)
                InkWell(
                  onTap: () => menuController.back(),
                  child: Ink(
                    color: Colors.grey[300],
                    child: const Center(child: Icon(Icons.arrow_back)),
                  ),
                ),
              ...menuController.display.items
                  .map((item) => MenuItemBox(item: item))
                  .toList(),
              InkWell(
                onTap: () => Get.defaultDialog(
                  title: "Artikel hinzufügen",
                  titlePadding: const EdgeInsets.symmetric(vertical: 20.0),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
                  content: const MenuItemForm(),
                ),
                child: Ink(
                  color: Colors.grey[300],
                  child: const Center(child: Icon(Icons.add)),
                ),
              )
            ]));
  }
}
