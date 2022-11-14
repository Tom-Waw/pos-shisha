import 'package:flutter/material.dart';
import 'package:pos_shisha_bar/helpers/utils.dart';

import '../data.dart';

class RootMenu extends ChangeNotifier {
  late final Menu _drinks;
  late final Menu _food;
  late final Menu _other;
  int _activeMenu = 0;

  RootMenu() {
    List<Menu> menus = Utils.loadMenus();
    _drinks = menus[0];
    _food = menus[1];
    _other = menus[2];
  }

  List<Menu> get menus => [_drinks, _food, _other];
  Menu get current => menus[_activeMenu];

  List<MenuElement> get display => current.activationStack
      .fold(current.items, (prev, element) => (prev[element] as SubMenu).items);

  void selectMenu(Menu menu) {
    print("selected");
    _activeMenu = menus.indexOf(menu);
    notifyListeners();
  }

  bool get isRoot => current.activationStack.isEmpty;

  void back() {
    current.activationStack.removeLast();
    notifyListeners();
  }

  void enter(SubMenu item) {
    current.activationStack.add(current.items.indexOf(item));
    notifyListeners();
  }
}
