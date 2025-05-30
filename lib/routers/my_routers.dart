import 'package:ar_vr/screens/product_page.dart';
import 'package:get/get.dart';

import '../screens/splash_screen.dart';

class MyRouters {
  static var splash = "/splash";
  static var productPage = "/productPage";


  static var route = [
  GetPage(name: '/', page: () =>   SplashScreen()),
  GetPage(name: '/productPage', page: () =>   ProductPage())

  ];
}