
import 'package:bloc_mvvm_architecture/module/tabbar/view/tab_page.dart';
import 'package:flutter/material.dart';
import 'core/router/app_router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: AppRouter.routes,
        home: MainTabPage(),
    );
  }
}





