import 'package:api_cording/controller/wallpaper_services.dart';
import 'package:api_cording/model/wallpaper.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController {
  bool isLoading = false;
  Map<String, List<Wallpaper>> wallpapers = {};

  vmGetwallpaperData(String category) async {
    isLoading = true;
    update();
    wallpapers[category] = await WallpaperServices().fatchNature(category);
    isLoading =false;
    update();
  }

  List<Wallpaper> vmWallpapers(String category) {
    return wallpapers[category] ?? [];
  }
}
