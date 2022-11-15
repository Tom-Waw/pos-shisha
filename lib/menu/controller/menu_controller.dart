import 'package:get/get.dart';
import 'package:pos_shisha_bar/helpers/utils.dart';

import '../data.dart';

class MenuController extends GetxController {
  late final Rx<Menu> _drinks;
  late final Rx<Menu> _food;
  late final Rx<Menu> _other;
  final _activeMenu = 0.obs;

  Rx<SubMenu?> _tempMenu = null.obs;

  MenuController() {
    List<Menu> menus = Utils.loadMenus();
    _drinks = menus[0].obs;
    _food = menus[1].obs;
    _other = menus[2].obs;
  }

  List<Rx<Menu>> get menus => [_drinks, _food, _other];
  Rx<Menu> get current => menus[_activeMenu.value];

  SubMenu get display =>
      _tempMenu.value ??
      current.value.activationStack.fold<SubMenu>(
        current.value,
        (prev, element) => (prev.items[element] as SubMenu),
      );

  void selectMenu(Rx<Menu> menu) {
    _activeMenu(menus.indexOf(menu));
  }

  bool get isRoot => current.value.activationStack.isEmpty;

  void back() => current.update(
        (Menu? menu) {
          menu?.activationStack.removeLast();
        },
      );

  void enter(SubMenu item) => current.update(
        (Menu? menu) {
          if (menu == null) return;
          menu.activationStack.add(menu.items.indexOf(item));
        },
      );

  void addItem(MenuElement item) => current.update(
        (SubMenu? menu) {
          display.items.add(item);
        },
      );

  void removeItem(MenuElement item) => current.update(
        (SubMenu? menu) {
          display.items.remove(item);
        },
      );

  // void enterTempCreate(MenuElement item) {
  //   _tempMenu = SubMenu(name: item.name, items: []).obs;

  // }
}
