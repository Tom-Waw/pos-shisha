import 'package:flutter/material.dart';
import 'package:pos_shisha_bar/menu/data.dart';

class Utils {
  static GlobalKey<NavigatorState> menuNav = GlobalKey();

  static List<Menu> loadMenus() => [
        Menu(name: "Getränke", icon: Icons.local_drink, items: [
          const MenuElement(name: "Random Drink"),
          SubMenu(
            name: "Alkoholische Getränke",
            items: [const MenuElement(name: "Gin Tonic")],
          )
        ]),
        Menu(name: "Essen", icon: Icons.food_bank, items: [
          SubMenu(
            name: "Nachspeisen",
            items: [const MenuElement(name: "Schwarzwälder Kirschkuchen")],
          ),
          const MenuElement(name: "Random Food"),
        ]),
        Menu(name: "Verschiedenes", icon: Icons.star, items: [
          SubMenu(
            name: "Shishas",
            items: [const MenuElement(name: "Apfel Minze")],
          ),
          const MenuElement(name: "Random Shisha"),
        ]),
      ];
}
