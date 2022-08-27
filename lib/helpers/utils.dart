import 'package:flutter/material.dart';
import 'package:pos_shisha_bar/menu/data.dart';

class Utils {
  static GlobalKey<NavigatorState> menuNav = GlobalKey();

  static List<OBMenu> getMenus() {
    return [
      OBMenu(title: "Getränke", icon: Icons.local_drink, categories: [
        OBMenuCategory(
            id: "1",
            name: "Alkoholische Getränke",
            items: [OBMenuItem(id: "1", name: "Gin Tonic")])
      ]),
      OBMenu(title: "Essen", icon: Icons.food_bank, categories: [
        OBMenuCategory(
            id: "2",
            name: "Nachspeisen",
            items: [OBMenuItem(id: "1", name: "Schwarzwälder Kirschkuchen")])
      ]),
      OBMenu(title: "Verschiedenes", icon: Icons.star, categories: [
        OBMenuCategory(
            id: "3",
            name: "Shishas",
            items: [OBMenuItem(id: "1", name: "Apfel Minze")])
      ]),
    ];
  }
}
