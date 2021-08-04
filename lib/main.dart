import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'constants/constants.dart';
import 'router_config/application.dart';
import 'router_config/routers.dart';

void main() {
  runApp(AppRoot());
}

class AppRoot extends StatefulWidget {
  const AppRoot({Key? key}) : super(key: key);

  @override
  _AppRootState createState() => _AppRootState();
}

class _AppRootState extends State<AppRoot> {
  _AppRootState() {
    final router = FluroRouter();
    CDRoutes.configureRoutes(router);
    Application.router = router;
  }

  @override
  Widget build(BuildContext context) {
//    print("initial route = ${app.initialRoute}");
    return ScreenUtilInit(
        designSize: Size(360, 690),
        builder: () {
          return MaterialApp(
            title: '${Constants.APP_NAME}',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            onGenerateRoute: Application.router.generator,
          );
        });
  }
}
