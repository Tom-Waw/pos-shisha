import 'package:flutter/material.dart';

import '../data.dart' as menu;

class MenuItemBox extends StatelessWidget {
  final menu.MenuItem item;

  const MenuItemBox({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.red,
      ),
      child: Center(child: Text(item.name, textAlign: TextAlign.center)),
    );
  }
}
