import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/menu_controller.dart';

class MenuTabBar extends StatelessWidget {
  const MenuTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    final menuController = Get.find<MenuController>();

    return Obx(() => Row(
          children: menuController.menus
              .map((menu) => Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            width: 1.5,
                            color: menu == menuController.current
                                ? Colors.white
                                : Colors.transparent,
                          ),
                        ),
                      ),
                      child: InkWell(
                        onTap: () => menuController.selectMenu(menu),
                        child: Ink(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Column(children: [
                            Icon(menu.value.icon, color: Colors.white),
                            const SizedBox(height: 6.0),
                            Text(
                              menu.value.name,
                              style: const TextStyle(color: Colors.white),
                            )
                          ]),
                        ),
                      ),
                    ),
                  ))
              .toList(),
        ));
  }
}
