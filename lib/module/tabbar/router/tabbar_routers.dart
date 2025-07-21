
import 'package:bloc_mvvm_architecture/core/router/base_module_route.dart';
import 'package:bloc_mvvm_architecture/module/tabbar/view/tab_page.dart';
import 'package:flutter/material.dart';

class TabbarModuleRoute extends BaseModuleRoute {
  @override
  String get moduleName => 'TabbarModule';

  @override
  String get entryPath => '/tabbar';

  @override
  Map<String, WidgetBuilder> get routes => {
    entryPath: (_) => const MainTabPage(),
   };

  @override
  List<String> get exportedPages => [
    entryPath,
  ];
}
