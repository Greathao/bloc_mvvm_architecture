import 'package:flutter/material.dart';
import 'core/router/app_router.dart';
import 'module/mian_tab/view/main_tab_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: AppRouter.onGenerateRoute,
      home: const MainTabPage(),
    );
  }
}
