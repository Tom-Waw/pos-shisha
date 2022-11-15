import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/menu_controller.dart';
import '../data.dart';

class MenuItemForm extends StatefulWidget {
  const MenuItemForm({super.key});

  @override
  State<MenuItemForm> createState() => _MenuItemStateForm();
}

class _MenuItemStateForm extends State<MenuItemForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final menuController = Get.find<MenuController>();

    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(
              hintText: "Artikelnamen eingeben",
            ),
            controller: _nameController,
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return "Bitte geben Sie einen Namen an";
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  menuController.addItem(
                    MenuElement(name: _nameController.text),
                  );
                  Get.back();
                }
              },
              child: const Text("Bestätigen"),
            ),
          ),
        ],
      ),
    );
  }
}
