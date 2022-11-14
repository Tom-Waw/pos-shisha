import 'package:get/get.dart';
import 'package:pos_shisha_bar/menu/controller/menu_controller.dart';
import 'package:pos_shisha_bar/menu/services/api_service.dart';

class MenuBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ApiService());
    Get.put(MenuController());
  }
}
