import 'package:flutter/material.dart';

class MenuInformation {
  String name;
  IconData icon;
  bool isActive = false;

  MenuInformation({required this.name, required this.icon});
}

class Menu extends MenuInformation {
  List<MenuItem> items;

  Menu({required name, required icon, required this.items})
      : super(name: name, icon: icon);
}

class MenuItem {
  String name;

  MenuItem({required this.name});
}

class ExpandableMenuItem extends MenuItem {
  List<MenuItem> items;
  bool isExpanded = false;

  ExpandableMenuItem({required name, required this.items}) : super(name: name);
}
