import 'package:flutter/material.dart';

class Menu extends SubMenu {
  final IconData icon;
  List<int> activationStack = [];

  Menu({required super.name, required this.icon, required super.items});
}

class SubMenu extends MenuElement {
  List<MenuElement> items;

  SubMenu({required super.name, required this.items});
}

class MenuElement {
  final String name;

  const MenuElement({required this.name});
}
