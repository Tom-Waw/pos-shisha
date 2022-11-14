import 'package:flutter/material.dart';

import '../data.dart';

class CreatePage extends StatelessWidget {
  final SubMenu menu;

  final TextEditingController nameController = TextEditingController();

  CreatePage({Key? key, required this.menu}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Element hinzufügen"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 32.0,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: TextField(
                  controller: nameController,
                  onChanged: (v) => nameController.text = v,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Builder(
                builder: (context) {
                  return ElevatedButton(
                    onPressed: () {
                      MenuElement item = MenuElement(name: nameController.text);
                    },
                    child: const Text(
                      'Erstellen',
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
