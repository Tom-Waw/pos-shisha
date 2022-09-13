import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data.dart' as menu;
import '../menu_provider.dart';

import './menu_item_box.dart';

class MenuView extends StatelessWidget {
  const MenuView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    menu.Menu current = context.watch<MenuProvider>().current;
    List<menu.MenuItem> display = context.watch<MenuProvider>().display;

    return GridView.count(
        padding: const EdgeInsets.all(8.0),
        crossAxisCount: 3,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
        children: [
          if (display != current.items)
            InkWell(
              onTap: () => context.read<MenuProvider>().collapseItem(),
              child: Ink(
                color: Colors.grey[300],
                child: const Center(child: Icon(Icons.arrow_back)),
              ),
            ),
          ...display
              .map((item) => GestureDetector(
                    onTap: () => item is menu.ExpandableMenuItem
                        ? context.read<MenuProvider>().expandItem(item)
                        : null,
                    child: MenuItemBox(item: item),
                  ))
              .toList(),
          InkWell(
            onTap: () => null,
            child: Ink(
              color: Colors.grey[300],
              child: const Center(child: Icon(Icons.add)),
            ),
          )
        ]);
  }
}
