// module/profile/router/profile_module_route.dart

import 'package:bloc_mvvm_architecture/core/router/base_module_route.dart';
import 'package:bloc_mvvm_architecture/module/profile/view/pages/profile_edit_page.dart';
import 'package:bloc_mvvm_architecture/module/profile/view/pages/profile_page.dart';
import 'package:flutter/material.dart';

class ProfileModuleRoute extends BaseModuleRoute {
  @override
  String get moduleName => 'ProfileModule';

  @override
  String get entryPath => '/profile';

  static const String editPath = '/profile/edit';

  @override
  Map<String, WidgetBuilder> get routes => {
    entryPath: (_) => const ProfilePage(),
    editPath: (_) => const ProfileEditPage(),
  };

  @override
  List<String> get exportedPages => [
    entryPath,
    editPath,
  ];
}
