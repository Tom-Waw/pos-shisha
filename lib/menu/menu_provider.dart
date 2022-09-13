import 'package:flutter/material.dart';

import 'package:pos_shisha_bar/helpers/logger.dart';
import 'package:pos_shisha_bar/helpers/utils.dart';

import './data.dart';

class MenuProvider with ChangeNotifier {
  final log = getLogger();
  late final List<OBMenu> _menus;
  late int _activeIdx;
  late List<int> _openCategories;

  MenuProvider() {
    _menus = Utils.getMenus();
    _activeIdx = 0;
    _openCategories = _menus.map((_) => -1).toList();
  }

  List<OBMenu> get menus => _menus;
  bool get isHealthy => _menus.isNotEmpty;
  bool get isCurrentOpen => !(_openCategories[_activeIdx] < 0);
  List<OBMenuItem> get current => isCurrentOpen
      ? _menus[_activeIdx].categories[_openCategories[_activeIdx]].items
      : _menus[_activeIdx].categories;

  bool isActive(OBMenu menu) => _activeIdx == _menus.indexOf(menu);

  void openCategory(OBMenuCategory category) {
    _openCategories[_activeIdx] =
        _menus[_activeIdx].categories.indexOf(category);
    notifyListeners();
  }

  void closeCategory() {
    _openCategories[_activeIdx] = -1;
    notifyListeners();
  }

  void changeMenu(OBMenu menu) {
    _activeIdx = _menus.indexOf(menu);
    notifyListeners();
  }
}
