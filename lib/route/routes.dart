import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:hotel_manager/route/route_handlers.dart';
class Routes{
  static String root = '/';
  static String splashScreen = '/SplashScreen';
  static String mainScreen = '/MainScreen';
  static void configureRoutes(Router router) {
    router.notFoundHandler = new Handler(
      // ignore: missing_return
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
          print(
              '------> ROUTE WAS NOT FOUND !!! Go to routes.dart and route_handlers.dart and add your screen there <-------');
        });
    router.define(splashScreen, handler: splashScreenHandler);
    router.define(mainScreen, handler: mainScreenHandler);
  }
}
