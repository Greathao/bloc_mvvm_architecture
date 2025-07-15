
import 'package:bloc_mvvm_architecture/core/router/base_module_route.dart';
import 'package:bloc_mvvm_architecture/module/home/view/pages/activity_page.dart';
import 'package:flutter/material.dart';
import '../view/pages/home_page.dart';

class HomeModuleRoute extends BaseModuleRoute {
  @override
  String get moduleName => 'HomeModule';

  @override
  String get entryPath => '/home';

  static const String activityPath = '/home/activity';

  @override
  Map<String, WidgetBuilder> get routes => {
    entryPath: (_) => const HomePage(),
    activityPath: (context) {
      final settings = ModalRoute.of(context)?.settings;
      final args = settings?.arguments;
      final query = Uri.tryParse(settings?.name ?? '')?.queryParameters ?? {};
      // 优先使用 arguments 中的 actId，fallback 用 URI query 参数
      final actId = args is Map && args['actId'] != null
          ? args['actId'].toString()
          : query['actId'] ?? '';

      return ActivityPage(actId: actId);
    },
  };

  @override
  List<String> get exportedPages => [entryPath, activityPath];
}
