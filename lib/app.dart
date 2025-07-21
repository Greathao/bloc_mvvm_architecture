import 'package:bloc_mvvm_architecture/module/tabbar/router/tabbar_routers.dart';
import 'package:flutter/material.dart';
import 'core/router/app_router.dart';
import 'module/tabbar/view/tab_page.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: TabbarModuleRoute().entryPath,
      routes: AppRouter.routes,
    );
  }
}
