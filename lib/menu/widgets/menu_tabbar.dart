import 'package:flutter/material.dart';

import '../data.dart';

class MenuTabBar extends StatelessWidget {
  final List<Menu> menus;
  final Menu current;
  final void Function(Menu) selectMenu;

  const MenuTabBar(
      {Key? key,
      required this.menus,
      required this.current,
      required this.selectMenu})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: menus
          .map((menu) => Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: 1.5,
                        color:
                            menu == current ? Colors.white : Colors.transparent,
                      ),
                    ),
                  ),
                  child: InkWell(
                    onTap: () => selectMenu(menu),
                    child: Ink(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Column(children: [
                        Icon(menu.icon, color: Colors.white),
                        const SizedBox(height: 6.0),
                        Text(
                          menu.name,
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
