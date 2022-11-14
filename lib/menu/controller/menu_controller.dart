import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:pos_shisha_bar/helpers/utils.dart';

import '../data.dart';

class MenuController extends GetxController {
  late final Rx<Menu> _drinks;
  late final Rx<Menu> _food;
  late final Rx<Menu> _other;
  var _activeMenu = 0.obs;

  MenuController() {
    List<Menu> menus = Utils.loadMenus();
    _drinks = menus[0].obs;
    _food = menus[1].obs;
    _other = menus[2].obs;
  }

  List<Rx<Menu>> get menus => [_drinks, _food, _other];
  Rx<Menu> get current => menus[_activeMenu.value];

  List<MenuElement> get display => current.value.activationStack.fold(
      current.value.items, (prev, element) => (prev[element] as SubMenu).items);

  void selectMenu(Rx<Menu> menu) {
    _activeMenu = menus.indexOf(menu).obs;
  }

  bool get isRoot => current.value.activationStack.isEmpty;

  void back() {
    current.value.activationStack.removeLast();
  }

  void enter(SubMenu item) {
    current.value.activationStack.add(current.value.items.indexOf(item));
  }
}
