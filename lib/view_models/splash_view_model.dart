import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../views/main_tab/main_tab_view.dart';


class SplashViewModel extends GetxController {

  var scaffoldKey = GlobalKey<ScaffoldState>();

  void loadView() async {
    await Future.delayed(const Duration(seconds: 3) );
    Get.to( () => const MainTabView() );
  }

  void openDrawer(){
    scaffoldKey.currentState?.openDrawer();
  }

  void closeDrawer(){
    scaffoldKey.currentState?.closeDrawer();
  }
}