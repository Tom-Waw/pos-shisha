import 'package:flutter/material.dart';
import 'package:pos_shisha_bar/menu/data.dart';
import 'package:pos_shisha_bar/menu/menu_item_box.dart';
import 'package:pos_shisha_bar/menu/menu_provider.dart';
import 'package:provider/provider.dart';

class MenuView extends StatelessWidget {
  const MenuView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<OBMenuItem> items = context.watch<MenuProvider>().current;

    return GridView.count(
        padding: const EdgeInsets.all(8.0),
        crossAxisCount: 3,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
        children: [
          if (context.read<MenuProvider>().isCurrentOpen)
            InkWell(
              onTap: () => context.read<MenuProvider>().closeCategory(),
              child: Ink(
                color: Colors.grey[300],
                child: const Center(child: Icon(Icons.arrow_back)),
              ),
            ),
          ...items
              .map((category) => GestureDetector(
                    onTap: () => context.read<MenuProvider>().isCurrentOpen
                        ? null
                        : context
                            .read<MenuProvider>()
                            .openCategory(category as OBMenuCategory),
                    child: MenuItemBox(item: category),
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
