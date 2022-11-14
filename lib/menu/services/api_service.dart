import 'package:pos_shisha_bar/helpers/utils.dart';

import '../data.dart';

class ApiService {
  List<Menu> fetchMenus() {
    return Utils.loadMenus();
  }
}
