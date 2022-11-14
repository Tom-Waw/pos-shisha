import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/menu_controller.dart';
import '../data.dart';

import './menu_item_box.dart';

class MenuView extends StatelessWidget {
  const MenuView({super.key});

  @override
  Widget build(BuildContext context) {
    final menuController = Get.find<MenuController>();

    return GridView.count(
        padding: const EdgeInsets.all(8.0),
        crossAxisCount: 3,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
        children: [
          if (!menuController.isRoot)
            InkWell(
              onTap: menuController.back,
              child: Ink(
                color: Colors.grey[300],
                child: const Center(child: Icon(Icons.arrow_back)),
              ),
            ),
          ...menuController.display
              .map((item) => GestureDetector(
                    onTap: () =>
                        item is SubMenu ? menuController.enter(item) : null,
                    child: MenuItemBox(item: item),
                  ))
              .toList(),
          InkWell(
            onTap: () {},
            child: Ink(
              color: Colors.grey[300],
              child: const Center(child: Icon(Icons.add)),
            ),
          )
        ]);
  }
}
