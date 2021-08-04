import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/router_config/application.dart';

import './route_handlers.dart';

class CDRoutes {
  static String root = "/";
  static String mine = "/mine";


  static void configureRoutes(FluroRouter router) {
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      print("ROUTE WAS NOT FOUND !!!");
      return;
    });
    router.define(root, handler: mainHandler);
    router.define(mine, handler: mineHandler);
  }

  static void navigateTo(BuildContext context, String path,
      {
      bool replace = false,
      bool clearStack = false,
      bool maintainState = true,
      bool rootNavigator = false,
      TransitionType transition = TransitionType.cupertino,
      Duration? transitionDuration,
      RouteTransitionsBuilder? transitionBuilder,
      RouteSettings? routeSettings}) {
    Application.router.navigateTo(context, path,
        clearStack: clearStack,
        maintainState: maintainState,
        rootNavigator: rootNavigator,
        transition: transition,
        transitionBuilder: transitionBuilder,
        routeSettings: routeSettings);
  }
}
