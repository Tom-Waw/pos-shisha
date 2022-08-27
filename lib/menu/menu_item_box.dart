import 'package:flutter/material.dart';
import 'package:pos_shisha_bar/menu/data.dart';

class MenuItemBox extends StatelessWidget {
  final OBMenuItem item;

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
