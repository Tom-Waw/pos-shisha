import 'package:flutter/material.dart';

class OBMenu {
  String title;
  IconData icon;
  List<OBMenuCategory> categories;

  OBMenu({required this.title, required this.icon, required this.categories});
}

class OBMenuItem {
  String id;
  String name;

  OBMenuItem({required this.id, required this.name});
}

class OBMenuCategory extends OBMenuItem {
  List<OBMenuItem> items;

  OBMenuCategory({required id, required name, required this.items})
      : super(id: id, name: name);
}
