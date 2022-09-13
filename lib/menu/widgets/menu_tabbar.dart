import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../menu_provider.dart';

class MenuTabBar extends StatelessWidget {
  const MenuTabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: context
          .watch<MenuProvider>()
          .menus
          .map((menu) => Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                          width: 1.5,
                          color: context.watch<MenuProvider>().isActive(menu)
                              ? Colors.white
                              : Colors.transparent),
                    ),
                  ),
                  child: InkWell(
                    onTap: () => context.read<MenuProvider>().changeMenu(menu),
                    child: Ink(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Column(children: [
                        Icon(menu.icon, color: Colors.white),
                        const SizedBox(height: 6.0),
                        Text(
                          menu.title,
                          style: const TextStyle(color: Colors.white),
                        )
                      ]),
                    ),
                  ),
                ),
              ))
          .toList(),
    );
  }
}
