import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pos_shisha_bar/menu/providers/menu_provider.dart';

import '../data.dart';

import './menu_item_box.dart';

class MenuView extends StatelessWidget {
  final void Function(Menu) handleAddToMenu;

  const MenuView({
    Key? key,
    required this.handleAddToMenu,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        padding: const EdgeInsets.all(8.0),
        crossAxisCount: 3,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
        children: [
          if (!context.read<RootMenu>().isRoot)
            InkWell(
              onTap: context.watch<RootMenu>().back,
              child: Ink(
                color: Colors.grey[300],
                child: const Center(child: Icon(Icons.arrow_back)),
              ),
            ),
          ...context
              .read<RootMenu>()
              .display
              .map((item) => GestureDetector(
                    onTap: () => item is SubMenu
                        ? context.watch<RootMenu>().enter(item)
                        : null,
                    child: MenuItemBox(item: item),
                  ))
              .toList(),
          InkWell(
            onTap: () => handleAddToMenu(context.read<RootMenu>().current),
            child: Ink(
              color: Colors.grey[300],
              child: const Center(child: Icon(Icons.add)),
            ),
          )
        ]);
  }
}
