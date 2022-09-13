import 'package:flutter/material.dart' hide MenuItem;

import 'package:pos_shisha_bar/helpers/logger.dart';

import './data.dart';

List<Menu> getMenus() {
  return [
    Menu(name: "Getränke", icon: Icons.local_drink, items: [
      ExpandableMenuItem(
        name: "Alkoholische Getränke",
        items: [MenuItem(name: "Gin Tonic")],
      )
    ]),
    Menu(name: "Essen", icon: Icons.food_bank, items: [
      ExpandableMenuItem(
        name: "Nachspeisen",
        items: [MenuItem(name: "Schwarzwälder Kirschkuchen")],
      )
    ]),
    Menu(name: "Verschiedenes", icon: Icons.star, items: [
      ExpandableMenuItem(
        name: "Shishas",
        items: [MenuItem(name: "Apfel Minze")],
      )
    ]),
  ];
}

class MenuProvider with ChangeNotifier {
  final log = getLogger();
  late final List<Menu> _menus;

  MenuProvider() {
    _menus = getMenus();
    if (isHealthy) _menus[0].isActive = true;
  }

  bool get isHealthy => _menus.isNotEmpty;
  List<MenuInformation> get menus => _menus;
  Menu get current => _menus.firstWhere((menu) => menu.isActive);
  List<MenuItem> get display =>
      _getDisplay(current.items)?.items ?? current.items;

  void openMenu(MenuInformation menu) {
    current.isActive = false;
    menu.isActive = true;
    notifyListeners();
  }

  ExpandableMenuItem? _getDisplay(List<MenuItem> items) {
    int idx = items
        .indexWhere((item) => item is ExpandableMenuItem && item.isExpanded);

    return idx != -1
        ? _getDisplay((items[idx] as ExpandableMenuItem).items) ??
            items[idx] as ExpandableMenuItem
        : null;
  }

  void expandItem(ExpandableMenuItem item) {
    item.isExpanded = true;
    notifyListeners();
  }

  void collapseItem() {
    _getDisplay(current.items)?.isExpanded = false;
    notifyListeners();
  }
}
