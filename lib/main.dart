// ignore: depend_on_referenced_packages
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

import 'package:pos_shisha_bar/menu/providers/menu_provider.dart';
import 'package:pos_shisha_bar/menu/data.dart';

import 'package:pos_shisha_bar/menu/pages/create_page.dart';
import 'package:pos_shisha_bar/menu/pages/menu_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  Logger.level = Level.debug;
  runApp(const App());
}

class App extends StatefulWidget {
  final String addToMenuRoute = "AddToMenu";

  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  String? _selectedRoute;
  SubMenu? _menuToAddTo;
  bool show404 = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => RootMenu())],
      child: MaterialApp(
        home: Navigator(
          pages: [
            MaterialPage(
              key: const ValueKey("MenuScreen"),
              child: MenuPage(handleAddToMenu: _handleAddToMenu),
            ),
            if (show404)
              const MaterialPage(
                key: ValueKey('Error Page'),
                child: Center(
                  child: Text('404'),
                ),
              )
            else if (_selectedRoute == widget.addToMenuRoute)
              MaterialPage(
                key: ValueKey(_selectedRoute!),
                child: CreatePage(menu: _menuToAddTo!),
              )
          ],
          onPopPage: (route, result) {
            if (!route.didPop(result)) return false;

            setState(() {
              _selectedRoute = null;
              _menuToAddTo = null;
            });

            return true;
          },
        ),
      ),
    );
  }

  void _handleAddToMenu(Menu menu) {
    setState(() {
      _selectedRoute = widget.addToMenuRoute;
      _menuToAddTo = menu;
    });
  }
}
